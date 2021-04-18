package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.TaskDetailService;

@Controller
@RequestMapping("dashboard.do")
public class DashBoardController {
	@Autowired(required=false)
	private TaskDetailService service2; // 프로젝트명 불러오려고 추가했습니다
	
	// http://localhost:7080/pms/dashboard.do?method=list
	@RequestMapping(params="method=list")
	public String gantt(@RequestParam("no") int no,Model d) {
		d.addAttribute("project",service2.getProject_name(no)); // 프로젝트명 불러오려고 추가했습니다
		return "dashboard";
	}
	
}
