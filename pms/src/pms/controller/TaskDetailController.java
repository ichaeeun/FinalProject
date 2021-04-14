package pms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pms.dto.Comment;
import pms.dto.Task;
import pms.dto.TaskFile;
import pms.service.TaskDetailService;

@Controller
@RequestMapping("taskdetail.do")
public class TaskDetailController {
	@Autowired(required=false)
	private TaskDetailService service;
	
	// http://localhost:8080/pms/taskdetail.do?method=list
	@GetMapping(params="method=list") // 태스크 디테일 화면 출력 
	public String list(@RequestParam("task_no") int task_no, Model d) {
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList(task_no));
		return "task_detail";
	}
	
	// http://localhost:8080/pms/taskdetail.do?method=sub
	@GetMapping(params="method=sub") // 서브 태스크 리스트 출력 
	public String subtask(@RequestParam("task_no") int task_no, Model d) {
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList(task_no));
		return "subtaskList";
	}
	
	// http://localhost:8080/pms/taskdetail.do?method=commentList
	@GetMapping(params="method=commentList") //커멘트 리스트 출력 
	public String commentList(@RequestParam("task_no") int task_no, Model d) {
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList(task_no));
		return "commentList";
	}
	// http://localhost:8080/pms/taskdetail.do?method=insert
	@RequestMapping(params="method=insert")  // 서브태스크 추가 
	public String insertSubtask(Task t,Model d) {
		System.out.println(t.getTask_name());
		service.insertSubtask(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=update")  // 태스크 수정 
	public String updateTask(Task t,Model d) {
		service.updateTask(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	
	// taskdetail.do?method=updateSub
	@RequestMapping(params="method=updateSub")  // 서브태스크 수정 
	public String updateSub(Task t,Model d) {
		service.updateSub(t);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=deleteSub")  // 서브태스크 삭제 
	public String deleteSub(@RequestParam("task_no") int task_no, Model d) {
		service.deleteSub(task_no);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=deleteTask")  //태스크 삭제 
	public String deleteTask(@RequestParam("task_no")int task_no, Model d) {
		service.deleteTask(task_no);
		d.addAttribute("del","Y");
		return "pageJsonReport";
	}; // 태스크 삭제 
	
	@RequestMapping(params="method=insertComment")  // 커멘트 추가 
	public String insertComment(Comment com,Model d) {
		service.insertComment(com);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=deletecomm")  //커맨트 삭제 
	public String deletecomm(@RequestParam("comment_no") int comment_no,Model d) {
		System.out.println("##:"+comment_no);
		service.deletecomm(comment_no);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=requestApp")  // 승인 요청 
	public String requestApp(@RequestParam("task_no")int task_no, Model d) {
		service.requestApp(task_no);
		d.addAttribute("request","Y");
		return "pageJsonReport";
	}
	
	// http://localhost:8080/pms/taskdetail.do?method=approval
	@RequestMapping(params="method=approval")  // 승인 
	public String approval(@RequestParam("task_no")int task_no,Task t, Model d) {
		service.approval(task_no);
		d.addAttribute("approval","Y");
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList(task_no));
		return "task_detail";
	}
	// http://localhost:8080/pms/taskdetail.do?method=statusToDone
	@RequestMapping(params="method=statusToDone") // 완료로 상태 변경 
	public String statusToDone(@RequestParam("task_no") int task_no, Model d) { 
		service.statusToDone(task_no);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}; 
	@RequestMapping(params="method=statusFromDone")// 진행으로 상태 변경 
	public String statusFromDone(@RequestParam("task_no") int task_no, Model d) { 
		service.statusFromDone(task_no);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}; 
	
	@RequestMapping(params="method=insertTaskFile") // 파일 업로드 
	@ResponseBody
	public String insertTaskFile(@RequestParam("task_no") int task_no, TaskFile tf, Model d) {
		service.insertTaskFile(tf);
//		d.addAttribute("detail",service.taskDetail(task_no));
//		d.addAttribute("subdetail",service.subtaskList(task_no));
//		d.addAttribute("taskcurrval",service.taskcurrval());
//		d.addAttribute("comment",service.commentList(task_no));
		d.addAttribute("success","Y");
		System.out.println("파일업로드"); // {"success":"Y"}
		return "{\"success\":\"Y\"}";
	}
	@RequestMapping(params="method=taskFileList")
	public String taskFileList(@RequestParam("task_no") int task_no, Model d) {
		service.taskFileList(task_no);
		d.addAttribute("detail",service.taskDetail(task_no));
		d.addAttribute("subdetail",service.subtaskList(task_no));
		d.addAttribute("taskcurrval",service.taskcurrval());
		d.addAttribute("comment",service.commentList(task_no));
		return "task_fileList";
	}
	
	// http://localhost:8080/pms/taskdetail.do?method=download&filename=파일명 
	@RequestMapping(params="method=download")
	public String download(@RequestParam("filename") String filename, Model d) {
		System.out.println("파일명: "+filename);
		d.addAttribute("downloadFile",filename); 
		// viewer 안에 선언한 모델명 
		// 컨테이너 안에 선언되어 있는 viewer명 
		return "downloadviewer";
	}
	
	@ModelAttribute("showMember")  //프로젝트 별 인원 공통 어트리뷰트 
	public ArrayList<Task> showMember(@RequestParam("task_no") int task_no){
		return service.showMember(task_no);
	}
	
	
	
}
