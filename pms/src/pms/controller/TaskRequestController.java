package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("taskRequest.do")
public class TaskRequestController {
	// http://localhost:7080/pms/taskRequest.do?method=task_request
	@GetMapping(params="method=task_request")
		public String task_request() {
			return "task_request";
	}
}
