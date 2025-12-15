package com.resustainability.reisp.service;

import com.azure.storage.blob.*;
import com.azure.storage.blob.models.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.*;

import javax.servlet.http.HttpSession;

@Service
public class AzureBlobService {


    public Map<String, Map<String, Object>> getAllContainersAndFiles(String cs) {
        Map<String, Map<String, Object>> result = new LinkedHashMap<>();
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(cs)
                .buildClient();

        long totalBytes = 0;
        long totalDocs = 0;

        // Loop through containers
        for (BlobContainerItem containerItem : blobServiceClient.listBlobContainers()) {
            String containerName = containerItem.getName();
            BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);

            long blobCount = 0;
            long usedBytes = 0;
            List<String> fileNames = new ArrayList<>();

            // Collect blob names and sizes
            for (BlobItem blobItem : containerClient.listBlobs()) {
                fileNames.add(blobItem.getName());
                Long size = blobItem.getProperties().getContentLength();
                if (size != null) {
                    usedBytes += size;
                }
                blobCount++;
            }

            totalBytes += usedBytes;
            totalDocs += blobCount;

            // Container info
            Map<String, Object> info = new LinkedHashMap<>();
            info.put("blobCount", blobCount);
            info.put("usedBytes", usedBytes);
            info.put("used", humanReadableByteCount(usedBytes)); // dynamic units
            info.put("fileNames", fileNames);
            result.put(containerName, info);
        }

        // Total storage info
        long quotaBytes = 15L * 1024 * 1024 * 1024; // Example: 15 GB quota (Basic tier)
        long freeBytes = quotaBytes - totalBytes;

        Map<String, Object> storageInfo = new LinkedHashMap<>();
        storageInfo.put("totalUsedBytes", totalBytes);
        storageInfo.put("totalUsed", humanReadableByteCount(totalBytes));
        storageInfo.put("quotaBytes", quotaBytes);
        storageInfo.put("quota", humanReadableByteCount(quotaBytes));
        storageInfo.put("freeBytes", freeBytes);
        storageInfo.put("free", humanReadableByteCount(freeBytes));
        storageInfo.put("totalDocs", totalDocs);
        result.put("__STORAGE_INFO__", storageInfo);

        return result;
    }

    // Converts bytes to dynamic B/KB/MB/GB/TB
    private static String humanReadableByteCount(long bytes) {
        if (bytes < 1024) return bytes + " B";
        int exp = (int) (Math.log(bytes) / Math.log(1024));
        String pre = "KMGTPE".charAt(exp - 1) + "B";
        return String.format("%.2f %s", bytes / Math.pow(1024, exp), pre);
    }


//    public void createContainer(String containerName) {
//        BlobServiceClient client = new BlobServiceClientBuilder()
//                .connectionString(CONNECTION_STRING)
//                .buildClient();
//        client.createBlobContainer(containerName);
//    }
//
//    public void deleteContainer(String containerName) {
//        BlobServiceClient client = new BlobServiceClientBuilder()
//                .connectionString(CONNECTION_STRING)
//                .buildClient();
//
//        BlobContainerClient containerClient = client.getBlobContainerClient(containerName);
//        if (containerClient.exists()) {
//            containerClient.delete();
//        } else {
//            throw new RuntimeException("Container does not exist.");
//        }
//    }

    public void uploadFile(String containerName, MultipartFile file, String cs) throws Exception {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(cs)
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
    public void deleteFile(String containerName, String fileName, String cs) throws Exception {
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
                .connectionString(cs)
                .buildClient();

        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);
        BlobClient blobClient = containerClient.getBlobClient(fileName);

        if (blobClient.exists()) {
            blobClient.delete();
        } else {
            throw new FileNotFoundException("File not found: " + fileName);
        }
    }

//    public InputStream getBlobFile(String containerName, String fileName) {
//        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
//                .connectionString(CONNECTION_STRING)
//                .buildClient();
//        return blobServiceClient.getBlobContainerClient(containerName)
//                .getBlobClient(fileName)
//                .openInputStream();
//    }
//    
// // List all files in a specific container
//    public List<String> listFilesInContainer(String containerName) {
//        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
//                .connectionString(CONNECTION_STRING)
//                .buildClient();
//        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);
//
//        List<String> fileNames = new ArrayList<>();
//        for (BlobItem blobItem : containerClient.listBlobs()) {
//            fileNames.add(blobItem.getName());
//        }
//        return fileNames;
//    }

    // Read the content of a text file from blob as String
//    public String readBlobContent(String containerName, String fileName) {
//        try (InputStream inputStream = getBlobFile(containerName, fileName);
//             Scanner scanner = new Scanner(inputStream, "UTF-8")) {
//            scanner.useDelimiter("\\A"); // read entire stream
//            return scanner.hasNext() ? scanner.next() : "";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "";
//        }
//    }

}
