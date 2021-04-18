package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.CalendarService;
import pms.service.GanttService;

@Controller
@RequestMapping("cal.do")
public class CalendarController {
	
	@Autowired(required=false)
	private GanttService gservice;
	@Autowired(required = false)
	private CalendarService service;
	
	// http://localhost:7080/pms/cal.do?method=calendar
	@RequestMapping(params="method=list")
	public String calendar(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("project",gservice.getProject(no));
		return "calendar";
	}
	
	// http://localhost:7080/pms/cal.do?method=data
	@RequestMapping(params="method=data")
	public String list(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("calendar",service.calenList(no));
		System.out.println(service.calenList(no));
		return "pageJsonReport";
	}
	
}
