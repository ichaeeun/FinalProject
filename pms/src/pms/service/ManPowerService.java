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
	
	public ArrayList<Member> memList1(String name){
		return dao.memList1(name);
	}
	
	public ArrayList<Integer> pnoList(HashMap<String,String> hm){
		hm.put("pm", "pm");
		hm.put("wk", "wk");
		return dao.pnoList(hm);
	}
	
	public ArrayList<ProjectAdd> projectList(int pno){
		return dao.projectList(pno);
		
	}
	
	public String status(int project_no) {
		return dao.status(project_no);
	}
	
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
}









