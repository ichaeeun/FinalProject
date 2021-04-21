package pms.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Member;
import pms.dto.MemberSch;
import pms.dto.ProjectAdd;
import pms.dto.pms_project;
import pms.service.ManPowerService;
import pms.service.MypageService;

@Controller
@RequestMapping("manpower.do")
public class ManPowerController {
	@Autowired(required = false)
	private ManPowerService service;
	@Autowired(required=false)
	private MypageService service2;
	// http://localhost:7080/pms/manpower.do?method=jsonContactList
	@RequestMapping(params = "method=jsonContactList")
	public String memList1(@RequestParam("name") String name, 
			@ModelAttribute("sch") MemberSch sch,
			Model d) {
		// 전체 인원
		// if (sch.getName() == null) sch.setName("");
		// if(name==null) name="";
		// System.out.println("검색이름:"+sch.getName());
		d.addAttribute("memList1",service.memList1(name));
		// 부서 목록
		d.addAttribute("partList", service.deptList());
		// 권한 목록
		d.addAttribute("authList", service.authList());
		d.addAttribute("memList", service.showMem(sch));
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/manpower.do?method=contacts_list
	@RequestMapping(params="method=contacts_list")
	public String showMem(Model d, @ModelAttribute("sch") MemberSch sch) {
		System.out.println("##현재페이지:"+sch.getCurPage());
		d.addAttribute("partList", service.deptList());
		d.addAttribute("authList", service.authList());
		d.addAttribute("memList", service.showMem(sch));
		return "contacts-list";
	}
	
	/*
	 * @RequestMapping(params="method=allMan") public String
	 * allMan(@RequestParam("shName") String name, Model d) { if(name==null)
	 * name=""; d.addAttribute("memList1", service.memList1(sch)); return "allMan";
	 * }
	 */

	// http://localhost:7080/pms/manpower.do?method=contacts_list2
	@RequestMapping(params = "method=contacts_list2")
	public String memList(@ModelAttribute("sch") Member sch, Model d) {
		// 가용 인원
		// pm이나 wk인 직원의 사원번호 가져오기
		HashMap<String, String> hm = new HashMap<String, String>(); //
		ArrayList<Integer> pno = service.pnoList(hm);
		Object[] pnoNum = pno.toArray();
		// 해당 사원이 맡은 or 맡았던 프로젝트 넘버 가져오기
		int[] project_no = new int[pnoNum.length];
		ArrayList<ProjectAdd> add = new ArrayList<ProjectAdd>();
		System.out.println(pno.size());
		// 담당 프로젝트 가져오기, 상태 가져오기
		int sum = 0;
		ArrayList<Member> memList2 = new ArrayList<Member>();
		for (int i = 0; i < pno.size(); i++) {
			add = service.projectList(pno.get(i));
			for (int j = 0; j < add.size(); j++) {
				System.out.println(add.get(j).getProject_no());
				String status = service.status(add.get(j).getProject_no());
				System.out.println(status);
				if (status.equals("진행")) {
					sum++;
				}
			}
			if (sum == 0||project_no==null) {
				System.out.println("전부 완료인 애들의 사원 번호: " + pno.get(i));
				System.out.println(service.memPoss(pno.get(i)).getName());
				memList2.add(service.memPoss(pno.get(i)));
			}
			sum = 0;
		}
		d.addAttribute("memList2", memList2);
		d.addAttribute("allProject",service.allProject());
		return "contacts-list2";
	}

	// http://localhost:7080/pms/manpower.do?method=contacts_list3

	@RequestMapping(params = "method=contacts_list3")
	public String memList3(@ModelAttribute("sch") Member sch, 
			Model d, HttpServletRequest request) {
		// 부서 목록
		d.addAttribute("deptList", service.deptList());
		String dvalue = request.getParameter("dvalue");
		if (dvalue == null)
			dvalue = "";
		d.addAttribute("dvalue",dvalue);
		System.out.println("dvalue:" + dvalue);
		System.out.println(service.memList3(dvalue).size());
		d.addAttribute("memList3", service.memList3(dvalue));
		System.out.println(service.memList3(dvalue).get(0).getName());
		return "contacts-list3";
	}

	// http://localhost:7080/pms/manpower.do?method=contacts_profile
	@RequestMapping(params = "method=contacts_profile")
	public String contacts_profile(Model d, 
			@RequestParam("ename") String ename, 
			@RequestParam("pno") int pno,
			MemberSch sch) {
		  System.out.println("ename:"+ename);
		  System.out.println("pno:"+pno);
		  d.addAttribute("memDetail",service.memList1(ename)); 
		  ArrayList<pms_project> proList = new ArrayList<pms_project>(); 
		  for(int i=0;i<service.projectpno(pno).size();i++) {
			  proList.add(service.project(service.projectpno(pno).get(i).getProject_no()));
		  } 
		  d.addAttribute("proList",proList);

		return "contacts-profile";
	}

	/*
	@RequestMapping(params="method=update")  // 태스크 수정 
	public String updateTask(Task t,Model d) {
		service.updateTask(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	*/
	// http://localhost:7080/pms/manpower.do?method=add_member
	@PostMapping(params = "method=add_member")
	public String add_member(Member ins, Model d){
		service.addMember(ins);
		d.addAttribute("success","Y");
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/manpower.do?method=delete_member
	@RequestMapping(params="method=delete_member")
	public String deleteMember(int pno) {
		service.deleteMember(pno);
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/manpower.do?method=addProject
	@RequestMapping(params="method=addProject")
	public String addProject(Model d) {
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/manpower.do?method=alertAuth
	@PostMapping(params="method=alertAuth")
	public String alertAuth(Model d, Member member) {
		service.alertAuth(member);
		return "pageJsonReport";
	}
	// http://localhost:7080/pms/manpower.do?method=insertProject
	@PostMapping(params="method=insertProject")
	public String insertProject(Model d, Member member) {
		service.insertProject(member);
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/manpower.do?method=chId
	@PostMapping(params="method=chId")
	public String chId(@RequestParam("id") String id, Model d) {
		int idCnt = service.chId(id);
		System.out.println("아이디 수:"+idCnt);
		if(idCnt==0&&id!="") {
			d.addAttribute("success","Y");
		}else {
			d.addAttribute("success","N");
		}
		return "pageJsonReport";
	}
	// http://localhost:7080/pms/manpower.do?method=chEmail
	@PostMapping(params="method=chEmail")
	public String chEmail(@RequestParam("email") String email, Model d) {
		int emailCnt = service.chEmail(email);
		if(emailCnt==0&&email!="") {
			d.addAttribute("success","Y");
		}else {
			d.addAttribute("success","N");
		}
		return "pageJsonReport";
	}	
	
	@ModelAttribute("showprofile")  //프로젝트 별 인원 공통 어트리뷰트 
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		return service2.showProfile(m.getPno());
	}
}






