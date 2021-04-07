package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Log;
import pms.dto.Task;
import pms.service.OverviewService;

@Controller
@RequestMapping("/task.do")
public class OverviewController {
	@Autowired(required = false)
	private OverviewService service;
	
	//  http://localhost:7080/pms/task.do?method=list
	@RequestMapping(params="method=list")
	public String taskList(Task task, Model d) {
		d.addAttribute("TaskList", service.TaskList(task));
		d.addAttribute("TaskList2", service.TaskList2(task));
		System.out.println(task.getPno());
		return "task_list";
	}
//  http://localhost:7080/pms/task.do?method=view
	@RequestMapping(params="method=view")
	public String overview() {
		return "overview";
	}

//  http://localhost:7080/pms/task.do?method=log
	@RequestMapping(params="method=log")
	public String taskLog(Log log, Model d) {
		d.addAttribute("LogList",service.LogList(log));
		return "log";
	}
}
