package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Member;
import pms.service.LoginService;
import pms.service.ManPowerService;

@Controller
@RequestMapping("main.do")
public class LoginController {

	@Autowired(required = false)
	private LoginService service;
	@Autowired(required = false)
	private ManPowerService mservice;
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
		
		// 로그아웃 처리
		// http://localhost:7080/pms/main.do?method=logout
		@RequestMapping(params="method=logout")
		public String logout(HttpServletRequest request,Model d,@ModelAttribute("member") Member member){
			HttpSession session = request.getSession();
			//session.setAttribute("mem", null);
			request.getSession().invalidate();
			d.addAttribute("proc","logout");
			return "auth-login";
		}
		
		// http://localhost:7080/pms/main.do?method=main
		@RequestMapping(params="method=main")
		public String main(HttpSession session, @ModelAttribute("sch") Member sch, Model d) {
			// 전체 인원
			if (sch.getName() == null) sch.setName("");
			// 부서 목록
			d.addAttribute("partList", mservice.deptList());
			// 권한 목록
			d.addAttribute("authList", mservice.authList());		
			d.addAttribute("memList1", mservice.memList1(sch.getName()));
			d.addAttribute("member", new Member());
			return "main";
		}
}
