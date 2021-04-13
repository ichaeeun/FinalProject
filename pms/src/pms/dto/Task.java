package pms.dto;

import org.springframework.web.multipart.MultipartFile;

public class Task {
	   private int pno;
	   private int project_no;
	   private int task_no;
	   private String task_content;
	   private int task_parent_no;
	   private String startdte;
	   private String enddte;
	   private String task_status;
	   private String task_priority; //추가 
	   private String task_name; //추가 
	   private String name;	// 추가 // 디테일 화면에서 사원이름 조회 위함 
	   private String project_name; // 추가 // 디테일 화면에서 프로젝트 이름 조회 위함 
	   private MultipartFile[] report;		// 업로드 시 필요(파일 수정 시 업로드)
	   
	   
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

	public String getTask_priority() {
		return task_priority;
	}

	public void setTask_priority(String task_priority) {
		this.task_priority = task_priority;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public MultipartFile[] getReport() {
		return report;
	}

	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	   
	   
	}
