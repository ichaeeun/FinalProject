package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.TaskRequest;
import pms.service.TaskRequestService;

@Controller
@RequestMapping("taskRequest.do")
public class TaskRequestController {
	@Autowired(required=false)
	private TaskRequestService service;
	
	// http://localhost:7080/pms/taskRequest.do?method=listJson
	@RequestMapping(params="method=listJson")
	public String tlist(Model d) {
		d.addAttribute("tlist",service.tlist());
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/taskRequest.do?method=requestlist
	@RequestMapping(params="method=requestlist")
	public String requestlist() {
		return "task_request";
	}
}
