package pms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Member;
import pms.dto.pms_project;
import pms.service.DashboardService;
import pms.service.MypageService;
import pms.service.ProjectService;
import pms.service.TaskDetailService;

@Controller
@RequestMapping("dashboard.do")
public class DashBoardController {
	@Autowired(required=false)
	private DashboardService service;
	@Autowired(required=false)
	private ProjectService pservice;
	@Autowired(required=false)
	private TaskDetailService service2; // 프로젝트명 불러오려고 추가했습니다
	@Autowired(required=false)
	private MypageService dservice;
	
	// http://localhost:7080/pms/dashboard.do?method=list
	@RequestMapping(params="method=list")
	public String gantt(@RequestParam("no") int no, Model d,HttpSession session) {
		d.addAttribute("no", no);
		
		pms_project project = pservice.getProject(no);

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		try {
			Date start = df.parse(project.getStart1());	// 시작일
			Date end = df.parse(project.getEnd1());		// 완료일
			Date today = new Date();					// 현재날짜
			// 진행도
			long startday = Math.abs( start.getTime() / (24*60*60*1000) );	// 시작일수(숫자값)
			long endday = Math.abs( end.getTime() / (24*60*60*1000) );		// 종료일수(숫자값)
			long todayday = Math.abs( today.getTime() / (24*60*60*1000) );	// 현재일수(숫자값)
			long allday = endday - startday;			// 분모: 프로젝트기간. 프기.
			long doday = 0;
			if(todayday>startday && todayday<endday) {	// 시작일-오늘-종료일 일때
				doday = todayday - startday;		// 진행기간. 진기
			}
			if(todayday<startday && todayday<endday) {	// 오늘-시작일-종료일 일때
				doday = 0;							// 진행기간. 진기
			}
			if(todayday>startday && todayday>endday) {	// 시작일-종료일-오늘 일때
				doday = allday;						// 진행기간. 진기
			}
			
			
			if(project.getProject_status().equals("완료")) { // 프로젝트상태가 완료이면
				doday = allday;				// 진행기간 = 프로젝트기간
				project.setAllday(allday);	
				project.setDoday(doday);	
			}else {
				project.setAllday(allday);	// 프로젝트기간
				project.setDoday(doday);	// 진행기간
			}	
				
			
			
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		d.addAttribute("project",project); // 프로젝트명 불러오려고 추가했습니다 // 프로젝트정보
		
		
		d.addAttribute("task",service.getTaskNum(no));
		d.addAttribute("risk",service.getRiskNum(no));
		d.addAttribute("member",service.getMemcnt(no));
		return "dashboard";
	}
	
	@ModelAttribute("showprofile")  // 멤버 프로필 사진 공통 어트리뷰트  
	public Member showMember(HttpSession session){
		Member m = (Member)session.getAttribute("mem");
		int pno=0;
		if(m!=null) pno = m.getPno();
		return dservice.showProfile(pno);
	}
	
}
