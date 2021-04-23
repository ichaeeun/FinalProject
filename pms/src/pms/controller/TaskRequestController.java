package pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String tlist(Model d,
			@RequestParam("pno") int pno,
			@RequestParam("auth") String auth,
			Member member) {
		d.addAttribute("pno",pno);
		d.addAttribute("auth",auth);
		if(auth.equals("pm")) 
			d.addAttribute("tlist",service.tlistP(member));
		if(auth.equals("wk")) 
			d.addAttribute("tlist",service.tlistW(member));	
		System.out.println("####no:"+pno);
		System.out.println("####auth:"+auth);
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
		int pno=0;
		if(m!=null) pno = m.getPno();
		return service2.showProfile(pno);
	}
}
