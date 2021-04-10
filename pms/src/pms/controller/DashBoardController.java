package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.service.DashboardService;

@Controller
@RequestMapping("dashboard.do")
public class DashBoardController {
	
	// http://localhost:7080/pms/dashboard.do?method=list
	@RequestMapping(params="method=list")
	public String gantt() {
		return "dashboard";
	}
	
}
