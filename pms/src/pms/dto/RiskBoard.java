package pms.dto;
import java.util.Date;

public class RiskBoard {
	private int rnum;
	private int risk_no;	
	private String risk_title;
	private String risk_content;
	private String risk_category;
	private int risk_parent_no;
	private Date regdte;
	private String risk_status;
	private String project_name;
	public RiskBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRisk_title() {
		return risk_title;
	}

	public void setRisk_title(String risk_title) {
		this.risk_title = risk_title;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
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
	public int getRisk_parent_no() {
		return risk_parent_no;
	}
	public void setRisk_parent_no(int risk_parent_no) {
		this.risk_parent_no = risk_parent_no;
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
