package pms.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pms.dto.Member;
import pms.dto.ProjectAdd;
import pms.service.ManPowerService;

@Controller
@RequestMapping("manpower.do")
public class ManPowerController {
	@Autowired(required=false)
	private ManPowerService service;
	// http://localhost:7080/pms/manpower.do?method=contacts_list2
	@RequestMapping(params="method=contacts_list")
	public String memList1(@ModelAttribute("sch") Member sch, Model d) {
		// 전체 인원
		d.addAttribute("memList",service.memList1());
		return "contacts-list";
	}	
	
	// http://localhost:7080/pms/manpower.do?method=contacts_list2
	@RequestMapping(params="method=contacts_list2")
	public String memList(@ModelAttribute("sch") Member sch, Model d) {		
		// 가용 인원
		// pm이나 wk인 직원의 사원번호 가져오기
		HashMap<String,String> hm = new HashMap<String,String>();
		ArrayList<Integer> pno = service.pnoList(hm);
		Object[] pnoNum = pno.toArray();	
		// 해당 사원이 맡은 or 맡았던 프로젝트 넘버 가져오기
		int[] project_no = new int[pnoNum.length]; 
		ArrayList<ProjectAdd> add = new ArrayList<ProjectAdd>();
		System.out.println(pno.size());
		// 담당 프로젝트 가져오기, 상태 가져오기
		int sum = 0;
		ArrayList<Member> memList2 = new ArrayList<Member>();
		for(int i=0;i<pno.size();i++) { 
			add = service.projectList(pno.get(i));
			for(int j=0;j<add.size();j++) {
				System.out.println(add.get(j).getProject_no());
				String status = service.status(add.get(j).getProject_no());
				if(status.equals("진행")) {
					sum++;
				}
			}
			if(sum==0) {
				System.out.println("전부 완료인 애들의 사원 번호: "+pno.get(i));
				System.out.println(service.memPoss(pno.get(i)).getName());
				memList2.add(service.memPoss(pno.get(i)));
			}
			sum=0;	
		}
		d.addAttribute("memList2",memList2);
		return "contacts-list2";
	}
	
	// http://localhost:7080/pms/manpower.do?method=contacts_list3
	
	
	@RequestMapping(params="method=contacts_list3")
	public String memList3(@ModelAttribute("sch") Member sch, Model d,
						HttpServletRequest request){
		// 부서 목록
		d.addAttribute("deptList",service.deptList());
		String dvalue = request.getParameter("dvalue");
		if(dvalue==null) dvalue="";
		System.out.println("dvalue:"+dvalue);
		System.out.println(service.memList3(dvalue).size());
		d.addAttribute("memList3", service.memList3(dvalue));
		System.out.println(service.memList3(dvalue).get(0).getName());
		return "contacts-list3";
	} 
	  
	// http://localhost:7080/pms/manpower.do?method=contacts_profile
	@RequestMapping(params="method=contacts_profile")
	public String contacts_profile() {
		return "contacts-profile";
	}
	
}


