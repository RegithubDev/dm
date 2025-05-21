package com.resustainability.reisp.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.resustainability.reisp.common.CommonMethods;
import com.resustainability.reisp.common.DateForUser;
import com.resustainability.reisp.common.EMailSender;
import com.resustainability.reisp.constants.PageConstants;
import com.resustainability.reisp.model.User;
import com.resustainability.reisp.model.BrainBox;
import com.resustainability.reisp.model.Project;
import com.resustainability.reisp.model.ProjectLocation;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.User;
import com.resustainability.reisp.model.UserPaginationObject;
import com.resustainability.reisp.service.AzureBlobService;
import com.resustainability.reisp.service.AzureBlobService2;
import com.resustainability.reisp.service.UserService;
import com.resustainability.reisp.controller.LoginController;
import com.resustainability.reisp.dao.UserDao;
import com.azure.storage.blob.models.BlobItem;
import com.azure.storage.blob.sas.BlobSasPermission;
import com.azure.storage.blob.sas.BlobServiceSasSignatureValues;
import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import com.azure.storage.blob.BlobServiceClient;
import com.azure.storage.blob.specialized.BlobInputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import org.springframework.ui.Model;

@Controller
public class LoginController {
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    } 
	Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	UserService service;
	
	@Autowired
	UserService service2;

	@Autowired
	private AzureBlobService azureBlobService;
	
	@Value("${Logout.Message}")
	private String logOutMessage;
	
	@Value("${Login.Form.Invalid}")
	public String invalidUserName;

	@Value("${record.dataexport.success}")
	public String dataExportSucess;
	
	@Value("${record.dataexport.invalid.directory}")
	public String dataExportInvalid;
	
	@Value("${record.dataexport.error}")
	public String dataExportError;
	
	@Value("${record.dataexport.nodata}")
	public String dataExportNoData;
	
	@Value("${template.upload.common.error}")
	public String uploadCommonError;
	
	@Value("${template.upload.formatError}")
	public String uploadformatError;
	
	@Value("${common.error.message}")
	public String commonError;
	
	@RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView basePage(@ModelAttribute User user, HttpSession session,HttpServletRequest request) {
		ModelAndView model = new ModelAndView(PageConstants.login);
		List<User> objsList = null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView login(@ModelAttribute User user, HttpSession session,HttpServletRequest request,RedirectAttributes attributes) {
		ModelAndView model = new ModelAndView(PageConstants.login);
		User userDetails = null;
		try {
			if(!StringUtils.isEmpty(user) && !StringUtils.isEmpty(user.getUserId())&& !StringUtils.isEmpty(user.getPassword())){
				userDetails = service.validateUser(user);
				if(!StringUtils.isEmpty(userDetails)) {
					//if((userDetails.getSession_count()) == 0) {
						model.setViewName("redirect:/home");
						model = new ModelAndView(PageConstants.HOME);
						session.setAttribute("user", userDetails);
						session.setAttribute("UserId", userDetails.getUserId());
						session.setAttribute("USER_NAME", userDetails.getUserName());
						session.setAttribute("DisplayName", userDetails.getDisplayName());
						session.setAttribute("EmailId", userDetails.getEmailId());
						session.setAttribute("RoleTypeId", userDetails.getRoleTypeId());
						attributes.addFlashAttribute("welcome", "welcome "+userDetails.getUserName());
					
				}else {
				model.addObject("message", "Wrong credentials!");
				model.setViewName(PageConstants.login);
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model; 
	}

	
	@RequestMapping(value = "/home", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView user(@ModelAttribute User user, HttpSession session) {
	    ModelAndView model = new ModelAndView("home");
	    try {
	        Map<String, List<String>> blobData = azureBlobService.getAllContainersAndFiles();
	        model.addObject("blobData", blobData);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return model;
	}
	 private static List<String> extractDocReferences(String content) {
	        List<String> refs = new ArrayList<>();
	        Matcher matcher = Pattern.compile("\\[(doc\\d+)]").matcher(content);
	        while (matcher.find()) {
	            refs.add(matcher.group(1));
	        }
	        return refs;
	    }
	 List<PreviousQA> historyList = new ArrayList<>();

	@RequestMapping(value = "/askAI", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String askAI(@RequestParam("question") String question, @RequestParam("deploy") String deploy) {
	    try {
	    	// Your existing variables
	    	String endpoint = "https://openairesl.openai.azure.com/openai/deployments/" + deploy + "/chat/completions?api-version=2025-01-01-preview";
	    	String apiKey = "2WIpHXdCrn8tQMRtaaYLqJBXYgcf9bCOWUX3u7CcL1YGTssMFxBRJQQJ99BDACYeBjFXJ3w3AAABACOG9brY";

	    	String searchEndpoint = "https://openairesl.search.windows.net";
	    	String searchIndex = "openai";
	    	String searchKey = "KPqzHD0JWe2zJG3sbmAPITGGGCM0z5QMmSmcf74ZvtAzSeChMcwk";

	    	// Prepare the messages list
	    	List<JSONObject> messages = new ArrayList<>();

	    	// Add system prompt (added only once)
	    	JSONObject systemPrompt = new JSONObject();
	    	systemPrompt.put("role", "system");
	    	systemPrompt.put("content", "You are a helpful assistant. Use your general knowledge to answer the user's question.");
	    	messages.add(systemPrompt);

	    	// Add previous history (loop over the history list and add user and assistant messages)
	    	for (PreviousQA qa : historyList) {
	    	    // Add user's previous question
	    	    JSONObject userMsg = new JSONObject();
	    	    userMsg.put("role", "user");
	    	    userMsg.put("content", qa.getQuestion());
	    	    messages.add(userMsg);

	    	    // Add assistant's previous answer
	    	    JSONObject assistantMsg = new JSONObject();
	    	    assistantMsg.put("role", "assistant");
	    	    assistantMsg.put("content", qa.getAnswer());
	    	    messages.add(assistantMsg);
	    	}

	    	// Add the new user question (current question)
	    	JSONObject newUserMessage = new JSONObject();
	    	newUserMessage.put("role", "user");
	    	newUserMessage.put("content", question);  // assuming `question` is the new user's input
	    	messages.add(newUserMessage);

	    	// Safely escape the question
	    	String safeQuestion = JSONObject.quote(question);

	    	// Conditional retrieval tool for GPT-4
	    	String retrievalTool = "";
	    	if ("gpt-4".equalsIgnoreCase(deploy)) {
	    	    retrievalTool = """
	    	      "tools": [
	    	        { "type": "retrieval" }
	    	      ],
	    	      "tool_choice": "auto",
	    	    """;
	    	}

	    	// Build JSON request body
	    	String requestBody = String.format("""
	    	{
	    	  "messages": %s,
	    	  %s
	    	  "temperature": 1,
	    	  "max_tokens": 4096,
	    	  "top_p": 1,
	    	  "frequency_penalty": 0,
	    	  "presence_penalty": 0,
	    	  "data_sources": [
	    	    {
	    	      "type": "azure_search",
	    	      "parameters": {
	    	        "endpoint": "%s",
	    	        "index_name": "%s",
	    	        "top_n_documents": 5,
	    	        "authentication": {
	    	          "type": "api_key",
	    	          "key": "%s"
	    	        }
	    	      }
	    	    }
	    	  ]
	    	}
	    	""", messages.toString(), retrievalTool, searchEndpoint, searchIndex, searchKey);

	    	// Send HTTP Request
	    	HttpClient client = HttpClient.newHttpClient();
	    	HttpRequest request = HttpRequest.newBuilder()
	    	    .uri(URI.create(endpoint))
	    	    .header("Content-Type", "application/json")
	    	    .header("api-key", apiKey)
	    	    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
	    	    .build();

	    	HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

	        // === Handle API Errors ===
	        if (response.statusCode() != 200) {
	            throw new RuntimeException("Azure OpenAI call failed: " + response.statusCode() + " - " + response.body());
	        }

	        // === Parse Response ===
	        JSONObject json = new JSONObject(response.body());
	        String content = json.getJSONArray("choices")
	                             .getJSONObject(0)
	                             .getJSONObject("message")
	                             .getString("content")
	                             .trim();

	        // === Replace doc references like [doc1], [doc2] with URLs ===
	        List<String> docRefs = extractDocReferences(content); // [doc1], [doc2], etc.
	        List<String> replacements = new ArrayList<>();

	        JSONObject context = json.getJSONArray("choices")
	                                 .getJSONObject(0)
	                                 .getJSONObject("message")
	                                 .optJSONObject("context");
	        if (context != null && context.has("citations")) {
	            JSONArray citations = context.getJSONArray("citations");

	            for (int i = 0; i < citations.length(); i++) {
	                JSONObject citation = citations.getJSONObject(i);
	                String title = citation.optString("title", "Document");
	                String url = citation.optString("url", "");
	                replacements.add("{*" + url + "*}");
	            }
	        }

	        // 4. Replace [doc2], [doc3]... in order
	        for (int i = 0; i < docRefs.size() && i < replacements.size(); i++) {
	            content = content.replace("[" + docRefs.get(i) + "]", replacements.get(i));
	        }

	        // === Optional: Clean prefix formatting ===
	        if (content.startsWith("### Answer:")) {
	            content = content.replaceFirst("### Answer:\\s*", "");
	        }

	        return content;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "I'm afraid I can't assist with that request.";
	    }
	}

	@RequestMapping(value = "/generateBlobUrl", method = RequestMethod.POST)
	public ResponseEntity<String> generateBlobUrl(@RequestParam String filename) {
	    String connectionString = "DefaultEndpointsProtocol=https;AccountName=openairesl;AccountKey=DEOT0qQJY3BBofHFoGCADnsawejibL/LRBhrTbTu15crBK3sldnFMUkHftmqRjueVVG8rhOEyP45+AStduHW4A==;EndpointSuffix=core.windows.net";
	    BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
	        .connectionString(connectionString)
	        .buildClient();

	    BlobClient blobClient = blobServiceClient.getBlobContainerClient("hrms").getBlobClient(filename);

	    BlobServiceSasSignatureValues values = new BlobServiceSasSignatureValues(
	        OffsetDateTime.now().plusMinutes(30),
	        BlobSasPermission.parse("r") // read-only
	    );

	    String sasUrl = blobClient.getBlobUrl() + "?" + blobClient.generateSas(values);
	    return ResponseEntity.ok(sasUrl);
	}


	@RequestMapping(value = "/createContainer", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView createContainer(@RequestParam("containerName") String containerName) {
		   ModelAndView model = new ModelAndView();
		   model.setViewName("redirect:/home");
	    try {
	        azureBlobService.createContainer(containerName.toLowerCase()); // container names must be lowercase
	        return model;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return model;
	    }
	}
	@RequestMapping(value = "/deleteContainer", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView deleteContainer(@RequestParam("containerName") String containerName) {
		 ModelAndView model = new ModelAndView();
		   model.setViewName("redirect:/home");
	    try {
	        azureBlobService.deleteContainer(containerName.toLowerCase());
	        return model;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return model;
	    }
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFile(@RequestParam("containerName") String containerName,
	                         @RequestParam("file") MultipartFile file,HttpSession session) {
		 ModelAndView model = new ModelAndView();
		   model.setViewName("redirect:/home");
		   String userId = null;
		   BrainBox obj = null;
			String userName = null;
			userName = (String) session.getAttribute("USER_NAME");
			String fileName = file.getOriginalFilename();
			String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMMM d, yyyy, h:mm a"));

			String htmlBody = "<!DOCTYPE html>\n" +
					"<html>\n" +
					"<head>\n" +
					"  <meta charset=\"UTF-8\">\n" +
					"  <style>\n" +
					"    body { font-family: Arial, sans-serif; background-color: #f4f7f9; margin: 0; padding: 0; }\n" +
					"    .email-container { max-width: 600px; margin: auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }\n" +
					"    .white{color : white; }\n" +
					"    .header { background-color: #0078d4; color: white; text-align: center; padding: 20px; }\n" +
					"    .header img { height: 50px; margin-bottom: 10px; }\n" +
					"    .content { padding: 20px; }\n" +
					"    .content h2 { color: #333; }\n" +
					"    .content p { font-size: 15px; color: #555; }\n" +
					"    .footer { background-color: #f0f0f0; padding: 15px; text-align: center; font-size: 12px; color: #888; }\n" +
					"    .btn { display: inline-block; margin-top: 15px; padding: 10px 20px; background-color:white ; color: white; text-decoration: none; border-radius: 4px; }\n" +
					"  </style>\n" +
					"</head>\n" +
					"<body>\n" +
					"  <div class=\"email-container\">\n" +
					"    <div class=\"header\">\n" +
					"      <h2>📥 Document Upload Request</h2>\n" +
					"    </div>\n" +
					"    <div class=\"content\">\n" +
					"      <p><strong>User:</strong> " + userName.toUpperCase() + "</p>\n" +
					"      <p><strong>Container:</strong> " + containerName + "</p>\n" +
					"      <p><strong>File:</strong> " + fileName + "</p>\n" +
					"      <p><strong>Timestamp:</strong> " +timestamp + "</p>\n" +
					"      <hr style='border:none;border-top:1px solid #ddd;margin:20px 0;'>\n" +
					"      <p><strong>' " + userName.toUpperCase() + " '</strong> has requested a document upload and seeks your review of the submission.</p>\n" +
					"      <p>Please, reconnect the integration via the Azure portal.</p>\n" +
					"      <p>Please verify the configuration and take the necessary action.</p>\n" +
					"      <p>Regards,<br/>ReAI Assistant Notification Service</p>\n" +
					"      <a href=\"https://appmint.resustainability.com/dm/home\" class=\"btn \">Go to Dashboard</a>\n" +
					"    </div>\n" +
					"    <div class=\"footer\">\n" +
					"      This is an automated alert from your ReAI Assistant system.\n" +
					"    </div>\n" +
					"  </div>\n" +
					"</body>\n" +
					"</html>";


			try {
			
	        azureBlobService.uploadFile(containerName.toLowerCase(), file);
	        EMailSender email = new EMailSender();
	        email.send("saidileep.p@resustainability.com", "📎 Document Upload Request Alert!\r\n"+ "", htmlBody, obj, "Re AI Document Upload Request!");
	        return model;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return model;
	    }
	}
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFile(@RequestParam("containerName") String containerName,
	                                         @RequestParam("fileName") String fileName) {
	    try {
	        azureBlobService.deleteFile(containerName.toLowerCase(), fileName);
	        return ResponseEntity.ok("File deleted successfully");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting file");
	    }
	}

	
	@RequestMapping(value = "/download", method = {RequestMethod.POST, RequestMethod.GET})
	public void downloadFile(
	        @RequestParam String container,
	        @RequestParam String filename,
	        HttpServletResponse response) {
	    try (InputStream inputStream = azureBlobService.getBlobFile(container, filename)) {
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	        org.apache.commons.io.IOUtils.copy(inputStream, response.getOutputStream());
	        response.flushBuffer();
	    } catch (IOException e) {
	        e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	    }
	}

	@RequestMapping(value = "/logout", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout(HttpSession session,HttpServletRequest request,HttpServletResponse response,RedirectAttributes attributes){
		ModelAndView model = new ModelAndView();
		User user = new User();
		try {
			user.setUserId((String) session.getAttribute("UserId"));
			user.setId((String) session.getAttribute("ID"));
			session.invalidate();
			//model.addObject("success", logOutMessage);
			model.setViewName("redirect:/login");
		} catch (Exception e) {
			logger.fatal("logut() : "+e.getMessage());
		}
		return model;
	}
	

}
