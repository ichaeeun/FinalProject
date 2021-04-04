package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/task.do")
public class taskController {
	//  http://localhost:7080/pms/task.do?method=list
	@RequestMapping(params="method=list")
	public String taskList() {
		return "task_list";
	}
//  http://localhost:7080/pms/task.do?method=view
	@RequestMapping(params="method=view")
	public String overview() {
		return "overview";
	}
//  http://localhost:7080/pms/task.do?method=detail
	@RequestMapping(params="method=detail")
	public String taskDetail() {
		return "task_detail";
	}
//  http://localhost:7080/pms/task.do?method=log
	@RequestMapping(params="method=log")
	public String taskLog() {
		return "log";
	}
}
