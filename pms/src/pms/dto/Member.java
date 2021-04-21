package pms.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.multipart.MultipartFile;

//	pms.dashboard.dto.Member
/*
	     pno number primary key, 
         id varchar2(50),
         pass varchar2(50),
         name varchar2(50),
         email varchar2(100),
         part varchar2(50),			-- 부서
         auth varchar2(50)
 */
public class Member {
	private int pno;
	private String id;
	private String pass;
	private String name;
	private String email;
	private String part;
	private String auth;	
	private int project_no;
	private String imgpath;
	private MultipartFile[] report;		
	private int membercnt; // 추가 // 대시보드 
		 	
		 	
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
	   try 
        {
            this.imgpath = URLEncoder.encode(imgpath,"utf-8");
        } 
        catch (UnsupportedEncodingException e) 
        {
            e.printStackTrace();
        }
        this.imgpath = imgpath;


	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pass, String name, String email, String imgpath, int pno) {
	super();
	this.id = id;
	this.pass = pass;
	this.name = name;
	this.email = email;
	this.imgpath = imgpath;
	this.pno =pno;
	}
	public Member(String id, String pass, String name, String email,int pno) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.pno=pno;
	}
	public Member(String name) {
		super();
		this.name = name;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getMembercnt() {
		return membercnt;
	}
	public void setMembercnt(int membercnt) {
		this.membercnt = membercnt;
	}
	
}