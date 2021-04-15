package pms.dto;

public class Overview {
	private String pno;
	private String name;	
	private int task_done;
	private int task_tot;
	private int progress;
	private String project_name;
	private String project_content;
	private int project_no;
	public Overview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Overview(String project_name) {
		super();
		this.project_name = project_name;
	}

	public Overview(String pno, String name, int task_done, int task_tot, String project_name) {
		super();
		this.pno = pno;
		this.name = name;
		this.task_done = task_done;
		this.task_tot = task_tot;
		this.project_name = project_name;
	}

	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTask_done() {
		return task_done;
	}
	public void setTask_done(int progress) {
		this.task_done = progress;
	}
	public int getTask_tot() {
		return task_tot;
	}
	public void setTask_tot(int task_tot) {
		this.task_tot = task_tot;
	}

	public int getProgress(){
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_content() {
		return project_content;
	}

	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}

	public int getProject_no() {
		return project_no;
	}

	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}

}
