package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dashboard.do")
public class DashBoardController {
	
	// http://localhost:7080/pms/dashboard.do?method=list
	@RequestMapping(params="method=list")
	public String gantt() {
		return "dashboard";
	}
	
}
