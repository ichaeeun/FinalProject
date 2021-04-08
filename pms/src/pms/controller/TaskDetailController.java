package pms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Comment;
import pms.dto.Task;
import pms.service.TaskDetailService;

@Controller
@RequestMapping("taskdetail.do")
public class TaskDetailController {
	@Autowired(required=false)
	private TaskDetailService service;
	
	// http://localhost:8080/pms/taskdetail.do?method=list
	@GetMapping(params="method=list")
	public String list(@RequestParam("task_no") int task_no, Model d) {
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList());
		return "task_detail";
	}
	// http://localhost:8080/pms/taskdetail.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertSubtask(Task t,Model d) {
		System.out.println(t.getTask_name());
		service.insertSubtask(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=update")
	public String updateTask(Task t,Model d) {
		service.updateTask(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	// taskdetail.do?method=updateSub
	@RequestMapping(params="method=updateSub")
	public String updateSub(Task t,Model d) {
		service.updateSub(t);
		d.addAttribute("success","Y");
		return "forward:/taskdetail.do?method=list";
	}
	
	@RequestMapping(params="method=insertComment")
	public String insertComment(Comment com,Model d) {
		service.insertComment(com);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@ModelAttribute("showMember")
	public ArrayList<Task> showMember(@RequestParam("task_no") int task_no){
		return service.showMember(task_no);
	}
	
}
