package com.resustainability.reisp.controller;

import com.azure.core.credential.TokenCredential;
import com.azure.core.credential.TokenRequestContext;
import com.azure.identity.DefaultAzureCredential;
import com.azure.identity.DefaultAzureCredentialBuilder;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.theokanning.openai.client.OpenAiApi;
import com.theokanning.openai.service.OpenAiService;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.io.IOException;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

public class AzureOpenAIClient {

    public static void main(String[] args) throws IOException {
        // Environment variables
        String endpoint = System.getenv("ENDPOINT_URL") != null ? 
            System.getenv("ENDPOINT_URL") : "https://openairesl.openai.azure.com/";
        String deployment = System.getenv("DEPLOYMENT_NAME") != null ? 
            System.getenv("DEPLOYMENT_NAME") : "gpt-35-turbo-16k";
        String cognitiveServicesResource = System.getenv("AZURE_COGNITIVE_SERVICES_RESOURCE") != null ?
            System.getenv("AZURE_COGNITIVE_SERVICES_RESOURCE") : "YOUR_COGNITIVE_SERVICES_RESOURCE";
        String searchEndpoint = System.getenv("AZURE_AI_SEARCH_ENDPOINT");
        String searchIndex = System.getenv("AZURE_AI_SEARCH_INDEX");

        // Create token provider
        TokenCredential credential = new DefaultAzureCredentialBuilder().build();
        String token = credential.getTokenSync(
            new TokenRequestContext().addScopes(cognitiveServicesResource + "/.default"))
            .getToken();

        // Create OpenAiService with custom token provider
        OkHttpClient client = new OkHttpClient.Builder()
            .addInterceptor(chain -> {
                chain.request().newBuilder()
                    .header("Authorization", "Bearer " + token)
                    .header("api-key", token) // Azure OpenAI often requires both
                    .build();
                return chain.proceed(chain.request());
            })
            .connectTimeout(30, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .writeTimeout(30, TimeUnit.SECONDS)
            .build();

        Retrofit retrofit = new Retrofit.Builder()
            .baseUrl(endpoint)
            .client(client)
            .addConverterFactory(JacksonConverterFactory.create())
            .build();

        OpenAiApi api = retrofit.create(OpenAiApi.class);
        OpenAiService service = new OpenAiService(api);

        // Create request body
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode requestBody = mapper.createObjectNode();
        
        // Add model
        requestBody.put("model", deployment);
        
        // Add messages array (empty in this case)
        requestBody.set("messages", mapper.createArrayNode());
        
        // Add parameters
        requestBody.put("max_tokens", 800);
        requestBody.put("temperature", 0.7);
        requestBody.put("top_p", 0.95);
        requestBody.put("frequency_penalty", 0);
        requestBody.put("presence_penalty", 0);
        
        // Add extra_body with data sources
        ObjectNode extraBody = mapper.createObjectNode();
        ArrayNode dataSources = mapper.createArrayNode();
        ObjectNode dataSource = mapper.createObjectNode();
        
        dataSource.put("type", "azure_search");
        
        ObjectNode parameters = mapper.createObjectNode();
        parameters.put("endpoint", searchEndpoint);
        parameters.put("index_name", searchIndex);
        
        ObjectNode authentication = mapper.createObjectNode();
        authentication.put("type", "system_assigned_managed_identity");
        parameters.set("authentication", authentication);
        
        dataSource.set("parameters", parameters);
        dataSources.add(dataSource);
        extraBody.set("data_sources", dataSources);
        
        requestBody.set("extra_body", extraBody);

        // Make the API call
        try {
            String response = service.createChatCompletion(requestBody.toString());
            System.out.println(new ObjectMapper().writerWithDefaultPrettyPrinter()
                .writeValueAsString(new ObjectMapper().readTree(response)));
        } catch (Exception e) {
            System.err.println("Error calling Azure OpenAI: " + e.getMessage());
            e.printStackTrace();
        }
    }
}