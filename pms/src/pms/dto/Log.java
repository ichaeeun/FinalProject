package pms.dto;

public class Log {
	private int pno;
	private String name;
	private int project_no;
	private String project_name;
	private int task_no;
	private String regdte;
	private String task_name;
	private String status;
	public Log() {
		super();
		// TODO Auto-generated constructor stub
	}	
	public Log(int pno, int project_no, int task_no, String status) {
		super();
		this.pno = pno;
		this.project_no = project_no;
		this.task_no = task_no;
		this.status = status;
	}

	public Log(String regdte, int pno, String name ) {
		super();
		this.pno = pno;
		this.name = name;
		this.regdte = regdte;
	}

	public Log(int pno, int project_no, int task_no) {
		super();
		this.pno = pno;
		this.project_no = project_no;
		this.task_no = task_no;
	}

	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public String getRegdte() {
		return regdte;
	}
	public void setRegdte(String regdte) {
		this.regdte = regdte;
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


}
