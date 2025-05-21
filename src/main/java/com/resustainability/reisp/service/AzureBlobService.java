package com.resustainability.reisp.service;

import com.azure.storage.blob.*;
import com.azure.storage.blob.models.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.*;

@Service
public class AzureBlobService {
    private static final String CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=openairesl;AccountKey=DEOT0qQJY3BBofHFoGCADnsawejibL/LRBhrTbTu15crBK3sldnFMUkHftmqRjueVVG8rhOEyP45+AStduHW4A==;EndpointSuffix=core.windows.net";

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
    
 // List all files in a specific container
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

    // Read the content of a text file from blob as String
    public String readBlobContent(String containerName, String fileName) {
        try (InputStream inputStream = getBlobFile(containerName, fileName);
             Scanner scanner = new Scanner(inputStream, "UTF-8")) {
            scanner.useDelimiter("\\A"); // read entire stream
            return scanner.hasNext() ? scanner.next() : "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

}
