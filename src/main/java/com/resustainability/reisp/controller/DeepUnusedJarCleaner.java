package com.resustainability.reisp.controller;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.jar.*;
import java.util.regex.*;

public class DeepUnusedJarCleaner {

    public static void main(String[] args) throws Exception {

        // Use current directory if no argument is passed
        String projectPath = (args.length == 0) 
                ? new File(".").getCanonicalPath()
                : args[0];

        System.out.println("📁 Project Directory: " + projectPath);

        File projectDir = new File(projectPath);
        File libDir = new File(projectDir, "lib");

        if (!libDir.exists()) {
            System.out.println("❌ ERROR: lib folder not found in project directory.");
            return;
        }

        File unusedDir = new File(projectDir, "unused-jars");
        unusedDir.mkdirs();

        // 1️⃣ Read ALL project files
        System.out.println("\n🔍 Scanning ALL project files...");
        List<String> allProjectText = new ArrayList<>();

        Files.walk(projectDir.toPath())
                .filter(Files::isRegularFile)
                .forEach(path -> {
                    try {
                        // Read all text files regardless of type
                        String content = Files.readString(path);
                        allProjectText.add(content);
                    } catch (Exception ignored) {}
                });

        // 2️⃣ Get ALL JAR files
        System.out.println("\n📦 Scanning JAR files in lib/");
        File[] jarFiles = libDir.listFiles((dir, name) -> name.endsWith(".jar"));

        if (jarFiles == null || jarFiles.length == 0) {
            System.out.println("❌ No jar files found in lib/");
            return;
        }

        // 3️⃣ Extract CLASS names from each JAR
        Map<File, Set<String>> jarClassMap = new HashMap<>();

        for (File jar : jarFiles) {
            Set<String> classes = new HashSet<>();

            try (JarFile jarFile = new JarFile(jar)) {
                jarFile.stream()
                        .filter(e -> e.getName().endsWith(".class"))
                        .forEach(e -> {
                            String className = e.getName()
                                    .replace("/", ".")
                                    .replace(".class", "");
                            classes.add(className.substring(className.lastIndexOf(".") + 1));  // Simple class name
                        });
            } catch (Exception ignored) {}

            jarClassMap.put(jar, classes);
            System.out.println("✔ Loaded classes from " + jar.getName());
        }

        // 4️⃣ Search jar name and class usage in project files
        System.out.println("\n🧠 Analyzing usage...");

        List<String> allContent = allProjectText;

        for (File jar : jarFiles) {

            boolean used = false;

            // Check if jar filename appears anywhere
            for (String fileContent : allContent) {
                if (fileContent.contains(jar.getName())) {
                    used = true;
                    break;
                }
            }

            // Check if any class from jar is imported in project
            if (!used) {
                Set<String> classes = jarClassMap.get(jar);

                for (String className : classes) {
                    for (String content : allContent) {
                        if (content.contains(className)) {
                            used = true;
                            break;
                        }
                    }
                    if (used) break;
                }
            }

            if (!used) {
                System.out.println("🟥 UNUSED → " + jar.getName());

                Files.move(
                        jar.toPath(),
                        new File(unusedDir, jar.getName()).toPath(),
                        StandardCopyOption.REPLACE_EXISTING
                );
            } else {
                System.out.println("🟩 USED → " + jar.getName());
            }
        }

        System.out.println("\n✨ Cleanup complete!");
        System.out.println("Unused jars moved to: " + unusedDir.getAbsolutePath());
    }
}
