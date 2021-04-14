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
	public String gantt() {
		// 파라미터로 project_no 넘어옴, 세션으로 가지던지 해야함
		return "gantt";
	}
	
	// http://localhost:7080/pms/gantt.do?method=data
	@RequestMapping(params="method=data")
	public String data(pms_project project,Model d,String proc) {
		project = new pms_project(1,"project01","내용ㅎㅎ","2021-04-04T15:00:00.000Z","2021-04-06T15:00:00.000Z",1,"진행중");
		// 파라미터로 받아온 프로젝트에 대한 정보
		//d.addAttribute("project",project);
		// 파라미터로 받아온 프로젝트의 정보를 이용해 task 가져오기
				
		ArrayList<Task> task = new ArrayList<Task>();
		task = service.getTask(project);
		//d.addAttribute("task", task);
		// 받아온 정보들 gantt json에 맞게 처리
		ArrayList<Gantt> gantt = new ArrayList<Gantt>();
		gantt = service.getGantt(task);
		d.addAttribute("gantt",service.jsonadd(gantt,project));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=insert")
	public String insert(Gantt gantt) {
		
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
		
		return "pageJsonReport";
	}
	@RequestMapping(params="method=update")
	public String update(Gantt gantt) {
		
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
		
		Task task = service.update_gantttotask(gantt);
		System.out.println("taskno: " + task.getTask_no());
		service.updateTask(task);
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("id") int id) {
		System.out.println("pno: " + id);
		
		
		//Task task = service.switch_gantttotask(gantt);
		service.deleteTask(id);
		
		return "pageJsonReport";
	}
}
