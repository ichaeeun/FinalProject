package pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Member;
import pms.dto.pms_project;
import pms.dto.pms_projectSch;
import pms.service.MypageService;
import pms.service.ProjectService;

@Controller
@RequestMapping("project.do")
public class ProjectController {
	@Autowired(required = false)
	private ProjectService service;
	@Autowired(required = false)
	private MypageService service2;
	// 진행 프로젝트 리스트_CEO,인사담당자 화면
	// http://localhost:7080/pms/project.do?method=project_list
	@RequestMapping(params="method=project_list")
	public String pms_projectList(@ModelAttribute("sch") pms_projectSch sch, Model d) {
		d.addAttribute("boardList", service.pms_projectList(sch));
		return "project_list";
	}
	
	// 완료 프로젝트 리스트_CEO,인사담당자 화면
	// http://localhost:7080/pms/project.do?method=project_list2
	@RequestMapping(params="method=project_list2")
	public String pms_projectList2(@ModelAttribute("sch2") pms_projectSch sch2, Model d) {
		d.addAttribute("boardList", service.pms_projectList2(sch2));
		return "project_list";
	}
	// 멤버번호 pno의 진행 프로젝트 조회
	// http://localhost:7080/pms/project.do?method=list
	@RequestMapping(params="method=list")
	public String pms_projectList(@ModelAttribute("sch3") pms_project sch3, Model d, int pno) {
		d.addAttribute("boardList", service.projectList(pno));
		return "project_list";
	}
	// 멤버번호 pno의 완료 프로젝트 조회
	// 	// http://localhost:7080/pms/project.do?method=finish_list
	@RequestMapping(params="method=finish_list")
	public String pms_projectList2(@ModelAttribute("sch4") pms_project sch4, Model d, int pno) {
		d.addAttribute("boardList", service.projectList2(pno));
		return "project_list";
	}
	
	// 프로젝트 상세 화면(오버뷰)_프로젝트 번호로 프로젝트 정보
	// http://localhost:7080/pms/project.do?method=project_detail
	@RequestMapping(params="method=project_detail")
	public String project_detail(@RequestParam("pno") int pno, Model d) {
		d.addAttribute("pms_project", service.getProject(pno));
		return "project_detail";
	}
	
	
	// 프로젝트 등록
	// http://localhost:7080/pms/project.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertProject(pms_project insert, Model d) {
		System.out.println("#등록:"+insert.getProject_name());
		System.out.println("프로젝트내용:"+insert.getProject_content());
		System.out.println("담당PM의번호:"+insert.getPm_pno());
		service.insertProject(insert);
		
		d.addAttribute("success", "Y");
		return "pageJsonReport";
	}
	// 프로젝트 수정
	// http://localhost:7080/pms/project.do?method=update
	@RequestMapping(params="method=update")
	public String updateProject(pms_project update, Model d) {
		System.out.println("수정:"+update.getProject_name());
		System.out.println("프로젝트의 상태:"+update.getProject_status());
		System.out.println("프로젝트의 번호:"+update.getProject_no());
		

		service.updateProject(update);
		
		
		d.addAttribute("success", "Y");
		return "pageJsonReport";
	}
	
	// 태스크 상태를 모두 완료로 변경
	@RequestMapping(params="method=update2")
	public String updateTask(@RequestParam("no") int no, Model d) {
		service.updateTask(no);	// 태스크 상태를 모두 완료로 변경 
		return "project_detail";
	}
	// pmlist를 모델값으로 전달
	@ModelAttribute("pmlist")
	public ArrayList<Member> pmlist(){
		return service.pmlist();
	}
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		int pno=0;
		if(m!=null) pno = m.getPno();
		return service2.showProfile(pno);
	}

}
