package pms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Gantt;
import pms.dto.Project;
import pms.dto.Task;
import pms.dto.pms_project;
import pms.service.GanttService;

@Controller
@RequestMapping("gantt.do")
public class GanttController {
	@Autowired(required = false)
	private GanttService service;
    
	// http://localhost:7080/pms/gantt.do?method=gantt
	@RequestMapping(params="method=gantt")
	public String gantt(@RequestParam("no") int no, Model d) {
		d.addAttribute("no",no);
		d.addAttribute("project",service.getProject(no));
		return "gantt";
	}
	
	// http://localhost:7080/pms/gantt.do?method=data
	@RequestMapping(params="method=data")
	public String data(@RequestParam("no") int no,Model d) {
		d.addAttribute("no",no);
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}	
	
	@RequestMapping(params="method=insert")
	public String insert(@RequestParam("no") int no,Gantt gantt,Model d) {
		d.addAttribute("success","Y");
		System.out.println("####insert####");
		System.out.println("pno: " + gantt.getId());
		System.out.println("start: " + gantt.getStart_date());
		System.out.println("end: " + gantt.getEnd_date());
		//System.out.println("duration: " + gantt.getDuration());
		System.out.println("parent: " + gantt.getParent());
		System.out.println("content: " + gantt.getText());
		System.out.println("Priority: " + gantt.getPriority());
		System.out.println("progress: " + gantt.getProgress());
		System.out.println("sortorder: " + gantt.getSortorder());
		System.out.println("holder: " + gantt.getHolder());
		
		Task task = service.insert_gantttotask(gantt);
		service.insertTask(task);
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("gantt",service.list(no));
		return "pageJsonReport";
	}
	@RequestMapping(params="method=update")
	public String update(@RequestParam("no") int no,Gantt gantt,Model d) {
		System.out.println("####update####");
		System.out.println("pno: " + gantt.getId());
		System.out.println("start: " + gantt.getStart_date());
		System.out.println("end: " + gantt.getEnd_date());
		//System.out.println("duration: " + gantt.getDuration());
		System.out.println("parent: " + gantt.getParent());
		System.out.println("content: " + gantt.getText());
		System.out.println("Priority: " + gantt.getPriority());
		System.out.println("progress: " + gantt.getProgress());
		System.out.println("sortorder: " + gantt.getSortorder());
		System.out.println("holder: " + gantt.getHolder());
		
		if(gantt.getParent() == 0) {
			service.uptProject(gantt,no);
		}
		else {
			Task task = service.update_gantttotask(gantt);
			System.out.println("taskno: " + task.getTask_no());
			service.updateTask(task);
		}
		
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("no") int no,@RequestParam("id") int id,Model d) {
		System.out.println("####delete####");
		System.out.println("task_no: " + id);
		
		service.deleteTask(id);
		d.addAttribute("no",no);
		d.addAttribute("success","Y");
		d.addAttribute("project",service.getProject(no));
		d.addAttribute("gantt",service.list(no));
		
		return "pageJsonReport";
	}
}
