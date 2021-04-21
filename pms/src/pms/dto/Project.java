package pms.dto;

public class Project {
	   private int project_no;
	   private String project_name;
	   private String project_content;
	   private String start;
	   private String end;
	   private int pm_pno;
	   private String project_status;
	   
	   public Project() {
	      super();
	      // TODO Auto-generated constructor stub
	   }
	   
	   public Project(int project_no, String project_name, String project_content, String start, String end, int pm_pno,
	         String project_status) {
	      super();
	      this.project_no = project_no;
	      this.project_name = project_name;
	      this.project_content = project_content;
	      this.start = start;
	      this.end = end;
	      this.pm_pno = pm_pno;
	      this.project_status = project_status;
	   }

	   public int getProject_no() {
	      return project_no;
	   }
	   public void setProject_no(int project_no) {
	      this.project_no = project_no;
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
	   public int getPm_pno() {
	      return pm_pno;
	   }
	   public void setPm_pno(int pm_pno) {
	      this.pm_pno = pm_pno;
	   }
	   public String getProject_status() {
	      return project_status;
	   }
	   public void setProject_status(String project_status) {
	      this.project_status = project_status;
	   }
	   
	}