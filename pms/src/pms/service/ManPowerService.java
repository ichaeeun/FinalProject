package pms.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.ManPowerDao;
import pms.dto.Member;
import pms.dto.ProjectAdd;
import pms.dto.pms_project;

@Service
public class ManPowerService {
	@Autowired(required=false)
	private ManPowerDao dao;
	// 전체 인원 조회
	public ArrayList<Member> memList1(String name){
		return dao.memList1(name);
	}

	// 가용인원 조회
	// 1) 사원의 직급 가져오기
	public ArrayList<Integer> pnoList(HashMap<String,String> hm){
		hm.put("pm", "pm");
		hm.put("wk", "wk");	
		return dao.pnoList(hm);
	}
	// 2) 해당 사원의 프로젝트 리스트 가져오기
	public ArrayList<ProjectAdd> projectList(int pno){	
		return dao.projectList(pno);	
	}
	// 3) 프로젝트 상태 가져오기
	public String status(int project_no) {
		return dao.status(project_no);
	}
	// 4) 사원 정보 가져오기
	public Member memPoss(int pno) {
		return dao.memPoss(pno);
	}
	

	
	
	
	
	
	public ArrayList<Member> deptList(){
		return dao.deptList();
	}
	
	public ArrayList<Member> memList3(String part){
		return dao.memList3(part);
	}
	public pms_project project(int project_no) {
		return dao.project(project_no);
	}
	public ArrayList<ProjectAdd> projectpno(int pno){
		return dao.projectpno(pno);
	}
	
	public ArrayList<Member> authList(){
		return dao.authList();
	}
	
	public void addMember(Member ins) {
		dao.addMember(ins);
	}
	
	public void deleteMember(int pno) {
		dao.deleteMember(pno);
	}
	
	public ArrayList<pms_project> allProject(){
		return dao.allProject();
	}
	
	public void alertAuth(Member member) {
		dao.alertAuth(member);
	}
	
	public void insertProject(Member member) {
		dao.insertProject(member);
	}
}









