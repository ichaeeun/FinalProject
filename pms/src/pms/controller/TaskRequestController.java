package pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Member;
import pms.dto.TaskRequest;
import pms.service.MypageService;
import pms.service.TaskRequestService;

@Controller
@RequestMapping("taskRequest.do")
public class TaskRequestController {
	@Autowired(required=false)
	private TaskRequestService service;
	@Autowired(required=false)
	private MypageService service2;
	// http://localhost:7080/pms/manpower.do?method=jsonContactList
	
	// http://localhost:7080/pms/taskRequest.do?method=listJson
	@RequestMapping(params="method=listJson")
	public String tlist(Model d) {
		d.addAttribute("tlist",service.tlist());
		return "pageJsonReport";
	}
	
	// http://localhost:7080/pms/taskRequest.do?method=requestlist
	@RequestMapping(params="method=requestlist")
	public String requestlist() {
		return "task_request";
	}
	
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		return service2.showProfile(m.getPno());
	}
}
