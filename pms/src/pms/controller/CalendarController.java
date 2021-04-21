package pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.net.aso.g;
import pms.dto.Calendar;
import pms.dto.Member;
import pms.service.CalendarService;
import pms.service.GanttService;
import pms.service.MypageService;

@Controller
@RequestMapping("cal.do")
public class CalendarController {
	
	@Autowired(required=false)
	private GanttService gservice;
	@Autowired(required = false)
	private CalendarService service;
	@Autowired(required=false)
	private MypageService service2;
	// http://localhost:7080/pms/cal.do?method=calendar
	@RequestMapping(params="method=list")
	public String calendar(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("parent",service.getTitles(no));
		d.addAttribute("holder",gservice.getProjectAdd(no));
		d.addAttribute("project",gservice.getProject(no));
		d.addAttribute("calendar",service.calenList(no));
		
		return "calendar";
	}
	
	// http://localhost:7080/pms/cal.do?method=data
	@RequestMapping(params="method=data")
	public String list(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("parent",service.getTitles(no));
		d.addAttribute("holder",gservice.getProjectAdd(no));
		d.addAttribute("project",gservice.getProject(no));
		d.addAttribute("calendar",service.calenList(no));
		
		return "pageJsonReport";
	}
	// http://localhost:7080/pms/cal.do?method=insert
	@RequestMapping(params="method=insert")
	public String insert(@RequestParam("no") int no,Calendar cal,Model d) {
		
		service.insertTask(cal,no);
		
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("parent",service.getTitles(no));
		d.addAttribute("holder",gservice.getProjectAdd(no));
		d.addAttribute("project",gservice.getProject(no));
		d.addAttribute("calendar",service.calenList(no));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=update")
	public String update(@RequestParam("no") int no,Calendar cal, Model d) {
		// update service
		// parent == "0" or groupId == 0 이면 프로젝트
		if(cal.getParent().equals("0")) {
			service.updateProject(cal,no);
		} else
			service.updateTask(cal, no);
		
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("parent",service.getTitles(no));
		d.addAttribute("holder",gservice.getProjectAdd(no));
		d.addAttribute("project",gservice.getProject(no));
		d.addAttribute("calendar",service.calenList(no));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("no") int no,@RequestParam("id") int id, Model d) {
		
		gservice.deleteTask(id);
		
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("parent",service.getTitles(no));
		d.addAttribute("holder",gservice.getProjectAdd(no));
		d.addAttribute("project",gservice.getProject(no));
		d.addAttribute("calendar",service.calenList(no));
		
		return "pageJsonReport";
	}
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		return service2.showProfile(m.getPno());
	}
}
