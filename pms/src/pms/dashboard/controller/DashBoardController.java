package pms.dashboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dashboard.dto.Login;
import pms.dashboard.service.DashboardService;

@Controller
@RequestMapping("main.do")
public class DashBoardController {
	
	@Autowired(required = false)
	private DashboardService service;
	
	// http://localhost:7080/pms/main.do?method=loginform
	@RequestMapping(params="method=loginform")
	public String loginform(@ModelAttribute("login") Login login) {
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=login
	@RequestMapping(params="method=login")
	public String login(@ModelAttribute("login") Login login, Model d,HttpSession session) {
		
		if(service.IsMem(login) != null) {
			d.addAttribute("proc","true");
			session.setAttribute("mem", service.IsMem(login));
		} else {
			d.addAttribute("proc","false");
		}
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=main
	@RequestMapping(params="method=main")
	public String main(HttpSession session) {
		// 각종 정보가 넘어가야됨, 대시보드에 보여줄
		// 로그인 정보가 없다면 로그인 창으로 이동
		String page = "";
		Login memInfo = (Login)session.getAttribute("mem");
		System.out.println(memInfo.getAuth());
		if(memInfo.getAuth().equals("ceo")) page = "default_ceo";
		else if(memInfo.getAuth().equals("hp")) page = "default_hp";
		else page = "default_pm,user";
		System.out.println("page: " + page);
		return page;
	}
	
	// http://localhost:7080/pms/main.do?method=calendar
	@RequestMapping(params="method=calendar")
	public String calendar() {
		return "apps-calendar";
	}
	
	// http://localhost:7080/pms/main.do?method=contacts_list
	@RequestMapping(params="method=contacts_list")
	public String contacts_list() {
		return "contacts-list";
	}
	
	// http://localhost:7080/pms/main.do?method=contacts_profile
	@RequestMapping(params="method=contacts_profile")
	public String contacts_profile() {
		return "contacts-profile";
	}
	
	// http://localhost:7080/pms/main.do?method=file_manager
	@RequestMapping(params="method=file_manager")
	public String file_manager() {
		return "apps-file-manager";
	}
	
	// http://localhost:7080/pms/main.do?method=apps_chat
	@RequestMapping(params="method=apps_chat")
	public String apps_chat() {
		return "apps-chat";
	}
}
