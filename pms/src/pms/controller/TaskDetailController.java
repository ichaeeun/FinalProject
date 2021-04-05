package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.TaskDetailService;

@Controller
@RequestMapping("taskdetail.do")
public class TaskDetailController {
	@Autowired(required=false)
	private TaskDetailService service;
	
	// http://localhost:8080/pms/taskdetail.do?method=list
	@GetMapping(params="method=list")
	public String list(@RequestParam("task_no") int task_no, Model d) {
		d.addAttribute("detail",service.taskDetail(task_no));
		return "task_detail";
	}
	
}
