package pms.dashboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dashboard.dto.Member;
import pms.dashboard.service.DashboardService;

@Controller
@RequestMapping("main.do")
public class DashBoardController {
	
	@Autowired(required = false)
	private DashboardService service;
	
	// http://localhost:7080/pms/main.do?method=loginform
	@RequestMapping(params="method=loginform")
	public String loginform(@ModelAttribute("member") Member member) {
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=login
	@RequestMapping(params="method=login")
	public String login(@ModelAttribute("member") Member member, Model d,HttpSession session) {
		if(service.IsMem(member) != null) {
			d.addAttribute("proc","true");
			session.setAttribute("mem", service.IsMem(member));
		} else {
			d.addAttribute("proc","false");
		}
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=main
	@RequestMapping(params="method=main")
	public String main(HttpSession session) {
		
		return "main";
	}
	// http://localhost:7080/pms/main.do?method=riskBoard
	@RequestMapping(params="method=riskBoard")
	public String riskform() {
		return"riskBoard";
	}
	// http://localhost:7080/pms/main.do?method=riskBoardCreate
	@RequestMapping(params="method=riskBoardCreate")
	public String riskformCreate() {
		return"riskBoardCreate";
	}

}
