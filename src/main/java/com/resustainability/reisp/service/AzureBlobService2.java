package com.resustainability.reisp.service;

import com.azure.storage.blob.*;
import com.azure.storage.blob.models.*;
import org.apache.tika.Tika;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class AzureBlobService2 {
    private static final String CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=openairesl;AccountKey=DEOT0qQJY3BBofHFoGCADnsawejibL/LRBhrTbTu15crBK3sldnFMUkHftmqRjueVVG8rhOEyP45+AStduHW4A==;EndpointSuffix=core.windows.net";
    private static final String OPENAI_ENDPOINT = "https://openairesl.openai.azure.com";
    private static final String OPENAI_API_KEY = "2WIpHXdCrn8tQMRtaaYLqJBXYgcf9bCOWUX3u7CcL1YGTssMFxBRJQQJ99BDACYeBjFXJ3w3AAABACOG9brY";
    private static final String OPENAI_EMBEDDING_DEPLOYMENT = "gpt-35-turbo";
    private static final String COG_SEARCH_ENDPOINT = "https://openairesl.search.windows.net";
    private static final String COG_SEARCH_API_KEY = "KPqzHD0JWe2zJG3sbmAPITGGGCM0z5QMmSmcf74ZvtAzSeChMcwk";
    private static final String COG_INDEX_NAME = "openai";

    public Map<String, List<String>> getAllContainersAndFiles() {
        Map<String, List<String>> result = new LinkedHashMap<>();
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();

        for (BlobContainerItem containerItem : blobServiceClient.listBlobContainers()) {
            String containerName = containerItem.getName();  
            BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);

            List<String> fileNames = new ArrayList<>();
            for (BlobItem blobItem : containerClient.listBlobs()) {
                fileNames.add(blobItem.getName());
            }
            result.put(containerName, fileNames);
        }
        return result;
    }

    public void createContainer(String containerName) {
        BlobServiceClient client = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();
        client.createBlobContainer(containerName);
    }

    public void deleteContainer(String containerName) {
        BlobServiceClient client = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();

        BlobContainerClient containerClient = client.getBlobContainerClient(containerName);
        if (containerClient.exists()) {
            containerClient.delete();
        } else {
            throw new RuntimeException("Container does not exist.");
        }
    }

    public void uploadFile(String containerName, MultipartFile file) throws Exception {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();

        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);
        if (!containerClient.exists()) {
            containerClient = blobServiceClient.createBlobContainer(containerName);
        }

        BlobClient blobClient = containerClient.getBlobClient(file.getOriginalFilename());
        try (InputStream inputStream = file.getInputStream()) {
            blobClient.upload(inputStream, file.getSize(), true);
        }

        // Extract text from file
        String text = extractTextFromInputStream(file.getInputStream());
        
        // Get embeddings
        List<Double> embedding = getEmbedding(text);

        // Index to Cognitive Search
        indexToCognitiveSearch(UUID.randomUUID().toString(), text, embedding);
    }

    public void deleteFile(String containerName, String fileName) throws Exception {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();

        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);
        BlobClient blobClient = containerClient.getBlobClient(fileName);

        if (blobClient.exists()) {
            blobClient.delete();
        } else {
            throw new FileNotFoundException("File not found: " + fileName);
        }
    }

    public InputStream getBlobFile(String containerName, String fileName) {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();
        return blobServiceClient.getBlobContainerClient(containerName)
                .getBlobClient(fileName)
                .openInputStream();
    }

    public List<String> listFilesInContainer(String containerName) {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();
        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);

        List<String> fileNames = new ArrayList<>();
        for (BlobItem blobItem : containerClient.listBlobs()) {
            fileNames.add(blobItem.getName());
        }
        return fileNames;
    }

    public String readBlobContent(String containerName, String fileName) {
        try (InputStream inputStream = getBlobFile(containerName, fileName);
             Scanner scanner = new Scanner(inputStream, "UTF-8")) {
            scanner.useDelimiter("\\A");
            return scanner.hasNext() ? scanner.next() : "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String extractTextFromInputStream(InputStream inputStream) throws Exception {
        Tika tika = new Tika();
        return tika.parseToString(inputStream);
    }

    public List<Double> getEmbedding(String text) throws Exception {
    	URI uri = URI.create(OPENAI_ENDPOINT + "/openai/deployments/" + OPENAI_EMBEDDING_DEPLOYMENT + "/embeddings?api-version=2023-05-15");
    	URL url = uri.toURL();        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("api-key", OPENAI_API_KEY);
        conn.setDoOutput(true);

        String inputJson = "{\"input\": \"" + text.replace("\"", "\\\"") + "\"}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(inputJson.getBytes(StandardCharsets.UTF_8));
        }

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String response = reader.lines().collect(Collectors.joining());
            int start = response.indexOf("[", response.indexOf("\"embedding\""));
            int end = response.indexOf("]", start);
            String array = response.substring(start + 1, end);
            return Arrays.stream(array.split(","))
                    .map(String::trim)
                    .map(Double::parseDouble)
                    .collect(Collectors.toList());
        }
    }

    public void indexToCognitiveSearch(String id, String content, List<Double> embedding) throws Exception {
    	URI uri = URI.create(COG_SEARCH_ENDPOINT + "/indexes/" + COG_INDEX_NAME + "/docs/index?api-version=2023-07-01-Preview");
    	URL url = uri.toURL();
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("api-key", COG_SEARCH_API_KEY);
        conn.setDoOutput(true);

        String embeddingJson = embedding.toString();
        String payload = String.format("""
          {
            \"value\": [
              {
                \"@search.action\": \"upload\",
                \"id\": \"%s\",
                \"content\": \"%s\",
                \"embedding\": %s
              }
            ]
          }
        """, id, content.replace("\"", "\\\""), embeddingJson);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(payload.getBytes(StandardCharsets.UTF_8));
        }

        if (conn.getResponseCode() >= 300) {
            throw new RuntimeException("Failed to index: " + conn.getResponseMessage());
        }
    }
}
