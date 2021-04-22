package pms.dto;
import java.util.ArrayList;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class RiskBoard {
	private int level;
	private int rnum;
	private int rnum1;
	private int risk_no;
	private int project_no;
	private String risk_title;
	private String risk_content;
	private String risk_category;
	private int risk_parent_no;
	private Date regdte;
	private String risk_status;
	private String project_name;
	private String risk_writer;
	private MultipartFile[] report;
	private String[] fnames;
	private ArrayList<RiskFile> fileInfo;
	private int risktotal; // 추가 // 대시보드
	private int riskcnt; // 추가 // 대시보드
	public RiskBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public int getRnum1() {
		return rnum1;
	}


	public void setRnum1(int rnum1) {
		this.rnum1 = rnum1;
	}


	public int getProject_no() {
		return project_no;
	}


	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}



	public String[] getFnames() {
		return fnames;
	}




	public void setFnames(String[] fnames) {
		this.fnames = fnames;
	}




	public ArrayList<RiskFile> getFileInfo() {
		return fileInfo;
	}




	public void setFileInfo(ArrayList<RiskFile> fileInfo) {
		this.fileInfo = fileInfo;
	}




	public MultipartFile[] getReport() {
		return report;
	}



	public void setReport(MultipartFile[] report) {
		this.report = report;
	}



	public String getRisk_writer() {
		return risk_writer;
	}


	public void setRisk_writer(String risk_writer) {
		this.risk_writer = risk_writer;
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
	public int getRiskcnt() {
		return riskcnt;
	}
	public void setRiskcnt(int riskcnt) {
		this.riskcnt = riskcnt;
	}
	public int getRisktotal() {
		return risktotal;
	}
	public void setRisktotal(int risktotal) {
		this.risktotal = risktotal;
	}
	
}
