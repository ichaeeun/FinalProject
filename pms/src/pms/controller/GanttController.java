package pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Gantt;
import pms.dto.Member;
import pms.dto.Project;
import pms.dto.Task;
import pms.dto.pms_project;
import pms.service.GanttService;
import pms.service.MypageService;

@Controller
@RequestMapping("gantt.do")
public class GanttController {
	@Autowired(required = false)
	private GanttService service;
	@Autowired(required=false)
	private MypageService service2;
    
	// http://localhost:7080/pms/gantt.do?method=gantt
	@RequestMapping(params="method=gantt")
	public String gantt(@RequestParam("no") int no, Model d) {
		d.addAttribute("no",no);
		d.addAttribute("names",service.getProjectAdd(no));
		d.addAttribute("project",service.getProject(no));
		return "gantt";
	}
	
	// http://localhost:7080/pms/gantt.do?method=data
	@RequestMapping(params="method=data")
	public String data(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("names",service.getProjectAdd(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}	
	
	@RequestMapping(params="method=insert")
	public String insert(@RequestParam("no") int no,Gantt gantt,Model d) {
		Task task = service.insert_gantttotask(gantt,no);
		service.insertTask(task);
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("names",service.getProjectAdd(no));
		d.addAttribute("gantt",service.list(no));
		return "pageJsonReport";
	}
	@RequestMapping(params="method=update")
	public String update(@RequestParam("no") int no,Gantt gantt,Model d) {
		
		if(gantt.getParent() == 0) {
			service.uptProject(gantt,no);
		}
		else {
			Task task = service.update_gantttotask(gantt,no);
			System.out.println("taskno: " + task.getTask_no());
			service.updateTask(task);
		}
		
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("names",service.getProjectAdd(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("no") int no,@RequestParam("id") int id,Model d) {
		
		service.deleteTask(id);
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("names",service.getProjectAdd(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		int pno=0;
		if(m!=null) pno = m.getPno();
		return service2.showProfile(pno);
	}
}
