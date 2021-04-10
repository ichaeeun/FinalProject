package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cal.do")
public class CalendarController {
	
	
	// http://localhost:7080/pms/cal.do?method=list
	@RequestMapping(params="method=list")
	public String gantt() {
		return "calendar";
	}
}
