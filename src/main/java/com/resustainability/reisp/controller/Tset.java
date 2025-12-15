package com.resustainability.reisp.controller;

import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import com.azure.storage.blob.models.BlobContainerItem;
import com.azure.storage.blob.models.BlobItem;

public class Tset {

    private static final String CONNECTION_STRING = 
        "DefaultEndpointsProtocol=https;AccountName=openairesl;AccountKey=DEOT0qQJY3BBofHFoGCADnsawejibL/LRBhrTbTu15crBK3sldnFMUkHftmqRjueVVG8rhOEyP45+AStduHW4A==;EndpointSuffix=core.windows.net";

    public static void main(String[] args) {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(CONNECTION_STRING)
                .buildClient();

        long totalBytes = 0;
        long totalDocs = 0;

        // Calculate total used space and total document count across all containers
        for (BlobContainerItem containerItem : blobServiceClient.listBlobContainers()) {
            BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerItem.getName());

            for (BlobItem blobItem : containerClient.listBlobs()) {
                Long size = blobItem.getProperties().getContentLength();
                if (size != null) {
                    totalBytes += size;
                }
                totalDocs++; // count every blob
            }
        }

        System.out.println("Occupied Storage: " + humanReadableByteCount(totalBytes));
        System.out.println("Total Documents: " + totalDocs);

        // (Optional) Allotted quota – typically based on SKU
        long allottedBytes = 15L * 1024 * 1024 * 1024 * 1024 * 1024; // ~5 PB
        System.out.println("Allotted Storage: " + humanReadableByteCount(allottedBytes));
    }

    // Convert bytes to KB/MB/GB/TB dynamically
    private static String humanReadableByteCount(long bytes) {
        if (bytes < 1024) return bytes + " B";
        int exp = (int) (Math.log(bytes) / Math.log(1024));
        String pre = "KMGTG".charAt(exp - 1) + "B";
        return String.format("%.2f %s", bytes / Math.pow(1024, exp), pre);
    }
}
