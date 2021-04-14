package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("cal.do")
public class CalendarController {
	
	
	// http://localhost:7080/pms/cal.do?method=list
	@RequestMapping(params="method=list")
	public String gantt(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		return "calendar";
	}
}
