package pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Log;
import pms.dto.Member;
import pms.dto.Task;
import pms.service.GanttService;
import pms.service.OverviewService;

@Controller
@RequestMapping("/task.do")
public class OverviewController {
	@Autowired(required = false)
	private OverviewService service;
	@Autowired(required = false)
	private GanttService gservice;
	

//  http://localhost:7080/pms/task.do?method=list&no=1
	@RequestMapping(params="method=list")
	public String taskList(@RequestParam("no") int no,Task task, Model d) {
		d.addAttribute("TaskList", service.TaskList(no));
		d.addAttribute("TaskList2", service.TaskList2(no));
		d.addAttribute("doneTaskList", service.doneTaskList(no));
		d.addAttribute("project",gservice.getProject(no));
		
		System.out.println(task.getPno());
		return "task_list";
	}
	
//  http://localhost:7080/pms/task.do?method=dlist
	@RequestMapping(params="method=dlist")
	public String deTaskList(@RequestParam("pno") int pno, @RequestParam(value="pno",required = false) int no, Task task, Model d) {
		
		/* Member m = (Member)session.getAttribute("mem"); 
		 * System.out.println(m.getPno());*/

		d.addAttribute("TaskListAll", service.TaskListAll(pno));
		d.addAttribute("TaskListAll2", service.TaskListAll2(pno));
		d.addAttribute("project",gservice.getProject(no));
		System.out.println(task.getPno());
			
		return "task_list_all";
	}	
	
	
//  http://localhost:7080/pms/task.do?method=view
	@RequestMapping(params="method=view")
	public String overview(@RequestParam("no") int no, Model d) {
		d.addAttribute("ViewMem", service.ViewMem(no));
		d.addAttribute("project",gservice.getProject(no));
		return "overview";
	}

//  http://localhost:7080/pms/task.do?method=log
	@RequestMapping(params="method=log")
	public String taskLog(@RequestParam("no") int no,Log log, Model d) {
		d.addAttribute("LogList",service.LogList(no));
		d.addAttribute("project",gservice.getProject(no));
		return "log";
	}
	
	// http://localhost:7080/pms/task.do?method=insert
	@RequestMapping(params="method=insert")  // 메인태스크 추가
	public String mTaskInsert(@RequestParam("no") int no, Task t, Model d) {
		System.out.println(t.getTask_name());
		service.mTaskInsert(t);
		d.addAttribute("success","Y");		
		return "pageJsonReport";
	}
	
	// 태스크 추가에 select옵션 project에 할당된 인원이 나온다.
	@ModelAttribute("taskMember")
	public ArrayList<Member> taskMember(@RequestParam int no){
		return service.taskMember(no);
	}
}
