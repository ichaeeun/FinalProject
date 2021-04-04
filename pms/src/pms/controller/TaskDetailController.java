package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("taskdetail.do")
public class TaskDetailController {
	// http://localhost:8080/pms/taskdetail.do?method=list
	@GetMapping(params="method=list")
	public String list() {
		return "task_detail";
	}
	
	// http://localhost:8080/pms/taskdetail.do?method=test
		@GetMapping(params="method=test")
		public String test() {
			return "tabletest";
		}
}
