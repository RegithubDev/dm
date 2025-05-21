package com.resustainability.reisp.controller;

import com.azure.identity.DefaultAzureCredentialBuilder;
import com.azure.core.credential.AccessToken;
import com.azure.core.credential.TokenRequestContext;
import org.json.JSONArray;
import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

import org.json.JSONArray;
import org.json.JSONObject;

public class AzureOpenAIBlobSearch {
    public static void main(String[] args) {
        try {
            // Replace with your actual values
            String openaiEndpoint = "https://openairesl.openai.azure.com/openai/deployments/gpt-35-turbo-16k/chat/completions?api-version=2025-01-01-preview";
            String apiKey = "2WIpHXdCrn8tQMRtaaYLqJBXYgcf9bCOWUX3u7CcL1YGTssMFxBRJQQJ99BDACYeBjFXJ3w3AAABACOG9brY";

            String azureSearchEndpoint = "https://openairesl.search.windows.net";
            String azureSearchIndex = "openai";  // Replace with your actual index name
            String azureSearchKey = "KPqzHD0JWe2zJG3sbmAPITGGGCM0z5QMmSmcf74ZvtAzSeChMcwk";

            // Prepare request JSON
            JSONObject requestBody = new JSONObject();
            JSONArray messages = new JSONArray();

            messages.put(new JSONObject().put("role", "system").put("content", "You are an AI assistant that helps users by answering based on provided documents and context."));
            messages.put(new JSONObject().put("role", "user").put("content", "who is heading HR practice? #hrms"));

            requestBody.put("messages", messages);
            requestBody.put("temperature", 0.7);
            requestBody.put("max_tokens", 800);
            requestBody.put("top_p", 0.95);
            requestBody.put("frequency_penalty", 0);
            requestBody.put("presence_penalty", 0);

            // Add Azure Search as a data source
            JSONObject authentication = new JSONObject()
                    .put("type", "api_key")
                    .put("key", azureSearchKey);

            JSONObject searchParams = new JSONObject()
                    .put("endpoint", azureSearchEndpoint)
                    .put("index_name", azureSearchIndex)
                    .put("authentication", authentication);

            JSONObject dataSource = new JSONObject()
                    .put("type", "azure_search")
                    .put("parameters", searchParams);

            JSONArray dataSources = new JSONArray();
            dataSources.put(dataSource);

            requestBody.put("data_sources", dataSources);

            // Send HTTP request
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(openaiEndpoint))
                    .timeout(Duration.ofSeconds(60))
                    .header("Content-Type", "application/json")
                    .header("api-key", apiKey)
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody.toString()))
                    .build();

            HttpClient client = HttpClient.newHttpClient();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // Print result
            System.out.println("Response:");
            System.out.println(response.body());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
