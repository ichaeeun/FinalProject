package pms.dto;

public class Log {
	private int pno;
	private String name;
	private int project_no;
	private String regdte;
	
	public Log() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	public Log(String regdte, int pno, String name ) {
		super();
		this.pno = pno;
		this.name = name;
		this.regdte = regdte;
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

}
