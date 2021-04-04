package pms.dashboard.dto;

import java.util.Date;

/*
CREATE TABLE riskboard(
	risk_no NUMBER,
	risk_content varchar2(2000),
	risk_category varchar2(50),
	risk_parent_no NUMBER,
	regdte DATE,
	risk_status varchar2(50)
);
 */
public class RiskBoard {
	private int risk_no;
	private String risk_content;
	private String risk_category;
	private int parent_no;
	private Date regdte;
	private String risk_status;
	public RiskBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getRisk_no() {
		return risk_no;
	}
	public void setRisk_no(int risk_no) {
		this.risk_no = risk_no;
	}
	public String getRisk_content() {
		return risk_content;
	}
	public void setRisk_content(String risk_content) {
		this.risk_content = risk_content;
	}
	public String getRisk_category() {
		return risk_category;
	}
	public void setRisk_category(String risk_category) {
		this.risk_category = risk_category;
	}
	public int getParent_no() {
		return parent_no;
	}
	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public String getRisk_status() {
		return risk_status;
	}
	public void setRisk_status(String risk_status) {
		this.risk_status = risk_status;
	}
	
	
}
