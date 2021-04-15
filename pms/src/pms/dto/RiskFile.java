package pms.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/*
	fno NUMBER PRIMARY KEY,
	name varchar2(50),
	rnum NUMBER,
	filename varchar2(200),
	filepath varchar2(1000),
	uptDte date
 */
public class RiskFile {
	private int fno;
	private String name;
	private int rnum;
	private String filename;
	private String filepath;
	private Date uptDte;
	private MultipartFile[] report;
	
	public RiskFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public RiskFile(String name, int rnum, String filename, String filepath) {
		super();
		this.name = name;
		this.rnum = rnum;
		this.filename = filename;
		this.filepath = filepath;
	}


	public RiskFile(int fno, String name, int rnum, String filename, String filepath, Date uptDte) {
		super();
		this.fno = fno;
		this.name = name;
		this.rnum = rnum;
		this.filename = filename;
		this.filepath = filepath;
		this.uptDte = uptDte;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getUptDte() {
		return uptDte;
	}

	public void setUptDte(Date uptDte) {
		this.uptDte = uptDte;
	}

	public MultipartFile[] getReport() {
		return report;
	}

	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	

}
