package pms.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TaskFile {
//	 fileno number primary key,
//	    task_no number,
//	    filename varchar2(200),
//	    filepath varchar2(1000),
//	    upload_dte date
	private int fileno;
	private String name;
	private int task_no; 
	private String filename;
	private String filepath;
	private Date upload_dte;
	private MultipartFile[] report;		// 업로드 시 필요(파일 수정 시 업로드)
	
	
	public TaskFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public TaskFile(int task_no, String filename, String filepath) {
		super();
		this.task_no = task_no;
		this.filename = filename;
		this.filepath = filepath;
	}
	

	public TaskFile(String name, int task_no, String filename, String filepath) {
		super();
		this.name = name;
		this.task_no = task_no;
		this.filename = filename;
		this.filepath = filepath;
	}


	public TaskFile(int fileno, int task_no, String filename, String filepath, Date upload_dte,
			MultipartFile[] report) {
		super();
		this.fileno = fileno;
		this.task_no = task_no;
		this.filename = filename;
		this.filepath = filepath;
		this.upload_dte = upload_dte;
		this.report = report;
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public int getTask_no() {
		return task_no;
	}
	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Date getUpload_dte() {
		return upload_dte;
	}
	public void setUpload_dte(Date upload_dte) {
		this.upload_dte = upload_dte;
	}
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
}
