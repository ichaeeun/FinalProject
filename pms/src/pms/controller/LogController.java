package pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import pms.dto.Log;
import pms.dto.Member;
import pms.service.LogService;
import pms.service.MypageService;

@Controller
public class LogController {
	@Autowired(required = false)
	private LogService service;
	@Autowired(required=false)
	private MypageService service2;
	public void taskIns(Log ins) { 
		service.taskIns(ins);
	};
	
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		int pno=0;
		if(m!=null) pno = m.getPno();
		return service2.showProfile(pno);
	}
}
