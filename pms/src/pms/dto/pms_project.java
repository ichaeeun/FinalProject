package pms.dto;
/*
create table pms_project(			-- 오버뷰, PM의 프로젝트 생성
		project_no number,				// 프로젝트번호
        project_name varchar2(100),		// 프로젝트명
        project_content varchar2(500),	// 프로젝트내용
        start1 varchar2(200),			// 시작일
        end1 varchar2(200),				// 종료일
        pm_pno number,					// pm번호
        project_status varchar2(50)		// 프로젝트 상태
); 
*/
public class pms_project {
	private int project_no;
	private String project_name;
	private String project_content;
	private String start1;
	private String end1;
	private int pm_pno;
	private String project_status;
	
	
	public pms_project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public pms_project(String project_name) {
		super();
		this.project_name = project_name;
	}
	
	public pms_project(int project_no) {
		super();
		this.project_no = project_no;
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
	public String getStart1() {
		return start1;
	}
	public void setStart1(String start1) {
		this.start1 = start1;
	}
	public String getEnd1() {
		return end1;
	}
	public void setEnd1(String end1) {
		this.end1 = end1;
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
