package com.resustainability.reisp.controller;

import java.nio.charset.StandardCharsets;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;

// Azure Blob Storage
import com.azure.storage.blob.*;
import com.azure.storage.blob.models.*;

// Jackson for JSON
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

// OkHttp for HTTP requests to Azure OpenAI
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@RestController
public class ReconnectController {

    private static final String STORAGE_CONNECTION_STRING =
        "DefaultEndpointsProtocol=https;AccountName=openairesl;AccountKey=DEOT0qQJY3BBofHFoGCADnsawejibL/LRBhrTbTu15crBK3sldnFMUkHftmqRjueVVG8rhOEyP45+AStduHW4A==;EndpointSuffix=core.windows.net";

    private static final String OPENAI_API_KEY = "2WIpHXdCrn8tQMRtaaYLqJBXYgcf9bCOWUX3u7CcL1YGTssMFxBRJQQJ99BDACYeBjFXJ3w3AAABACOG9brY";
    private static final String OPENAI_ENDPOINT =
        "https://openairesl.openai.azure.com/openai/deployments/openairesl-embedding-ada-002/embeddings?api-version=2025-01-01-preview";

    @RequestMapping(value = "/reconnect-index", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
    public ResponseEntity<String> reconnectIndex(@org.springframework.web.bind.annotation.RequestBody Map<String, String> body) {
        String indexName = body.get("indexName");

        try {
            BlobServiceClient blobServiceClient =
                new BlobServiceClientBuilder().connectionString(STORAGE_CONNECTION_STRING).buildClient();

            for (BlobContainerItem containerItem : blobServiceClient.listBlobContainers()) {
                BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerItem.getName());

                for (BlobItem blobItem : containerClient.listBlobs()) {
                    BlobClient blobClient = containerClient.getBlobClient(blobItem.getName());
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    blobClient.download(outputStream);
                    String content = outputStream.toString(StandardCharsets.UTF_8);

                    float[] embedding = generateEmbedding(content);
                    // You can now push `embedding` + `content` into Azure Cognitive Search or a DB
                }
            }

            return ResponseEntity.ok("Reconnected and reindexed successfully.");

        } catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed: " + ex.getMessage());
        }
    }

    private float[] generateEmbedding(String text) throws IOException {
        OkHttpClient client = new OkHttpClient();
        MediaType mediaType = MediaType.get("application/json");

        String json = String.format("{\"input\": %s}", new ObjectMapper().writeValueAsString(text));

        RequestBody body = RequestBody.create(json, mediaType);
        Request request = new Request.Builder()
            .url(OPENAI_ENDPOINT)
            .post(body)
            .addHeader("Content-Type", "application/json")
            .addHeader("api-key", OPENAI_API_KEY)
            .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            JsonNode jsonNode = new ObjectMapper().readTree(response.body().string());
            JsonNode vectorNode = jsonNode.get("data").get(0).get("embedding");

            float[] embedding = new float[vectorNode.size()];
            for (int i = 0; i < vectorNode.size(); i++) {
                embedding[i] = (float) vectorNode.get(i).asDouble();
            }
            return embedding;
        }
    }
}
