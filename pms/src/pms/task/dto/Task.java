package pms.task.dto;

public class Task {
	private int task_no;
	private String task_content;
	private int task_pno;
	private String start;
	private String end;
	private String task_status;
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTask_no() {
		return task_no;
	}
	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}
	public String getTask_content() {
		return task_content;
	}
	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}
	public int getTask_pno() {
		return task_pno;
	}
	public void setTask_pno(int task_pno) {
		this.task_pno = task_pno;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTask_status() {
		return task_status;
	}
	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}
	
}
