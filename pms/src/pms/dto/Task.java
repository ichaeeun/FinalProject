package pms.dto;

public class Task {
	   private int pno;
	   private int project_no;
	   private int task_no;
	   private String task_content;
	   private int task_parent_no;
	   private String start;
	   private String end;
	   private String task_status;
	   
	   public Task() {
	      super();
	      // TODO Auto-generated constructor stub
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
	   public String getTask_content() {
	      return task_content;
	   }
	   public void setTask_content(String task_content) {
	      this.task_content = task_content;
	   }
	   public int getTask_parent_no() {
	      return task_parent_no;
	   }
	   public void setTask_parent_no(int task_parent_no) {
	      this.task_parent_no = task_parent_no;
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
