package pms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Member;
import pms.dto.pms_project;
import pms.service.ManPowerService;
import pms.service.TaskDetailService;

@Controller
@RequestMapping("mypage.do")
public class MypageController {
	@Autowired(required = false)
	private ManPowerService service;
	
	@Autowired(required=false)
	private TaskDetailService service2;
	// http://localhost:8080/pms/mypage.do?method=my
	@RequestMapping(params="method=my")
	public String mypage(@RequestParam("pno") int pno,Model d) {
		  ArrayList<pms_project> proList = new ArrayList<pms_project>(); 
		  for(int i=0;i<service.projectpno(pno).size();i++) {
			  proList.add(service.project(service.projectpno(pno).get(i).getProject_no()));
		  } 
		  d.addAttribute("proList",proList);
		  d.addAttribute("showprofile",service2.showProfile(pno));
		return "mypage";
	}
	// http://localhost:8080/pms/mypage.do?method=update 
	@RequestMapping(params="method=update")
	public String updateProfile(@RequestParam("pno") int pno, Member m,Model d) {
		System.out.println("#######"+m.getName());
		service2.updateProfile(m);
		d.addAttribute("success","Y");
		d.addAttribute("showprofile",service2.showProfile(pno));
		return "mypage";
	}
	
}
