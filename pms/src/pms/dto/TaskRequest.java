package pms.dto;

import java.util.Date;

public class TaskRequest {
	//<!-- project_name name request_dte -->
	private int pno;
	private int project_no;
	private int task_no;
	private String task_name;
	private String task_content;
	private String task_prriority;
	private int task_parent_no;
	private String startdte;
	private String enddte;
	private String task_status;
	private String project_name;
	private String name;
	private String request_dte;
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRequest_dte() {
		return request_dte;
	}
	public void setRequest_dte(String request_dte) {
		this.request_dte = request_dte;
	}
	public TaskRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TaskRequest(int pno, int project_no, int task_no, String task_name, String task_content,
			String task_prriority, int task_parent_no, String startdte, String enddte, String task_status) {
		super();
		this.pno = pno;
		this.project_no = project_no;
		this.task_no = task_no;
		this.task_name = task_name;
		this.task_content = task_content;
		this.task_prriority = task_prriority;
		this.task_parent_no = task_parent_no;
		this.startdte = startdte;
		this.enddte = enddte;
		this.task_status = task_status;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public int getTask_no() {
		return task_no;
	}
	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_content() {
		return task_content;
	}
	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}
	public String getTask_prriority() {
		return task_prriority;
	}
	public void setTask_prriority(String task_prriority) {
		this.task_prriority = task_prriority;
	}
	public int getTask_parent_no() {
		return task_parent_no;
	}
	public void setTask_parent_no(int task_parent_no) {
		this.task_parent_no = task_parent_no;
	}
	public String getStartdte() {
		return startdte;
	}
	public void setStartdte(String startdte) {
		this.startdte = startdte;
	}
	public String getEnddte() {
		return enddte;
	}
	public void setEnddte(String enddte) {
		this.enddte = enddte;
	}
	public String getTask_status() {
		return task_status;
	}
	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}
	
}
