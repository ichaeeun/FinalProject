package pms.dashboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dashboard.dto.Login;
import pms.dashboard.service.DashboardService;

@Controller
@RequestMapping("main.do")
public class DashBoardController {
	
	@Autowired(required = false)
	private DashboardService service;
	
	// http://localhost:7080/pms/main.do?method=loginform
	@GetMapping(params="method=loginform")
	public String loginform(@ModelAttribute("login") Login login) {
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=login
	@PostMapping(params="method=login")
	public String login(@ModelAttribute("login") Login login, Model d,HttpSession session) {
		
		if(service.IsMem(login) != null) {
			d.addAttribute("proc","true");
			session.setAttribute("mem", service.IsMem(login));
		} else {
			d.addAttribute("proc","false");
		}
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=login
	@GetMapping(params="method=main")
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
}
