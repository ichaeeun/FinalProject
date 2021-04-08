package pms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.pms_projectSch;
import pms.service.ProjectService;

@Controller
@RequestMapping("project.do")
public class ProjectController {
	@Autowired(required = false)
	ProjectService service;
	// http://localhost:7080/pms/project.do?method=project_list
	@RequestMapping(params="method=project_list")
	public String pms_projectList(@ModelAttribute("sch") pms_projectSch sch, 
			Model d, HttpServletRequest request) {
		d.addAttribute("boardList", service.pms_projectList(sch));
		return "project_list";
	}
	// 프로젝트 상세 화면
	// http://localhost:7080/pms/project.do?method=project_detail
	@RequestMapping(params="method=project_detail")
	public String project_detail(@RequestParam("no") int no, Model d) {
		d.addAttribute("pms_project", service.getProject(no));
		return "project_detail";
	}
	
	
}
