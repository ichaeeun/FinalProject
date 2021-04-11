package pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.pms_project;
import pms.dto.pms_projectSch;
import pms.service.ProjectService;

@Controller
@RequestMapping("project.do")
public class ProjectController {
	@Autowired(required = false)
	ProjectService service;
	
	
	/* 전체 프로젝트 리스트(진행)_CEO,인사담당자 화면  */
	// http://localhost:7080/pms/project.do?method=project_list
	@RequestMapping(params="method=project_list")
	public String pms_projectList(@ModelAttribute("sch") pms_projectSch sch, 
			Model d, HttpServletRequest request, HttpSession session) {
		d.addAttribute("boardList", service.pms_projectList(sch));
		return "project_list";
	}
	/* 전체 프로젝트 리스트(완료)_CEO,인사담당자 화면  */
	// http://localhost:7080/pms/project.do?method=project_list2
	@RequestMapping(params="method=project_list2")
	public String pms_projectList2(@ModelAttribute("sch0") pms_projectSch sch0, 
			Model d, HttpServletRequest request, HttpSession session) {
		d.addAttribute("boardList2", service.pms_projectList2(sch0));
		return "project_list_finish(all)";
	}
	
	
	// 프로젝트 상세 화면
	// http://localhost:7080/pms/project.do?method=project_detail
	@RequestMapping(params="method=project_detail")
	public String project_detail(@RequestParam("no") int no, Model d) {
		d.addAttribute("pms_project", service.getProject(no));
		return "project_detail";
	}
	// 프로젝트 등록 화면
	// http://localhost:7080/pms/project.do?method=project_insert
	@RequestMapping(params="method=project_insert")
	public String insertProject(pms_project insert, Model d) {
		System.out.println("등록:"+insert.getProject_name());
		service.insertProject(insert);
		d.addAttribute("success", "Y");
		return "pageJsonReport";
	}
	// 멤버번호 pno의 진행중 프로젝트 조회
	// http://localhost:7080/pms/project.do?method=list ?&no=${mem.pno}
	@RequestMapping(params="method=list")
	public String pms_projectList(@ModelAttribute("sch2") pms_project sch2, Model d, int no) {
		d.addAttribute("plist", service.projectList(no));
		return "project_list_doing(one)";
	}
	
	// 멤버번호 pno의 완료된 프로젝트 조회
	// http://localhost:7080/pms/project.do?method=finish_list
	@RequestMapping(params="method=finish_list")
	public String pms_projectList2(@ModelAttribute("sch3") pms_project sch3, Model d, int no) {
		d.addAttribute("plist2", service.projectList2(no));
		return "project_list_finish(one)";
	}
	
	
	
	
	
	/* 프로젝트 수정 */
	/* 프로젝트 완료시 보기만 가능하게 처리 */
}
