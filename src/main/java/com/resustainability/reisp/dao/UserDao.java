package com.resustainability.reisp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.StringUtils;

import com.resustainability.reisp.common.EncryptDecrypt;
import com.resustainability.reisp.common.Mail;
import com.resustainability.reisp.constants.CommonConstants;
import com.resustainability.reisp.common.DBConnectionHandler;
import com.resustainability.reisp.common.EMailSender;
import com.resustainability.reisp.model.IRM;
import com.resustainability.reisp.model.Noida;
import com.resustainability.reisp.model.NoidaLog;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.User;
import java.util.Base64;
@Repository
public class UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	DataSource dataSource;

	@Autowired
	DataSourceTransactionManager transactionManager;
	
	
	public List<User> getUsersList(User obj) throws Exception {
		List<User> objsList = null;
		try {
			int arrSize = 0;
			jdbcTemplate = new JdbcTemplate(dataSource);
			String qry = "SELECT distinct (up.user_id),(select sum((DATEDIFF(minute,(ual.[user_login_time] ) ,(ual.[user_logout_time] ) )))/60 "
					+ "FROM [user_audit_log] ual where ual.user_id = up.user_id) as minutes,";
					qry = qry +"(select DATEDIFF(DAY,min([user_login_time] ) ,max([user_login_time] ) )  FROM [user_audit_log] ual where user_id is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  ual.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry +  " ) as days ,";
			
			
			
			qry = qry +"(select sum((DATEDIFF(minute,([user_login_time] ) ,([user_logout_time]))))/60 FROM [user_audit_log] ual where user_id is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  ual.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry +  " ) as hours ,";
			
			
			qry = qry +	"(select count( up.user_id) from [user_profile] up left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> ''"
					+ " and ua.status = 'Active' ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  up.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry + " ) as active_users,"
			+ "(select count( up.user_id) from [user_profile] up left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> '' "
			+ " and ua.status <> 'Active' ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  up.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			
			qry = qry + " ) as inActive_users,up.base_sbu,up.base_project as project_code,up.email_id,up.contact_number,up.base_role as user_role,up.base_department as department_code,"
					+ "project_name as base_project,sbu_name,dd.department_name as base_department,up.base_role,(select max(user_login_time) "
					+ "from [user_audit_log] uuu where uuu.user_id =  up.user_id) as last_login,"
			+ "up.id,up.user_id,up.user_name,up.email_id,up.contact_number,up3.user_name as reporting_to,ua.status,up.reporting_to as reporting_to_id, "
			+"FORMAT (up.created_date, 'dd-MMM-yy') as created_date,up1.user_name as 	"
			+ "created_by,FORMAT	(up.modified_date, 'dd-MMM-yy') as modified_date,up2.user_name as  modified_by "
			+ "FROM [user_profile] up "
			+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
			+ "left join [user_audit_log] ual on up.user_id = ual.user_id  "
			
			+ "left join [project] p on up.base_project = p.project_code  "
			+ "left join [sbu] ss on up.base_sbu = ss.sbu_code  "
			+ "left join [department] dd on up.base_department = dd.department_code  "
			
			+ "left join [user_profile] up1 on up.created_by = up1.user_id "
			+ "left join [user_profile] up3 on up.reporting_to = up3.user_id "
			+ "left join [user_profile] up2 on up.modified_by = up2.user_id  where up.user_id <> '' ";
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry + " order by up.user_name asc";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			objsList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));	
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public boolean addUser(User obj) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			if(!StringUtils.isEmpty(obj.getPassword())) {
				String encryptPwd = EncryptDecrypt.encrypt(obj.getPassword());	
				obj.setPassword(encryptPwd);
			}
			obj.setReward_points("100");
			String insertQry = "INSERT INTO [user_profile] "
					+ "(user_id,user_name,email_id,contact_number,base_role,base_project,base_sbu,base_department,reporting_to,created_by,end_date,created_date,reward_points)"
					+ " VALUES "
					+ "(:user_id,:user_name,:email_id,:contact_number,:base_role,:base_project,:base_sbu,:base_department,:reporting_to,:created_by,:end_date,getdate(),:reward_points)";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
		    count = namedParamJdbcTemplate.update(insertQry, paramSource);
		    if(count > 0) {
		    	String UA_qry = "INSERT INTO [user_accounts] (user_id,user_name,status) VALUES (:user_id,:email_id,:status)";
		    	paramSource = new BeanPropertySqlParameterSource(obj);		 
			    count = namedParamJdbcTemplate.update(UA_qry, paramSource);
			    obj.setAction("User Creation Reward");
			    String HIS_qry = "INSERT INTO [rewards_history] (action,	reward_points,	user_id,created_date) VALUES (:action,:reward_points,:user_id,getdate())";
		    	paramSource = new BeanPropertySqlParameterSource(obj);		 
			    count = namedParamJdbcTemplate.update(HIS_qry, paramSource);
		    }
			if(count > 0) {
				flag = true;
				EMailSender emailSender = new EMailSender();
				String login_url = CommonConstants.HOME ;
				Mail mail = new Mail();
				mail.setMailTo(obj.getEmail_id());
				mail.setMailSubject("Welcome to ReOne");
				String body = "Dear "+obj.getUser_name()+"<br>"
						+ "Congratulations and a warm welcome to <b>ReOne</b> that brings all your work place apps together in one place! You are now Rewarded with <b>100 Reward PSoints</b>."
						+ "<br>Thank you for joining <b>ReOne</b> Application, "
						+ "<br>To explore more Please follow the link <a href="+login_url+"><button>Get Started</button></a>"
						+ "<br><br>"
						+ "Best regards,"
						+ "<p style='color : red'><b>ReOne</b></p>"
						+ "<b>Re Sustainability</b>";
				String subject = "Thank You for Registering in ReOne";
				emailSender.send(mail.getMailTo(), mail.getMailSubject(), body,obj,subject);
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public boolean updateUser(User obj) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String updateQry = "UPDATE [user_profile] set user_name=:user_name,email_id=:email_id,contact_number=:contact_number,"
					+ "base_sbu= :base_sbu,base_project= :base_project,base_department= :base_department,base_role= :base_role,reporting_to= :reporting_to,"
					+ "modified_by=:modified_by,modified_date= getdate()  "
					+ "where user_id = :user_id ";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
		    count = namedParamJdbcTemplate.update(updateQry, paramSource);
			if(count > 0) {
				updateUserAccounts(obj);
				flag = true;
				String updateAuditQry = "UPDATE [user_accounts] set status=:status where user_id = :user_id ";
				paramSource = new BeanPropertySqlParameterSource(obj);		 
			    count = namedParamJdbcTemplate.update(updateAuditQry, paramSource);
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public List<User> getDeptList(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT user_role FROM [user_role] "; 
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_role())) {
				qry = qry + "and user_role = ? ";
				arrSize++;
			}
			qry = qry + " order by user_role asc";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_role())) {
				pValues[i++] = obj.getUser_role();
			}	
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}
	 // Method to encode a string into Base64 (UTF-16LE)
    public static String encodeBase64(String input) {
        byte[] bytes = input.getBytes(java.nio.charset.StandardCharsets.UTF_16LE);
        return Base64.getEncoder().encodeToString(bytes);
    }
	public User validateUser(User user) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userDetails = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select userId,"
					+ "		      userName,centerId,dept,"
					+ "		      roleTypeId,"
					+ "		      isActive,"
					+ "		      emailId,"
					+ "		      mobileNo,"
					+ "		      createdBy,"
					+ "		      createdDate,"
					+ "		      modifiedBy,"
					+ "		      modifiedDate,cs"
					+ "      ,searchEndpoint"
					+ "      ,indexerName"
					+ "      ,apiKey"
					+ "      ,container from [AIDB].[dbo].[User] where userId is  not null ";
			if(!StringUtils.isEmpty(user.getUserId()) && !StringUtils.isEmpty(user.getPassword())){
				qry = qry + "AND userName = ? and Password = ?  "; 
			}
			stmt = con.prepareStatement(qry);
			if(!StringUtils.isEmpty(user.getUserId())  && !StringUtils.isEmpty(user.getPassword())){
				 stmt.setString(1, user.getUserId());;
				 // Encode the string to Base64
			        String encodedString = encodeBase64((user.getPassword()));
			        System.out.println("Encoded String: " + encodedString);

				// byte[] decodedBytes = Base64.getDecoder().decode(user.getPassword());
			    // String decodedString = new String(decodedBytes, java.nio.charset.StandardCharsets.UTF_16LE);
				 stmt.setString(2, encodedString);;
			}
			rs = stmt.executeQuery();  
			if(rs.next()) {
				userDetails = new User();
			        userDetails.setUserId(rs.getString("userId"));
			        userDetails.setUserName(rs.getString("userName"));
			        userDetails.setDept(rs.getString("dept"));
			        userDetails.setCenterId(rs.getString("centerId"));
			        userDetails.setRoleTypeId(rs.getString("roleTypeId"));
			        userDetails.setIsActive(rs.getString("isActive"));
			        userDetails.setEmailId(rs.getString("emailId"));
			        userDetails.setMobileNo(rs.getString("mobileNo"));
			        userDetails.setCreatedBy(rs.getString("createdBy"));
			        userDetails.setCreatedDate(rs.getString("createdDate"));
			        userDetails.setModifiedBy(rs.getString("modifiedBy"));
			        userDetails.setModifiedDate(rs.getString("modifiedDate"));
			        
			        userDetails.setCs(rs.getString("cs"));
			        userDetails.setSearchEndpoint(rs.getString("searchEndpoint"));
			        userDetails.setIndexerName(rs.getString("indexerName"));
			        userDetails.setApiKey(rs.getString("apiKey"));
			        userDetails.setContainer(rs.getString("container"));
			}
		}catch(Exception e){ 
			throw new SQLException(e.getMessage());
		}finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return userDetails;
		
	}


	public User getAllPermissions(String base_role) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userPermissions = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select role,p_add,p_view,p_edit,p_approvals,p_reports,p_dashboards,p_auto_email from [base_role_permissions] "
					+ "where  role <> '' ";
			if(!StringUtils.isEmpty(base_role)){
				qry = qry + "AND role = ? "; 
			}
			stmt = con.prepareStatement(qry);
			if(!StringUtils.isEmpty(base_role)){
				stmt.setString(1, base_role);
			}
			rs = stmt.executeQuery();  
			if(rs.next()) {
				userPermissions = new User();
				userPermissions.setRole(rs.getString("role"));
				userPermissions.setP_add(rs.getString("p_add"));
				userPermissions.setP_view(rs.getString("p_view"));
				userPermissions.setP_edit(rs.getString("p_edit"));
				userPermissions.setP_approvals(rs.getString("p_approvals"));
				userPermissions.setP_reports(rs.getString("p_reports"));
				userPermissions.setP_dashboards(rs.getString("p_dashboards"));
				userPermissions.setP_auto_email(rs.getString("p_auto_email"));
			}
		}catch(Exception e){ 
			throw new SQLException(e.getMessage());
		}finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return userPermissions;
	}    
	
	public int checkUserLoginDetails(User obj) throws Exception {
		int totalRecords = 0;
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String subQry = " and device_type_no = 2";
			if(!StringUtils.isEmpty(obj.getDevice_type())  && obj.getDevice_type().equals("mobile")) {
				subQry = " and device_type_no = 1";
			}
			String qry = "select count(user_id) from [user_audit_log] where user_logout_time is null or  user_logout_time = '' "+ subQry;
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_session_id())) {
				qry = qry + " and user_session_id = ? ";
				arrSize++; 
			}	
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_session_id())) {
				pValues[i++] = obj.getUser_session_id();
			}
			totalRecords = jdbcTemplate.queryForObject( qry,pValues,Integer.class);
			if(totalRecords > 0) {
				//String updateQry = "update [user_audit_log] set user_logout_time=GETDATE()  where user_id= :user_id and user_logout_time is null or  user_logout_time = '' ";
				//BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
			   // namedParamJdbcTemplate.update(updateQry, paramSource);
			}
		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return totalRecords;
		
		
	}

	private boolean setLastLoginTime(User userDetails) throws Exception {
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String insertQry = "if exists(SELECT * from [user_accounts] where user_id= :user_id and user_name= :email_id)            "
					+ "BEGIN            "
					+ " update [user_accounts] set last_login_date_time=GETDATE()  where user_id= :user_id  "
					+ "End                    "
					+ "else  "
					+ "begin  "
					+ "INSERT INTO [user_accounts] (user_id,user_name,last_login_date_time) values (:user_id,:email_id,GETDATE())  "
					+ "end ";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(userDetails);		 
		    namedParamJdbcTemplate.update(insertQry, paramSource);
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public int getTotalRecords(User obj, String searchParameter) throws Exception {
		int totalRecords = 0;
		try {
			int arrSize = 0;
			String qry = "select count(DISTINCT up.user_id) as total_records FROM [user_profile] up "
			+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
			+ "left join [user_audit_log] ual on up.user_id = ual.user_id  "
			
			+ "left join [project] p on up.base_project = p.project_code  "
			+ "left join [sbu] ss on up.base_sbu = ss.sbu_code  "
			+ "left join [department] dd on up.base_department = dd.department_code  "
			
			+ "left join [user_profile] up1 on up.created_by = up1.user_id "
			+ "left join [user_profile] up3 on up.reporting_to = up3.user_id "
			+ "left join [user_profile] up2 on up.modified_by = up2.user_id  where up.user_id <> '' ";
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				qry = qry + " and (up.user_id like ? or up.user_name like ? or up.base_role like ?"
						+ " or up.email_id like ? or up.base_sbu like ? or up.base_project like ? or up.base_department like ? "
						+ "or ua.status like ? or sbu_name like ? or up.base_project like ? or up.base_department like ? or up.id like ? )";
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				
			}	
			
			Object[] pValues = new Object[arrSize];
			int i = 0;
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				
			}
			
			totalRecords = jdbcTemplate.queryForObject( qry,pValues,Integer.class);
		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return totalRecords;
	}

	public List<User> getUserList(User obj, int startIndex, int offset, String searchParameter) throws Exception {
		List<User> objsList = null;
		try {
			int arrSize = 0;
			jdbcTemplate = new JdbcTemplate(dataSource);
			String qry = "SELECT distinct (up.user_id),(select sum((DATEDIFF(minute,(ual.[user_login_time] ) ,(ual.[user_logout_time] ) )))/60 "
					+ "FROM [user_audit_log] ual where ual.user_id = up.user_id) as minutes,";
					qry = qry +"(select DATEDIFF(DAY,min([user_login_time] ) ,max([user_login_time] ) )  FROM [user_audit_log] ual where user_id is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  ual.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry +  " ) as days ,";
			
			
			
			qry = qry +"(select sum((DATEDIFF(minute,([user_login_time] ) ,([user_logout_time]))))/60 FROM [user_audit_log] ual where user_id is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  ual.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry +  " ) as hours ,";
			
			
			qry = qry +	"(select count( up.user_id) from [user_profile] up left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> ''"
					+ " and ua.status = 'Active' ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  up.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry + " ) as active_users,"
			+ "(select count( up.user_id) from [user_profile] up left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> '' "
			+ " and ua.status <> 'Active' ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and  up.user_id = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			
			qry = qry + " ) as inActive_users,up.base_sbu,up.base_project as project_code,up.base_role as user_role,up.base_department as department_code,"
					+ "project_name as base_project,sbu_name,dd.department_name as base_department,up.base_role,(select max(user_login_time) "
					+ "from [user_audit_log] uuu where uuu.user_id =  up.user_id) as last_login,"
			+ "up.id,up.user_id,up.user_name,up.email_id,up.contact_number,up3.user_name as reporting_to,ua.status,up.reporting_to as reporting_to_id, "
			+"FORMAT (up.created_date, 'dd-MMM-yy') as created_date,up1.user_name as 	"
			+ "created_by,FORMAT	(up.modified_date, 'dd-MMM-yy') as modified_date,up2.user_name as  modified_by "
			+ "FROM [user_profile] up "
			+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
			+ "left join [user_audit_log] ual on up.user_id = ual.user_id  "
			
			+ "left join [project] p on up.base_project = p.project_code  "
			+ "left join [sbu] ss on up.base_sbu = ss.sbu_code  "
			+ "left join [department] dd on up.base_department = dd.department_code  "
			
			+ "left join [user_profile] up1 on up.created_by = up1.user_id "
			+ "left join [user_profile] up3 on up.reporting_to = up3.user_id "
			+ "left join [user_profile] up2 on up.modified_by = up2.user_id  where up.user_id <> '' ";
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				qry = qry + " and [user_login_time] >= DATEADD(day, ?, GETDATE()) ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() == 13) {
				qry = qry + " and [user_login_time] is null ";
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				qry = qry + " and (up.user_id like ? or up.user_name like ? or up.base_role like ?"
						+ " or up.email_id like ? or up.base_sbu like ? or up.base_project like ? or up.base_department like ? "
						+ "or ua.status like ? or sbu_name like ? or up.base_project like ? or up.base_department like ? or up.id like ? )";
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				arrSize++;
				
			}	
			if(!StringUtils.isEmpty(startIndex) && !StringUtils.isEmpty(offset)) {
				qry = qry + " ORDER BY up.user_name asc offset ? rows  fetch next ? rows only";	
				arrSize++;
				arrSize++;
			}
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && obj.getTime_period() != 0  && obj.getTime_period() != 13) {
				pValues[i++] = obj.getTime_period();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				pValues[i++] = "%"+searchParameter+"%";
				
			}
			if(!StringUtils.isEmpty(startIndex) && !StringUtils.isEmpty(offset)) {
				pValues[i++] = startIndex;
				pValues[i++] = offset;
			}
		    objsList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));

		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	private boolean updateUserAccounts(User userDetails) throws Exception {
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String insertQry = "if exists(SELECT * from [user_accounts] where user_id= :user_id )            "
					+ "BEGIN            "
					+ " update [user_accounts] set user_name= :email_id,status= :status  where user_id= :user_id  "
					+ "End                    "
					+ "else  "
					+ "begin  "
					+ "INSERT INTO [user_accounts] (user_id,user_name,status) values (:user_id,:email_id,:status)  "
					+ "end ";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(userDetails);		 
		    namedParamJdbcTemplate.update(insertQry, paramSource);
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status); 
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}
	
	public boolean deleteProject(User obj) throws Exception {
		boolean flag = false;
		try {
			String sql = "DELETE FROM [user_profile] WHERE user_id = ?";
		    Object[] args = new Object[] {obj.getUser_id()};
		    flag =  jdbcTemplate.update(sql, args) == 1;
		}catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public List<User> getDeptFilterList(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT  count(user_role) as count ,(select count(user_name) from [user_profile]) as totalCount, user_role FROM [user_profile] where user_role is not null and user_role <> '' group by user_role "; 
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_role())) {
				qry = qry + "and user_role = ? ";
				arrSize++;
			}
			qry = qry + " order by user_role asc";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_role())) {
				pValues[i++] = obj.getUser_role();
			}	
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public  boolean UserLoginActions(User obj) throws Exception {
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			obj.setModule_type("User");
			obj.setMessage("User Action");
			obj.setDevice_type_no("1");
			if(!StringUtils.isEmpty(obj.getDevice_type())  && obj.getDevice_type().equals("desktop")) {
				obj.setDevice_type_no("2");
			}
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String insertQry = "INSERT INTO [user_audit_log] (module_id,module_type,message,user_id,user_session_id,device_type,device_type_no,user_login_time)"
					+ " values (:id,:module_type,:message,:user_id,:user_session_id,:device_type,:device_type_no,GETDATE())";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
		    namedParamJdbcTemplate.update(insertQry, paramSource);
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}


	public  boolean UserLogOutActions(User obj) throws Exception {
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String insertQry = "Update  [user_audit_log] set user_logout_time = GETDATE() where "
					+ " user_login_time IN (SELECT max([user_login_time]) FROM[user_audit_log] )  and  module_id = :id";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
		    namedParamJdbcTemplate.update(insertQry, paramSource);
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
		
	}

	public List<User> getMenuList() throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "select id, module_name, module_url from [form_menu] where project is null or project = 'brainbox' order by priority asc ";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getUserFilterList(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT up.user_id,up.user_name FROM [user_profile] up "
					+ "left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> '' ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}
			qry = qry + "group by up.user_id,up.user_name ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getStatusFilterListFromUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT ua.status FROM [user_profile] up "
					+ "left join [user_accounts] ua on up.user_id = ua.user_id where up.user_id <> '' ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}

			qry = qry + "group by ua.status ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getReportingTosList(User obj) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "select user_id,user_name from [user_profile]";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<RoleMapping> getDeptsList() throws SQLException {
		List<RoleMapping> menuList = null;
		try{  
			String qry = "SELECT department_code ,department_name FROM [department] d "
					+ " where d.department_code is not null and  d.department_code <> ''  "; 
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<RoleMapping>(RoleMapping.class));
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getRoleFilterListInUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT up.base_role FROM [user_profile] up "
					+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
					+ " where up.base_role <> '' and up.base_role is not null  ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}

			qry = qry + "group by up.base_role ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getSBUFilterListInUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT s.sbu_code,sbu_name FROM [user_profile] up "
					+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
					+ "left join [sbu] s on up.base_sbu = s.sbu_code  "
					+ " where up.base_sbu <> '' and up.base_sbu is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}

			qry = qry + "group by s.sbu_code,sbu_name ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getProjectFilterListInUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT p.project_code,project_name FROM [user_profile] up "
					+ "left join [user_accounts] ua on up.user_id = ua.user_id  "
					+ "left join [project] p on p.project_code = up.base_project   "
					+ " where up.base_project <> '' and up.base_project is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				qry = qry + " and ua.status = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				qry = qry + " and up.base_project = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				qry = qry + " and up.base_role = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				qry = qry + " and up.base_sbu = ? ";
				arrSize++;
			}

			qry = qry + "group by p.project_code,project_name ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getStatus())) {
				pValues[i++] = obj.getStatus();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getProject())) {
				pValues[i++] = obj.getProject();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_role())) {
				pValues[i++] = obj.getBase_role();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getSbu())) {
				pValues[i++] = obj.getSbu();
			}
			
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getRewardsHistory(User user) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT[action],sum(rh.[reward_points]) + 100 as [reward_points],up.[user_name],up.user_id FROM [rewards_history] rh "
					+ "left join user_profile up on rh.user_id = up.user_id where action like '%Incident%' "
					+ " and up.user_id is not null   ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(user) && (!CommonConstants.ADMIN.equals(user.getRole()) && !CommonConstants.MANAGEMENT.equals(user.getRole()))
					&& !StringUtils.isEmpty(user.getUser_id())  ) {
				qry = qry + " and up.user_id = ? ";
				arrSize++;
			}
			
			qry = qry + "group by up.user_id,action,[user_name] order by sum(rh.[reward_points]) + 100 desc ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(user) && (!CommonConstants.ADMIN.equals(user.getRole()) && !CommonConstants.MANAGEMENT.equals(user.getRole()))
					&& !StringUtils.isEmpty(user.getUser_id())  ) {
				pValues[i++] = user.getUser_id();
			}
		
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public boolean addUserSelf(User obj) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			String updateQry = "UPDATE [user_profile] set contact_number=:contact_number,"
					+ "base_sbu= :base_sbu,base_project= :base_project,base_department= :base_department,reporting_to= :reporting_to,"
					+ "modified_by=:modified_by,modified_date= getdate()  "
					+ "where user_id = :user_id ";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		 
		    count = namedParamJdbcTemplate.update(updateQry, paramSource);
			if(count > 0) {
				flag = true;
				obj.setModule_type("Profile");
				obj.setMessage("Profile Updated Successfully");
				String logQry = "INSERT INTO [user_audit_log] "
						+ "(module_type,message,user_id,create_date)"
						+ " VALUES "
						+ "(:module_type,:message,:modified_by,getdate())";
				 paramSource = new BeanPropertySqlParameterSource(obj);		 
			     count = namedParamJdbcTemplate.update(logQry, paramSource);
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public List<User> getProjectListForUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT p.project_code,project_name FROM [project] p "
					+ "left join [sbu] s on p.sbu_code = s.sbu_code  "
					+ " where p.project_code <> '' and p.project_code is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_sbu())) {
				qry = qry + " and p.sbu_code = ? ";
				arrSize++;
			}	
			qry = qry + "group by p.project_code,project_name ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_sbu())) {
				pValues[i++] = obj.getBase_sbu();
			}
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getDeptListForUser(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT d.department_code ,department_name,assigned_to_sbu FROM [department] d "
					+ " where d.department_code <> '' and d.department_code is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBase_sbu())) {
				qry = qry + "and  d.assigned_to_sbu like ('%"+obj.getBase_sbu()+"%') ";
			}	
			
			objsList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getUserActionsForNotification(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT TOP (10) module_type,message,user_id,create_date FROM [user_audit_log]  "
					+ " where user_id <> '' and user_id is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				qry = qry + " and user_id = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getLast_sync_time())) {
				qry = qry + " and create_date >= ? ";
				arrSize++;
			}	
			qry = qry + " and module_type <> 'User' order by create_date desc";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getUser_id())) {
				pValues[i++] = obj.getUser_id();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getLast_sync_time())) {
				pValues[i++] = obj.getLast_sync_time();
			}
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public boolean otpLog(IRM irm) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			
			String insertQry = "INSERT INTO [otp_log] "
					+ "(email_id,otp_code,created_datetime,expired_datetime)"
					+ " VALUES "
					+ "(:email_id,:otp_code,getdate(),DATEADD(MINUTE, 15, GETDATE()))";
			BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(irm);		 
		    count = namedParamJdbcTemplate.update(insertQry, paramSource);
		   
			if(count > 0) {
				flag = true;
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public boolean verifyOtp(IRM irm) throws Exception {
		List<User> objsList = new ArrayList<User>();
		boolean flag = false ;
		try {
			String qry = "SELECT TOP (1)  * FROM otp_log "
					+ "WHERE (select max(expired_datetime) from  [otp_log]) > GETDATE()  and email_id ='"+irm.getEmail_id()+"' and otp_code ='"+irm.getOtp_code()+"'  order by expired_datetime desc ";
		
			objsList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			if(objsList.size() > 0) {
				flag = true ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}
	public List<Noida> getNewDataList() throws SQLException {
		List<Noida> menuList = null;
		List<Noida> menuList2 = null;
		boolean flag = false;
		int count = 0;
		try{  
			try {
			String qry = "  SELECT top(10000) TRNO as TicketNo, VEHICLENO as VehicleNo,MATERIAL as TransferStation, PARTY as Location,TRANSPORTER as Transporter,"
					+ " CONCAT("
					+ "    FORMAT(CONVERT(datetime, DATEIN, 101), 'yyyy-MM-dd'), "
					+ "    'T', "
					+ "    CONVERT(varchar(10), RIGHT(CASE WHEN LEN(TIMEIN) = 0 THEN '12:00:00 PM' ELSE TIMEIN END, 10), 20)"
					+ ") AS TimeRecorded,"
					+ "CONCAT("
					+ "    FORMAT(CONVERT(datetime, DATEOUT, 101), 'yyyy-MM-dd'), "
					+ "    'T', "
					+ "    CONVERT(varchar(10), RIGHT(CASE WHEN LEN(TIMEOUT) = 0 THEN '12:00:00 PM' ELSE TIMEIN END, 10), 20)"
					+ ") AS OutTime, COALESCE(FIRSTWEIGHT, 0) as LoadWeight,SITEID, COALESCE(SECONDWEIGHT, 0) "
					+ " as EmptyWeight,COALESCE(NETWT, 0) as NetWeight,'Noida CND Plant' as SupplierName,'CND' as PostedBy,TYPEOFWASTE AS MaterialName "
					+ " FROM [All_CnD_Sites].[dbo].WEIGHT WITH (nolock)WHERE (SECONDWEIGHT IS NOT NULL)AND (NETWT IS NOT NULL) and(SITEID is not null)"
					+ " AND SITEID = 'NOIDACnDNOIDA_WB1' and FIRSTWEIGHT is not null and FIRSTWEIGHT <> '' and SECONDWEIGHT is not null and SECONDWEIGHT"
					+ " <> '' and  NETWT is not null and NETWT <> '' and cast(DATEIN as date) between '4/24/2025' and '4/28/2025'"
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ ""
					+ " ORDER BY TRNO desc ";
			// and TRNO  NOT IN (SELECT [WeightTransNo] FROM [noida_site_log])
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<Noida>(Noida.class));
			
			
			String qry1 = "  SELECT top(10000) TRNO as TicketNo, VEHICLENO as VehicleNo,MATERIAL as TransferStation, PARTY as Location,TRANSPORTER as Transporter,"
					+ " CONCAT("
					+ "    FORMAT(CONVERT(datetime, DATEIN, 101), 'yyyy-MM-dd'), "
					+ "    'T', "
					+ "    CONVERT(varchar(10), RIGHT(CASE WHEN LEN(TIMEIN) = 0 THEN '12:00:00 PM' ELSE TIMEIN END, 10), 20)"
					+ ") AS TimeRecorded,"
					+ "CONCAT("
					+ "    FORMAT(CONVERT(datetime, DATEOUT, 101), 'yyyy-MM-dd'), "
					+ "    'T', "
					+ "    CONVERT(varchar(10), RIGHT(CASE WHEN LEN(TIMEOUT) = 0 THEN '12:00:00 PM' ELSE TIMEIN END, 10), 20)"
					+ ") AS OutTime, COALESCE(FIRSTWEIGHT, 0) as LoadWeight,SITEID, COALESCE(SECONDWEIGHT, 0) "
					+ " as EmptyWeight,COALESCE(NETWT, 0) as NetWeight,'Noida CND Plant' as SupplierName,'CND' as PostedBy,TYPEOFWASTE AS MaterialName "
					+ " FROM [All_CnD_Sites].[dbo].WEIGHT WITH (nolock)WHERE  (SECONDWEIGHT IS NOT NULL)AND (NETWT IS NOT NULL) and(SITEID is not null)"
					+ " AND SITEID = 'NOIDACnDNOIDA_WB1' and FIRSTWEIGHT is not null and FIRSTWEIGHT <> '' and SECONDWEIGHT is not null and SECONDWEIGHT"
					+ " <> '' and  NETWT is not null and NETWT <> '' and cast(DATEIN as date) between '4/24/2025' and '4/28/2025'"
					+ " ORDER BY TRNO desc ";
			
			menuList = jdbcTemplate.query( qry1, new BeanPropertyRowMapper<Noida>(Noida.class));
			//menuList.addAll(menuList2);
			Set<String> nameSet = new HashSet<>();
			menuList = menuList.stream()
		            .filter(e -> nameSet.add(e.getTicketNo()))
		            .collect(Collectors.toList());
			}catch(Exception e) {e.printStackTrace();
				String qry = "  SELECT TRNO as TicketNo, VEHICLENO as VehicleNo,MATERIAL as TransferStation, PARTY as Location,TRANSPORTER as Transporter,"
						+ " CONCAT(CONVERT(varchar(20), FORMAT (CONVERT(datetime, DATEIN, 120) , 'yyyy-MM-dd'), 120), 'T', CONVERT(varchar(10),"
						+ " RIGHT(CASE WHEN LEN(TIMEIN) = 0 THEN '12:00:00 PM' ELSE TIMEIN END, 10), 20)) AS TimeRecorded,CONCAT(CONVERT(varchar(20),"
						+ " FORMAT (CONVERT(datetime, DATEOUT, 120) , 'yyyy-MM-dd'), 120), 'T',CONVERT(varchar(10), RIGHT(  CASE WHEN LEN(TIMEOUT) = 0 THEN"
						+ " '12:00:00 PM' ELSE TIMEOUT END, 10), 20)) AS OutTime, COALESCE(FIRSTWEIGHT, 0) as LoadWeight,SITEID, COALESCE(SECONDWEIGHT, 0) "
						+ " as EmptyWeight,COALESCE(NETWT, 0) as NetWeight,'Noida CND Plant' as SupplierName,'CND' as PostedBy,TYPEOFWASTE AS MaterialName "
						+ " FROM [All_CnD_Sites].[dbo].WEIGHT WITH (nolock)WHERE (SECONDWEIGHT IS NOT NULL)AND (NETWT IS NOT NULL) and(SITEID is not null)"
						+ " AND SITEID = 'NOIDACnDNOIDA_WB1' and FIRSTWEIGHT is not null and FIRSTWEIGHT <> '' and SECONDWEIGHT is not null and SECONDWEIGHT"
						+ " <> '' and  NETWT is not null and NETWT <> '' and cast(DATEIN as date) between '4/24/2025' and '4/28/2025' "
						+ " ORDER BY TRNO desc  ";
				
				menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<Noida>(Noida.class));
				//and cast(DATEIN as date) between '3/2/2024' and '5/2/2024' 
			}
			int index = 0;
			DateFormat dateFormat12 = new SimpleDateFormat("hh:mm:ss aa");
		    DateFormat dateFormat24 = new SimpleDateFormat("HH:mm:ss");
			for(Noida nnn : menuList) {
				String date1 = nnn.getTimeRecorded();
				String date2 = nnn.getOutTime();
				date1 = date1.replace("T0 ", "T");
				date2 = date2.replace("T0 ", "T");
				if(!StringUtils.isEmpty(date1) && !StringUtils.isEmpty(date2)) {
					String[] arrD = date1.split("T");
					String[] arrD1 = date2.split("T");
					if(arrD[1].contains(":")  && arrD1[1].contains(":")) {
						
						String[] arrD2 = arrD[1].split(":");
						String[] arrD3 = arrD1[1].split(":");
						
						String dug = arrD2[0].trim();
						String dug1 = arrD3[0].trim();
					
					   ///Setting Formated Time Recorded time
					    Date dateF1 = dateFormat24.parse(arrD[1]);
					    String finalD1 = dateFormat24.format(dateF1);
						dug = "T"+finalD1;
						date1 = date1.replace("T"+arrD[1], dug);
						menuList.get(index).setTimeRecorded(date1);
						
						///Setting Formated Out time
						Date dateF2 = dateFormat24.parse(arrD1[1]);
					    String finalD2 = dateFormat24.format(dateF2);
						dug1 = "T"+finalD2;
						date2 = date2.replace("T"+arrD1[1], dug1);
						menuList.get(index).setOutTime(date2);
					
						index++;
					}
				}
			}
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			for(Noida obj : menuList) {
				NoidaLog logObj = new NoidaLog();
				logObj.setWeightTransNo(obj.getTicketNo());
				logObj.setVEHICLENO(obj.getVehicleNo());
				logObj.setPTC_Status("Data sent");
				String insertQry = "INSERT INTO [noida_site_log] (WeightTransNo,VEHICLENO,PTC_Status,PTCDT)"
						+ " VALUES "
						+ "(:WeightTransNo,:VEHICLENO,:PTC_Status,getdate())";
				BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(logObj);		 
			    count = namedParamJdbcTemplate.update(insertQry, paramSource);
			}
			if(count > 0) {
				flag = true;
			}
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public Object uploadToLogs(List<Noida> list, NoidaLog logObj) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			for(Noida obj : list) {
				logObj.setWeightTransNo(obj.getTicketNo());
				logObj.setVEHICLENO(obj.getVehicleNo());
				String insertQry = "UPDATE [noida_site_log] set GFC_Status= :GFC_Status,GFCDT= getdate(),MSG= :MSG "
						+ "where "
						+ " WeightTransNo= :WeightTransNo and VEHICLENO= :VEHICLENO ";
				BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(logObj);		 
			    count = namedParamJdbcTemplate.update(insertQry, paramSource);
			}
			if(count > 0) {
				flag = true;
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public List<User> getCentersForUser(User user) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT CenterId as centerId"
					+ "		      ,CenterCode"
					+ "		      ,CenterName as centerName"
					+ "		      ,Category"
					+ "		      ,Location"
					+ "		      ,ProjectType"
					+ "		      ,DBName FROM WMSMain.dbo.WMSCenter;";
		
			objsList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getcomplaintTypeIdFilterList(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT c.ComplaintTypeId,ct.complaintTypeCode,ct.complaintTypeName FROM [WMSDMSWPROD].[dbo].[Complaint] c "
					+ "left join [WMSDMSWPROD].[dbo].[ComplaintType] ct on  c.ComplaintTypeId = ct.ComplaintTypeId"
					+ " where c.ComplaintTypeId <> '' and c.ComplaintTypeId is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				qry = qry + " and c.ComplaintTypeId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				qry = qry + " and ComplaintId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				qry = qry + " and complaintStatusId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj.getTransactionDate())) {
				if(obj.getTransactionDate().contains(",")) {
					String [] dates = obj.getTransactionDate().split(",");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
					qry = qry + " and TransactionDate between CAST('"+obj.getFrom_date()+"' as DATE) and CAST('"+obj.getTo_date()+"' as DATE) ";
				}else {
						qry = qry + " and CAST(TransactionDate as DATE) = '"+obj.getTransactionDate()+"' ";
				}
			}
			qry = qry + "  group by c.ComplaintTypeId,ct.complaintTypeCode,ct.complaintTypeName ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
		
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getComplaintFilterListFromcomplaintTypeId(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT ComplaintId FROM [WMSDMSWPROD].[dbo].[Complaint] c "
					+ " where ComplaintTypeId <> '' and ComplaintTypeId is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				qry = qry + " and ComplaintTypeId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				qry = qry + " and ComplaintId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				qry = qry + " and complaintStatusId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj.getTransactionDate())) {
				if(obj.getTransactionDate().contains(",")) {
					String [] dates = obj.getTransactionDate().split(",");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
					qry = qry + " and TransactionDate between CAST('"+obj.getFrom_date()+"' as DATE) and CAST('"+obj.getTo_date()+"' as DATE) ";
				}else {
						qry = qry + " and CAST(TransactionDate as DATE) = "+obj.getTransactionDate()+" ";
				}
			}
			qry = qry + "  order by c.ComplaintId desc";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
		
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getcomplaintStatusIdFilterListFromcomplaintTypeId(User obj) throws Exception {
		List<User> objsList = new ArrayList<User>();
		try {
			String qry = "SELECT c.ComplaintStatusId,ComplaintStatusCode,ComplaintStatusName FROM [WMSDMSWPROD].[dbo].[Complaint] c "
					+ "left join [WMSDMSWPROD].[dbo].[ComplaintStatus] ct on  c.ComplaintStatusId = ct.ComplaintStatusId"
					+ " where c.ComplaintStatusId <> '' and c.ComplaintStatusId is not null ";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				qry = qry + " and c.ComplaintTypeId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				qry = qry + " and ComplaintId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				qry = qry + " and c.complaintStatusId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj.getTransactionDate())) {
				if(obj.getTransactionDate().contains(",")) {
					String [] dates = obj.getTransactionDate().split(",");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
					qry = qry + " and TransactionDate between CAST('"+obj.getFrom_date()+"' as DATE) and CAST('"+obj.getTo_date()+"' as DATE) ";
				}else {
						qry = qry + " and CAST(TransactionDate as DATE) = '"+obj.getTransactionDate()+"' ";
				}
			}
			qry = qry + " group by c.ComplaintStatusId,ComplaintStatusCode,ComplaintStatusName ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
		
			objsList = jdbcTemplate.query( qry, pValues, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;	}

	public int getTotalRecordsC(User obj, String searchParameter) throws Exception {
		int totalRecords = 0;
		try {
			int arrSize = 0;
			String qry = "select count(DISTINCT c.ComplaintId) as total_records FROM [WMSDMSWPROD].[dbo].[Complaint] c "
					+ " left join [WMSDMSWPROD].[dbo].[ComplaintStatus] cs on  c.ComplaintStatusId = cs.ComplaintStatusId "
					+ " left join[WMSDMSWPROD].[dbo].[ComplaintType] crt on  c.complaintTypeId = crt.complaintTypeId"
					+ " left join[WMSDMSWPROD].[dbo].[RegistrationType] rt on  c.[RegistrtionTypeId] = rt.registrationTypeId"
					+ "	left join [WMSDMSWPROD].[dbo].[Ward] w on  c.wardId = w.wardId"
					+ "	left join [WMSDMSWPROD].[dbo].[Zone] z on  c.ZoneId = z.ZoneId"
					+ "	left join [WMSDMSWPROD].[dbo].[Circle] cc on  c.circleId = cc.circleId"
					+ "	left join [WMSDMSWPROD].[dbo].[BinsLocation] l on  c.locationId = l.locationId "
					+ "	left join [WMSDMSWPROD].[dbo].[Cluster] ccc on  c.clusterId = ccc.clusterId "
			+ "where ComplaintId is not null ";
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				qry = qry + " and c.ComplaintTypeId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				qry = qry + " and ComplaintId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				qry = qry + " and c.complaintStatusId = ? ";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(searchParameter)) {
				qry = qry + " and (c.ComplaintId like ?)";
				arrSize++;
			}	
			if(!StringUtils.isEmpty(obj.getTransactionDate())) {
				if(obj.getTransactionDate().contains(",")) {
					String [] dates = obj.getTransactionDate().split(",");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
					qry = qry + " and TransactionDate between CAST('"+obj.getFrom_date()+"' as DATE) and CAST('"+obj.getTo_date()+"' as DATE) ";
				}else {
						qry = qry + " and CAST(TransactionDate as DATE) = '"+obj.getTransactionDate()+"' ";
				}
			}
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				pValues[i++] = "%"+searchParameter+"%";
			}
			
			totalRecords = jdbcTemplate.queryForObject( qry,pValues,Integer.class);
		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return totalRecords;
	}

	public List<User> getCList(User obj, int startIndex, int offset, String searchParameter) throws Exception {
		List<User> objsList = null;
		try {
			int arrSize = 0;
			jdbcTemplate = new JdbcTemplate(dataSource);
			String qry = "SELECT complaintId, userId, citizenName, complaintAddress, mobileNo, c.[RegistrtionTypeId],registrationTypeName, transactionNo,  FORMAT(TransactionDate, 'MMM d, yy hh:mm tt') AS transactionDate, cs.complaintStatusId, "
					+ "citizenEmailId,  FORMAT(closingTime, 'MMM d, yy hh:mm tt') AS closingTime, z.zoneId,z.ZoneName, cc.circleId,  w.wardId,WardName, l.locationId,LocationName, crt.complaintTypeId, "
					+ "complaintDescription, binNumber, smsStatus, "
					+ "c.createdBy, c.modifiedBy, c.createdDate, c.modifiedDate, c.remarks, c.clusterId,clusterName "
					+ " ,complaintTypeCode,complaintTypeName,complaintStatusCode,complaintStatusName from [WMSDMSWPROD].[dbo].[Complaint] c "
					+ " left join [WMSDMSWPROD].[dbo].[ComplaintStatus] cs on  c.ComplaintStatusId = cs.ComplaintStatusId "
					+ " left join[WMSDMSWPROD].[dbo].[ComplaintType] crt on  c.complaintTypeId = crt.complaintTypeId"
					+ " left join[WMSDMSWPROD].[dbo].[RegistrationType] rt on  c.[RegistrtionTypeId] = rt.registrationTypeId"
					+ "	left join [WMSDMSWPROD].[dbo].[Ward] w on  c.wardId = w.wardId"
					+ "	left join [WMSDMSWPROD].[dbo].[Zone] z on  c.ZoneId = z.ZoneId"
					+ "	left join [WMSDMSWPROD].[dbo].[Circle] cc on  c.circleId = cc.circleId"
					+ "	left join [WMSDMSWPROD].[dbo].[BinsLocation] l on  c.locationId = l.locationId "
					+ "	left join [WMSDMSWPROD].[dbo].[Cluster] ccc on  c.clusterId = ccc.clusterId "
					+ " where ComplaintId is not null  "; 
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
						qry = qry + " and c.ComplaintTypeId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
						qry = qry + " and ComplaintId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
						qry = qry + " and c.complaintStatusId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(searchParameter)) {
						qry = qry + " and (c.ComplaintId like ?)";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj.getTransactionDate())) {
						if(obj.getTransactionDate().contains(",")) {
							String [] dates = obj.getTransactionDate().split(",");
							obj.setFrom_date(dates[0].trim());
							obj.setTo_date(dates[1].trim());
							qry = qry + " and TransactionDate >= CAST('"+obj.getFrom_date()+"' as DATE) and TransactionDate  < CAST('"+obj.getTo_date()+"' as DATE) ";
						}else {
							qry = qry + " and CAST(TransactionDate as DATE) = '"+obj.getTransactionDate()+"' ";
						}
					}
				
			if(!StringUtils.isEmpty(startIndex) && !StringUtils.isEmpty(offset)) {
				qry = qry + " ORDER BY c.ComplaintId desc offset ? rows  fetch next ? rows only";	
				arrSize++;
				arrSize++;
			}
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
			if(!StringUtils.isEmpty(searchParameter)) {
				pValues[i++] = "%"+searchParameter+"%";
			}
			if(!StringUtils.isEmpty(startIndex) && !StringUtils.isEmpty(offset)) {
				pValues[i++] = startIndex;
				pValues[i++] = offset;
			}
		    objsList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));

		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getRegtypeForUser(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "select   [RegistrationTypeId]"
					+ "      ,[RegistrationTypeCode]"
					+ "      ,[RegistrationTypeName]"
					+ "      ,[RegistrationTypeDesc]"
					+ "      ,[CreatedBy]"
					+ "      ,[ModifiedBy]"
					+ "      ,[CreatedDate]"
					+ "      ,[ModifiedDate]"
					+ "  FROM [WMSDMSWPROD].[dbo].[RegistrationType] ";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getWardtypeForUser(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "select w.[WardId]"
					+ "      ,w.[WardCode]"
					+ "      ,w.[WardName]"
					+ ",z.ZoneName"
					+ ",c.CircleName,c.CircleId"
					+ "      ,w.[Supervisor]"
					+ "      ,w.[CircleId]"
					+ "      ,w.[ZoneId]"
					+ "      ,w.[AreaId]"
					+ "      ,w.[LocationId]"
					+ "      ,w.[ClusterId]"
					+ "  FROM [WMSDMSWPROD].[dbo].[Ward] w "
					+ "left join [WMSDMSWPROD].[dbo].Zone z on w.ZoneId = z. ZoneId "
					+ "left join [WMSDMSWPROD].[dbo].[BinsLocation] l on  w.WardId = l.WardId "

					+ "left join [WMSDMSWPROD].[dbo].Circle c on z.ZoneId = c.ZoneId where w.[WardId] is not null ";
				
			
			int arrSize = 0;
			if(!StringUtils.isEmpty(user) && !StringUtils.isEmpty(user.getWardId())) {
				qry = qry + " and w.wardId = ? ";
				arrSize++;
			}
			if(!StringUtils.isEmpty(user) && !StringUtils.isEmpty(user.getLocationId())) {
				qry = qry + " and l.LocationId = ? ";
				arrSize++;
			}
			qry = qry + "group by w.[WardId]"
			+ "      ,w.[WardCode]"
			+ "      ,w.[WardName]"
			+ ",z.ZoneName"
			+ ",c.CircleName,c.CircleId"
			+ "      ,w.[Supervisor]"
			+ "      ,w.[CircleId]"
			+ "      ,w.[ZoneId]"
			+ "      ,w.[AreaId]"
			+ "      ,w.[LocationId]"
			+ "      ,w.[ClusterId] ";
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(user) && !StringUtils.isEmpty(user.getWardId())) {
				pValues[i++] = user.getWardId();
			}
			if(!StringUtils.isEmpty(user) && !StringUtils.isEmpty(user.getLocationId())) {
				pValues[i++] = user.getLocationId();
			}
			menuList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));
			Set<String> nameSet = new HashSet<>();
			menuList = menuList.stream()
		            .filter(e -> nameSet.add(e.getWardId()))
		            .collect(Collectors.toList());
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getLoctypeForUser(User obj) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "select b.[LocationId]"
					+ "      ,b.[LocationCode]"
					+ "      ,b.[LocationName]"
					+ "      ,c.[CircleId]"
					+ "      ,b.[WardId],b.ClusterId"
					+ "      ,b.[ZoneId],b.BinNumbers from [WMSDMSWPROD].[dbo].[BinsLocation] b "
					+ " left join [WMSDMSWPROD].[dbo].[circle] c on b.ZoneId = c.ZoneId";
			int arrSize = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBinNumbers())) {
				qry = qry + " and BinNumbers = ? ";
				arrSize++;
			}
			qry = qry + " GROUP BY b.[LocationId]"
					+ ",b.[LocationCode]"
					+ ",b.[LocationName]"
					+ ",c.[CircleId]"
					+ ",b.[WardId],b.ClusterId"
					+ ",b.[ZoneId],b.BinNumbers ";	
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getBinNumbers())) {
				pValues[i++] = obj.getBinNumbers();
			}
			
			menuList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));
			Set<String> nameSet = new HashSet<>();
			menuList = menuList.stream()
		            .filter(e -> nameSet.add(e.getBinNumbers()))
		            .collect(Collectors.toList());
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getClusterypeForUser(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "SELECT [ClusterId]"
					+ "      ,[ClusterName]"
					+ "  FROM [WMSDMSWPROD].[dbo].[Cluster]";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getZonetypeForUser(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "SELECT [ZoneId]"
					+ "      ,[ZoneName]"
					+ "    "
					+ "  FROM [WMSDMSWPROD].[dbo].[Zone]";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public List<User> getCircletypeForUser(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "SELECT [ComplaintTypeId]"
					+ "      ,[ComplaintTypeName]"
					+ "  FROM [WMSDMSWPROD].[dbo].[ComplaintType]";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

	public boolean CSubmit(User obj) throws Exception {
		int count = 0;
		boolean flag = false;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			NamedParameterJdbcTemplate namedParamJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
			obj.setComplaintStatusId("2");
				String insertQry = "INSERT INTO [WMSDMSWPROD].[dbo].[complaint] "
						+ "    (citizenName, complaintAddress, mobileNo, registrtionTypeId, transactionNo, transactionDate, "
						+ "    complaintStatusId, citizenEmailId, closingTime, zoneId, circleId, wardId, areaId, locationId, "
						+ "    complaintTypeId, complaintDescription, binNumber, others, smsStatus, createdBy,"
						+ "    createdDate, remarks, clusterId) "
						+ "VALUES "
						+ "    (:citizenName, :complaintAddress, :mobileNo, :registrtionTypeId, :transactionNo, :transactionDate, "
						+ "    :complaintStatusId, :citizenEmailId, :closingTime, :zoneId, :circleId, :wardId, :areaId, :locationId, "
						+ "    :complaintTypeId, :complaintDescription, :binNumber, :others, :smsStatus, :createdBy, "
						+ "    getdate(), :remarks, :clusterId);"
						+ "";
				BeanPropertySqlParameterSource paramSource = new BeanPropertySqlParameterSource(obj);		
			    KeyHolder keyHolder = new GeneratedKeyHolder();

			    count = namedParamJdbcTemplate.update(insertQry, new BeanPropertySqlParameterSource(obj), keyHolder, new String[]{"complaintId"});
			
			if(count > 0  && keyHolder.getKey() != null) {
		        // Retrieve generated complaintId
		        String complaintId = String.valueOf(keyHolder.getKey().intValue());
		        obj.setComplaintId(complaintId); // Set it in the object
				 insertQry = "INSERT INTO [WMSDMSWPROD].[dbo].[complaintHistory] "
				 		+ "    (complaintId, remarks, complaintStatusId, createdDate, createdBy) "
				 		+ "VALUES "
				 		+ "    ( :complaintId, :remarks, :complaintStatusId, :transactionDate, :createdBy);"
				 		+ ""
						+ "";
				paramSource = new BeanPropertySqlParameterSource(obj);		 
			    count = namedParamJdbcTemplate.update(insertQry, paramSource);
				
				flag = true;
			}
			transactionManager.commit(status);
		}catch (Exception e) {
			transactionManager.rollback(status);
			e.printStackTrace();
			throw new Exception(e);
		}
		return flag;
	}

	public List<User> getCList(User obj) throws Exception {
		List<User> objsList = null;
		try {
			int arrSize = 0;
			jdbcTemplate = new JdbcTemplate(dataSource);
			String qry = "SELECT complaintId, userId, citizenName, complaintAddress, mobileNo, c.[RegistrtionTypeId],registrationTypeName, transactionNo,  FORMAT(TransactionDate, 'MMM d, yy hh:mm tt') AS transactionDate, cs.complaintStatusId, "
					+ "citizenEmailId,  FORMAT(closingTime, 'MMM d, yy hh:mm tt') AS closingTime, z.zoneId,z.ZoneName, cc.circleId,  w.wardId,WardName, l.locationId,LocationName, crt.complaintTypeId, "
					+ "complaintDescription, binNumber, smsStatus, "
					+ "c.createdBy, c.modifiedBy, c.createdDate, c.modifiedDate, c.remarks, c.clusterId,clusterName "
					+ " ,complaintTypeCode,complaintTypeName,complaintStatusCode,complaintStatusName from [WMSDMSWPROD].[dbo].[Complaint] c "
					+ " left join [WMSDMSWPROD].[dbo].[ComplaintStatus] cs on  c.ComplaintStatusId = cs.ComplaintStatusId "
					+ " left join[WMSDMSWPROD].[dbo].[ComplaintType] crt on  c.complaintTypeId = crt.complaintTypeId"
					+ " left join[WMSDMSWPROD].[dbo].[RegistrationType] rt on  c.[RegistrtionTypeId] = rt.registrationTypeId"
					+ "	left join [WMSDMSWPROD].[dbo].[Ward] w on  c.wardId = w.wardId"
					+ "	left join [WMSDMSWPROD].[dbo].[Zone] z on  c.ZoneId = z.ZoneId"
					+ "	left join [WMSDMSWPROD].[dbo].[Circle] cc on  c.circleId = cc.circleId"
					+ "	left join [WMSDMSWPROD].[dbo].[BinsLocation] l on  c.locationId = l.locationId "
					+ "	left join [WMSDMSWPROD].[dbo].[Cluster] ccc on  c.clusterId = ccc.clusterId "
					+ " where ComplaintId is not null  "; 
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
						qry = qry + " and c.ComplaintTypeId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
						qry = qry + " and ComplaintId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
						qry = qry + " and c.complaintStatusId = ? ";
						arrSize++;
					}	
					if(!StringUtils.isEmpty(obj.getTransactionDate())) {
						if(obj.getTransactionDate().contains(",")) {
							String [] dates = obj.getTransactionDate().split(",");
							obj.setFrom_date(dates[0].trim());
							obj.setTo_date(dates[1].trim());
							qry = qry + " and TransactionDate >= CAST('"+obj.getFrom_date()+"' as DATE) and TransactionDate  < CAST('"+obj.getTo_date()+"' as DATE) ";
						}else {
							qry = qry + " and CAST(TransactionDate as DATE) = '"+obj.getTransactionDate()+"' ";
						}
					}
				
				qry = qry + " ORDER BY c.ComplaintId desc ";	
			
			Object[] pValues = new Object[arrSize];
			int i = 0;
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintTypeId())) {
				pValues[i++] = obj.getComplaintTypeId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintId())) {
				pValues[i++] = obj.getComplaintId();
			}
			if(!StringUtils.isEmpty(obj) && !StringUtils.isEmpty(obj.getComplaintStatusId())) {
				pValues[i++] = obj.getComplaintStatusId();
			}
			
		    objsList = jdbcTemplate.query( qry,pValues, new BeanPropertyRowMapper<User>(User.class));

		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		return objsList;
	}

	public List<User> getCHistory(User user) throws SQLException {
		List<User> menuList = null;
		try{  
			String qry = "SELECT ch.ComplaintHistoryId"
					+ "      ,ch.ComplaintId"
					+ "      ,ch.Remarks"
					+ "      ,ch.ComplaintStatusId"
					+ "		 ,ComplaintStatusName"
					+ "      ,ch.CreatedDate"
					+ "      ,ch.ModifiedDate"
					+ "      ,ch.CreatedBy"
					+ "      ,ch.ModifiedBy"
					+ ", CASE"
					+ "        WHEN ch.modifiedDate IS NULL THEN 'NILL' "
					+ "        ELSE CONCAT( "
					+ "            DATEDIFF(HOUR, ch.createdDate, ch.modifiedDate) % 24, ' H, ', "
					+ "            DATEDIFF(MINUTE, ch.createdDate, ch.modifiedDate) % 60, ' M' "
					+ "        ) "
					+ "    END AS time_difference"
					+ "  FROM [WMSDMSWPROD].[dbo].[ComplaintHistory] ch "
					+ "	 left join [WMSDMSWPROD].[dbo].[ComplaintStatus] cs on ch.ComplaintStatusId = cs.ComplaintStatusId"
					+ " where ch.ComplaintId = '"+ user.getComplaintId()+"'";
			menuList = jdbcTemplate.query( qry, new BeanPropertyRowMapper<User>(User.class));
			
		}catch(Exception e){ 
			e.printStackTrace();
			throw new SQLException(e.getMessage());
		}
		return menuList;
	}

}
