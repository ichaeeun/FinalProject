package pms.dto;

public class UptStatus {
	private String risk_status;
	private int risk_no;
	
	
	
	public UptStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UptStatus(String risk_status, int risk_no) {
		super();
		this.risk_status = risk_status;
		this.risk_no = risk_no;
	}

	public String getRisk_status() {
		return risk_status;
	}
	public void setRisk_status(String risk_status) {
		this.risk_status = risk_status;
	}
	public int getRisk_no() {
		return risk_no;
	}
	public void setRisk_no(int risk_no) {
		this.risk_no = risk_no;
	}
	

}
