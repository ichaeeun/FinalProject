package pms.dto;

public class ProjectAdd {
	private int pno;
	private int project_no;
	
	public ProjectAdd() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProjectAdd(int pno) {
		super();
		this.pno = pno;
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
	
}
