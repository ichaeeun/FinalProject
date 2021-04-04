package pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Gantt;
import pms.dto.Member;
import pms.dto.Project;
import pms.dto.Task;
import pms.dto.pms_projectSch;
import pms.service.DashboardService;

@Controller
@RequestMapping("main.do")
public class DashBoardController {
	
	@Autowired(required = false)
	private DashboardService service;
	
	// http://localhost:7080/pms/main.do?method=loginform
	@RequestMapping(params="method=loginform")
	public String loginform(@ModelAttribute("member") Member member) {
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=login
	@RequestMapping(params="method=login")
	public String login(@ModelAttribute("member") Member member, Model d,HttpSession session) {
		if(service.IsMem(member) != null) {
			d.addAttribute("proc","true");
			session.setAttribute("mem", service.IsMem(member));
		} else {
			d.addAttribute("proc","false");
		}
		
		return "auth-login";
	}
	
	// http://localhost:7080/pms/main.do?method=main
	@RequestMapping(params="method=main")
	public String main(HttpSession session) {
		
		return "main";
	}

	
	// 추가 코드(장승태)(시작)
	// http://localhost:3030/pms/main.do?method=done_project
	@RequestMapping(params="method=done_project")
	public String pms_projectList(@ModelAttribute("sch") pms_projectSch sch, 
			Model d, HttpServletRequest request) {
		d.addAttribute("boardList", service.pms_projectList(sch));
		return "done_project";
	}
	// 추가 코드(장승태)(끝)

	// http://localhost:7080/pms/main.do?method=riskBoard
	@RequestMapping(params="method=riskBoard")
	public String riskform() {
		return"riskBoard";
	}
	// http://localhost:7080/pms/main.do?method=riskBoardCreate
	@RequestMapping(params="method=riskBoardCreate")
	public String riskformCreate() {
		return"riskBoardCreate";
	}
	// http://localhost:7080/pms/main.do?method=riskDetail
	@RequestMapping(params="method=riskDetail")
	public String riskdetail() {
		return"risk_detail";
	}
	// http://localhost:7080/pms/main.do?method=riskRequest
	@RequestMapping(params="method=riskRequest")
	public String riskrequest() {
		return"risk_request";
	}
	   // http://localhost:7080/pms/main.do?method=gantt
    @RequestMapping(params="method=gantt")
    public String gantt() {
       
       return "gantt";
    }
    
    // http://localhost:7080/pms/main.do?method=data
    @GetMapping(params="method=data")
    public String data(Project project,Model d) {
       project = new Project(1,"project01","내용ㅎㅎ","2021-04-04T15:00:00.000Z",
             "2021-04-06T15:00:00.000Z",1,"진행중");
       //INSERT INTO pms_project VALUES(1,'project01','내용ㅎㅎ','2021-04-04T15:00:00.000Z','2021-04-06T15:00:00.000Z',1,'진행중');
       // 파라미터로 받아온 프로젝트에 대한 정보
       d.addAttribute("project",project);
       // 파라미터로 받아온 프로젝트의 정보를 이용해 task 가져오기
       ArrayList<Task> task = new ArrayList<Task>();
       task = service.getTask(project);
       System.out.println("task: " + task.size());
       d.addAttribute("task", task);
       // 받아온 정보들 gantt json에 맞게 처리
       ArrayList<Gantt> gantt = new ArrayList<Gantt>();
       /*
       Gantt g = new Gantt();
       for(int i=0;i<task.size();i++) {
          g = null;
          g = service.getGantt(task.get(i));
          gantt.add(g);
       }
       */
       gantt = service.getGantt(task);
       d.addAttribute("gantt", gantt);
       
       return "pageJsonReport";
    }



}
