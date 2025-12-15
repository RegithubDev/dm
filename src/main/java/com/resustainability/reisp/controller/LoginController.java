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
import java.util.UUID;
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
						session.setAttribute("DEPT", userDetails.getDept());
						session.setAttribute("DisplayName", userDetails.getDisplayName());
						session.setAttribute("EmailId", userDetails.getEmailId());
						
						session.setAttribute("mobileNo", userDetails.getMobileNo());
						
						session.setAttribute("RoleTypeId", userDetails.getRoleTypeId());
						session.setAttribute("CS", userDetails.getCs());
						session.setAttribute("searchEndpoint", userDetails.getSearchEndpoint());
						session.setAttribute("indexerName", userDetails.getIndexerName());
						session.setAttribute("apiKey", userDetails.getApiKey());
						session.setAttribute("container", userDetails.getContainer());
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
	    	String cs = (String) session.getAttribute("CS"); // connection string
	       //Map<String, List<String>> blobData = azureBlobService.getAllContainersAndFiles();
	      Map<String, Map<String, Object>> blobData = azureBlobService.getAllContainersAndFiles(cs);

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


	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFile(
	        @RequestParam("containerName") String containerName,
	        @RequestParam("files") List<MultipartFile> files,
	        HttpSession session) {

	    ModelAndView model = new ModelAndView();
	    model.setViewName("redirect:/home");

	    String userName = (String) session.getAttribute("USER_NAME");
	    BrainBox obj = null;

	    try {
	        for (MultipartFile file : files) {
	            if (file == null || file.isEmpty()) continue;

	            String fileName = file.getOriginalFilename();
	            String timestamp = LocalDateTime.now()
	                    .format(DateTimeFormatter.ofPattern("MMMM d, yyyy, h:mm a"));
	            String cs = (String) session.getAttribute("CS"); // connection string
	            // Upload each file
	            azureBlobService.uploadFile(containerName.toLowerCase(), file,cs);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addObject("error", "Failed to upload one or more files: " + e.getMessage());
	    }

	    return model;
	}

	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFile(@RequestParam("containerName") String containerName,
	                                         @RequestParam("fileName") String fileName,HttpSession session) {
	    try {
            String cs = (String) session.getAttribute("CS"); // connection string

	        azureBlobService.deleteFile(containerName.toLowerCase(), fileName,cs);
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
	
	@RequestMapping(value = "/refreshIndex", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String runAzureSearchIndexer( HttpSession session) {
	    try {
	     
	        String cs = null;
	        String searchEndpoint = null;
	        String indexerName = null;
	        String apiKey = null;
	        String container = null;

	        // Retrieve stored values from session
	        cs = (String) session.getAttribute("CS"); // connection string
	        searchEndpoint = (String) session.getAttribute("searchEndpoint");
	        indexerName = (String) session.getAttribute("indexerName");
	        apiKey = (String) session.getAttribute("apiKey");
	        container = (String) session.getAttribute("container");
	        // ✅ Send an empty JSON body to avoid 411 error
	        HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(searchEndpoint + "/indexers/" + indexerName + "/run?api-version=2023-11-01"))
	            .header("Content-Type", "application/json")
	            .header("api-key", apiKey)
	            .POST(HttpRequest.BodyPublishers.ofString("{}"))
	            .build();

	        HttpResponse<String> response = HttpClient.newHttpClient()
	            .send(request, HttpResponse.BodyHandlers.ofString());

	        if (response.statusCode() >= 300) {
	            System.err.println("❌ Failed to run indexer: " + response.body());
	            return "❌ Failed to refresh indexer: " + response.body();
	        }

	        System.out.println("✅ Indexer run triggered successfully.");
	        return "✅ The indexer '" + indexerName + "' has been successfully triggered. Please allow approximately 2 minutes for AI to analyze your document.";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "❌ Failed to refresh indexer: " + e.getMessage();
	    }
	}



}
