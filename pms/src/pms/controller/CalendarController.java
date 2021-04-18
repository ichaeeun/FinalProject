package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.GanttService;
import pms.service.TaskDetailService;

@Controller
@RequestMapping("cal.do")
public class CalendarController {
	
	@Autowired(required=false)
	private GanttService gservice;
	
	// http://localhost:7080/pms/cal.do?method=list
	@RequestMapping(params="method=list")
	public String gantt(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("project",gservice.getProject(no));
		return "calendar";
	}
}
