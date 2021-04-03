package pms.dashboard.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dashboard.dto.Member;
import pms.dashboard.dto.pms_projectSch;
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

	
	// 추가 코드(장승태)(시작)
	// http://localhost:3030/pms/main.do?method=done_project
	@RequestMapping(params="method=done_project")
	public String pms_projectList(@ModelAttribute("sch") pms_projectSch sch, 
			Model d, HttpServletRequest request) {
		
		
		d.addAttribute("boardList", service.pms_projectList(sch));
		return "done_project";
	}
	// 추가 코드(장승태)(끝)

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
	// http://localhost:7080/pms/main.do?method=riskDetail
	@RequestMapping(params="method=riskDetail")
	public String riskdetail() {
		return"risk_detail";
	}
	// http://localhost:7080/pms/main.do?method=riskRequest
	@RequestMapping(params="method=riskRequest")
	public String riskrequest() {
		return"risk_request";
	}
	


}
