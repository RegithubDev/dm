package com.resustainability.reisp.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BrainBox {

	private String id,    theme_code,    theme_name,action,is_anonymous,    description,inActive_themes,all_themes,active_themes,    created_date,    modified_date,
    title,    theme,sbu,    project,sbu_code,sbu_name,approver_name,project_code,project_name,role_code,from_and_to,from_date,to_date,department_code,department_name,
    department,    idea_no,StatusChanged,email,created_by,role,user,approver_type_before,approver_type_name,project_head,
    next_level_user,type_prevs,approver_prvs,modified_by,modified_user_name,modified_user_email,send_back_email,Creater_user_name,
    employee_code_before,relevent_idea,mainStatus,employee_code,assign_theme,ca_before,    status,    comments,user_name,user_id,email_id    ,approver_type,    approver_code,    assigned_on    ,action_taken    ,attachment    ,sb_notes,
    sb_date    ,reinitiate_date,submitter_email,i_completed,i_pending,admin_incidents,counts,maxRole2,not_assigned,maxRole,sendBack,
    estimated_improvements,do_ability,impact,impact_business,committee_members,idea_base_role,bb_impact,action_taken_now,theme1,theme2,theme3
    ,theme4,theme5,theme6,theme7,theme8,theme9,theme10,theme11,theme12,theme13,theme14,theme15,theme16,theme17,theme18,theme19,theme20,theme21,in_progress_count,resolved_count,rejected_count,
    theme22,theme23,theme24,theme25;

	public String getIn_progress_count() {
		return in_progress_count;
	}

	public void setIn_progress_count(String in_progress_count) {
		this.in_progress_count = in_progress_count;
	}

	public String getResolved_count() {
		return resolved_count;
	}

	public void setResolved_count(String resolved_count) {
		this.resolved_count = resolved_count;
	}

	public String getRejected_count() {
		return rejected_count;
	}

	public void setRejected_count(String rejected_count) {
		this.rejected_count = rejected_count;
	}

	private MultipartFile[] mediaList;
	List<BrainBox> BBIncidentsList,BBRolesList,titleList;
	
	public String getTheme1() {
		return theme1;
	}

	public void setTheme1(String theme1) {
		this.theme1 = theme1;
	}

	public String getTheme2() {
		return theme2;
	}

	public void setTheme2(String theme2) {
		this.theme2 = theme2;
	}

	public String getTheme3() {
		return theme3;
	}

	public void setTheme3(String theme3) {
		this.theme3 = theme3;
	}

	public String getTheme4() {
		return theme4;
	}

	public void setTheme4(String theme4) {
		this.theme4 = theme4;
	}

	public String getTheme5() {
		return theme5;
	}

	public void setTheme5(String theme5) {
		this.theme5 = theme5;
	}

	public String getTheme6() {
		return theme6;
	}

	public void setTheme6(String theme6) {
		this.theme6 = theme6;
	}

	public String getTheme7() {
		return theme7;
	}

	public void setTheme7(String theme7) {
		this.theme7 = theme7;
	}

	public String getTheme8() {
		return theme8;
	}

	public void setTheme8(String theme8) {
		this.theme8 = theme8;
	}

	public String getTheme9() {
		return theme9;
	}

	public void setTheme9(String theme9) {
		this.theme9 = theme9;
	}

	public String getTheme10() {
		return theme10;
	}

	public void setTheme10(String theme10) {
		this.theme10 = theme10;
	}

	public String getTheme11() {
		return theme11;
	}

	public void setTheme11(String theme11) {
		this.theme11 = theme11;
	}

	public String getTheme12() {
		return theme12;
	}

	public void setTheme12(String theme12) {
		this.theme12 = theme12;
	}

	public String getTheme13() {
		return theme13;
	}

	public void setTheme13(String theme13) {
		this.theme13 = theme13;
	}

	public String getTheme14() {
		return theme14;
	}

	public void setTheme14(String theme14) {
		this.theme14 = theme14;
	}

	public String getTheme15() {
		return theme15;
	}

	public void setTheme15(String theme15) {
		this.theme15 = theme15;
	}

	public String getTheme16() {
		return theme16;
	}

	public void setTheme16(String theme16) {
		this.theme16 = theme16;
	}

	public String getTheme17() {
		return theme17;
	}

	public void setTheme17(String theme17) {
		this.theme17 = theme17;
	}

	public String getTheme18() {
		return theme18;
	}

	public void setTheme18(String theme18) {
		this.theme18 = theme18;
	}

	public String getTheme19() {
		return theme19;
	}

	public void setTheme19(String theme19) {
		this.theme19 = theme19;
	}

	public String getTheme20() {
		return theme20;
	}

	public void setTheme20(String theme20) {
		this.theme20 = theme20;
	}

	public String getTheme21() {
		return theme21;
	}

	public void setTheme21(String theme21) {
		this.theme21 = theme21;
	}

	public String getTheme22() {
		return theme22;
	}

	public void setTheme22(String theme22) {
		this.theme22 = theme22;
	}

	public String getTheme23() {
		return theme23;
	}

	public void setTheme23(String theme23) {
		this.theme23 = theme23;
	}

	public String getTheme24() {
		return theme24;
	}

	public void setTheme24(String theme24) {
		this.theme24 = theme24;
	}

	public String getTheme25() {
		return theme25;
	}

	public void setTheme25(String theme25) {
		this.theme25 = theme25;
	}

	public String getAction_taken_now() {
		return action_taken_now;
	}

	public void setAction_taken_now(String action_taken_now) {
		this.action_taken_now = action_taken_now;
	}

	public String getBb_impact() {
		return bb_impact;
	}

	public void setBb_impact(String bb_impact) {
		this.bb_impact = bb_impact;
	}

	public String getImpact_business() {
		return impact_business;
	}

	public void setImpact_business(String impact_business) {
		this.impact_business = impact_business;
	}

	public String getEstimated_improvements() {
		return estimated_improvements;
	}

	public void setEstimated_improvements(String estimated_improvements) {
		this.estimated_improvements = estimated_improvements;
	}

	public String getDo_ability() {
		return do_ability;
	}

	public void setDo_ability(String do_ability) {
		this.do_ability = do_ability;
	}

	public String getIs_anonymous() {
		return is_anonymous;
	}

	public void setIs_anonymous(String is_anonymous) {
		this.is_anonymous = is_anonymous;
	}

	public String getCounts() {
		return counts;
	}

	public void setCounts(String counts) {
		this.counts = counts;
	}

	public List<BrainBox> getTitleList() {
		return titleList;
	}

	public void setTitleList(List<BrainBox> titleList) {
		this.titleList = titleList;
	}

	public String getIdea_base_role() {
		return idea_base_role;
	}

	public void setIdea_base_role(String idea_base_role) {
		this.idea_base_role = idea_base_role;
	}

	public String getCommittee_members() {
		return committee_members;
	}

	public void setCommittee_members(String committee_members) {
		this.committee_members = committee_members;
	}

	public String getSendBack() {
		return sendBack;
	}

	public void setSendBack(String sendBack) {
		this.sendBack = sendBack;
	}

	public String getMaxRole() {
		return maxRole;
	}

	public void setMaxRole(String maxRole) {
		this.maxRole = maxRole;
	}

	public String getNot_assigned() {
		return not_assigned;
	}

	public void setNot_assigned(String not_assigned) {
		this.not_assigned = not_assigned;
	}

	public String getMaxRole2() {
		return maxRole2;
	}

	public void setMaxRole2(String maxRole2) {
		this.maxRole2 = maxRole2;
	}

	public String getI_completed() {
		return i_completed;
	}

	public void setI_completed(String i_completed) {
		this.i_completed = i_completed;
	}

	public String getI_pending() {
		return i_pending;
	}

	public void setI_pending(String i_pending) {
		this.i_pending = i_pending;
	}

	public String getAdmin_incidents() {
		return admin_incidents;
	}

	public void setAdmin_incidents(String admin_incidents) {
		this.admin_incidents = admin_incidents;
	}

	public String getSubmitter_email() {
		return submitter_email;
	}

	public void setSubmitter_email(String submitter_email) {
		this.submitter_email = submitter_email;
	}

	public String getCreater_user_name() {
		return Creater_user_name;
	}

	public void setCreater_user_name(String creater_user_name) {
		Creater_user_name = creater_user_name;
	}

	public String getSend_back_email() {
		return send_back_email;
	}

	public void setSend_back_email(String send_back_email) {
		this.send_back_email = send_back_email;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getModified_user_email() {
		return modified_user_email;
	}

	public void setModified_user_email(String modified_user_email) {
		this.modified_user_email = modified_user_email;
	}

	public String getModified_user_name() {
		return modified_user_name;
	}

	public void setModified_user_name(String modified_user_name) {
		this.modified_user_name = modified_user_name;
	}

	public String getModified_by() {
		return modified_by;
	}

	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}

	public String getCa_before() {
		return ca_before;
	}

	public void setCa_before(String ca_before) {
		this.ca_before = ca_before;
	}

	public String getProject_head() {
		return project_head;
	}

	public void setProject_head(String project_head) {
		this.project_head = project_head;
	}

	public String getAssign_theme() {
		return assign_theme;
	}

	public void setAssign_theme(String assign_theme) {
		this.assign_theme = assign_theme;
	}

	public String getApprover_type_before() {
		return approver_type_before;
	}

	public void setApprover_type_before(String approver_type_before) {
		this.approver_type_before = approver_type_before;
	}

	public String getApprover_type_name() {
		return approver_type_name;
	}

	public void setApprover_type_name(String approver_type_name) {
		this.approver_type_name = approver_type_name;
	}

	public String getNext_level_user() {
		return next_level_user;
	}

	public void setNext_level_user(String next_level_user) {
		this.next_level_user = next_level_user;
	}

	public String getType_prevs() {
		return type_prevs;
	}

	public void setType_prevs(String type_prevs) {
		this.type_prevs = type_prevs;
	}

	public String getApprover_prvs() {
		return approver_prvs;
	}

	public void setApprover_prvs(String approver_prvs) {
		this.approver_prvs = approver_prvs;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getEmployee_code_before() {
		return employee_code_before;
	}

	public void setEmployee_code_before(String employee_code_before) {
		this.employee_code_before = employee_code_before;
	}

	public String getStatusChanged() {
		return StatusChanged;
	}

	public void setStatusChanged(String statusChanged) {
		StatusChanged = statusChanged;
	}

	public String getApprover_name() {
		return approver_name;
	}

	public void setApprover_name(String approver_name) {
		this.approver_name = approver_name;
	}

	public String getEmployee_code() {
		return employee_code;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

	public String getMainStatus() {
		return mainStatus;
	}

	public void setMainStatus(String mainStatus) {
		this.mainStatus = mainStatus;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public List<BrainBox> getBBRolesList() {
		return BBRolesList;
	}

	public void setBBRolesList(List<BrainBox> bBRolesList) {
		BBRolesList = bBRolesList;
	}

	public List<BrainBox> getBBIncidentsList() {
		return BBIncidentsList;
	}

	public void setBBIncidentsList(List<BrainBox> bBIncidentsList) {
		BBIncidentsList = bBIncidentsList;
	}

	public MultipartFile[] getMediaList() {
		return mediaList;
	}

	public void setMediaList(MultipartFile[] mediaList) {
		this.mediaList = mediaList;
	}

	public String getIdea_no() {
		return idea_no;
	}

	public void setIdea_no(String idea_no) {
		this.idea_no = idea_no;
	}

	public String getRelevent_idea() {
		return relevent_idea;
	}

	public void setRelevent_idea(String relevent_idea) {
		this.relevent_idea = relevent_idea;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getApprover_type() {
		return approver_type;
	}

	public void setApprover_type(String approver_type) {
		this.approver_type = approver_type;
	}

	public String getApprover_code() {
		return approver_code;
	}

	public void setApprover_code(String approver_code) {
		this.approver_code = approver_code;
	}

	public String getAssigned_on() {
		return assigned_on;
	}

	public void setAssigned_on(String assigned_on) {
		this.assigned_on = assigned_on;
	}

	public String getAction_taken() {
		return action_taken;
	}

	public void setAction_taken(String action_taken) {
		this.action_taken = action_taken;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public String getSb_notes() {
		return sb_notes;
	}

	public void setSb_notes(String sb_notes) {
		this.sb_notes = sb_notes;
	}

	public String getSb_date() {
		return sb_date;
	}

	public void setSb_date(String sb_date) {
		this.sb_date = sb_date;
	}

	public String getReinitiate_date() {
		return reinitiate_date;
	}

	public void setReinitiate_date(String reinitiate_date) {
		this.reinitiate_date = reinitiate_date;
	}

	public String getFrom_and_to() {
		return from_and_to;
	}

	public void setFrom_and_to(String from_and_to) {
		this.from_and_to = from_and_to;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getInActive_themes() {
		return inActive_themes;
	}

	public void setInActive_themes(String inActive_themes) {
		this.inActive_themes = inActive_themes;
	}

	public String getAll_themes() {
		return all_themes;
	}

	public void setAll_themes(String all_themes) {
		this.all_themes = all_themes;
	}

	public String getActive_themes() {
		return active_themes;
	}

	public void setActive_themes(String active_themes) {
		this.active_themes = active_themes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTheme_code() {
		return theme_code;
	}

	public void setTheme_code(String theme_code) {
		this.theme_code = theme_code;
	}

	public String getTheme_name() {
		return theme_name;
	}

	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImpact() {
		return impact;
	}

	public void setImpact(String impact) {
		this.impact = impact;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getModified_date() {
		return modified_date;
	}

	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getSbu() {
		return sbu;
	}

	public void setSbu(String sbu) {
		this.sbu = sbu;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getSbu_code() {
		return sbu_code;
	}

	public void setSbu_code(String sbu_code) {
		this.sbu_code = sbu_code;
	}

	public String getSbu_name() {
		return sbu_name;
	}

	public void setSbu_name(String sbu_name) {
		this.sbu_name = sbu_name;
	}

	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
