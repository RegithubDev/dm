package com.resustainability.reisp.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.Collectors;

public class AzureOpenAIEmbeddingTest {

    private static final String OPENAI_ENDPOINT = "https://openairesl.openai.azure.com";
    private static final String OPENAI_API_KEY = "2WIpHXdCrn8tQMRtaaYLqJBXYgcf9bCOWUX3u7CcL1YGTssMFxBRJQQJ99BDACYeBjFXJ3w3AAABACOG9brY";
    private static final String DEPLOYMENT_NAME = "embedding-model"; // Your deployment name

    public static void main(String[] args) {
        String text = "This is a test embedding request from Java.";
        try {
            List<Double> embedding = getEmbedding(text);
            System.out.println("Embedding size: " + embedding.size());
            System.out.println("Sample embedding values:");
            embedding.stream().limit(10).forEach(System.out::println); // Show first 10 values
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Double> getEmbedding(String text) throws Exception {
        URI uri = URI.create(OPENAI_ENDPOINT + "/openai/deployments/" + DEPLOYMENT_NAME + "/embeddings?api-version=2023-05-15");
        URL url = uri.toURL();

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("api-key", OPENAI_API_KEY);
        conn.setDoOutput(true);

        String inputJson = "{\"input\": \"" + text.replace("\"", "\\\"") + "\", \"model\": \"text-embedding-ada-002\"}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(inputJson.getBytes(StandardCharsets.UTF_8));
        }

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            try (BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()))) {
                String errorResponse = errorReader.lines().collect(Collectors.joining("\n"));
                throw new RuntimeException("Failed to get embedding: " + errorResponse);
            }
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
}
