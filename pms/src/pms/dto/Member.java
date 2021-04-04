package pms.dto;
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
}