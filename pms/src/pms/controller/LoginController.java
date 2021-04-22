package pms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Member;
import pms.dto.MemberSch;
import pms.dto.pms_project;
import pms.service.DashboardService;
import pms.service.LoginService;
import pms.service.ManPowerService;
import pms.service.MypageService;
import pms.service.OverviewService;
import pms.service.ProjectService;

@Controller
@RequestMapping("main.do")
public class LoginController {

	@Autowired(required = false)
	private LoginService service;
	@Autowired(required = false)
	private ManPowerService mservice;
	@Autowired(required = false)
	private OverviewService oservice;
	@Autowired(required=false)
	private DashboardService dservice;
	@Autowired(required=false)
	private ProjectService proservice;
	@Autowired(required=false)
	private MypageService pservice;
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
		
		// 로그아웃 처리
		// http://localhost:7080/pms/main.do?method=logout
		@RequestMapping(params="method=logout")
		public String logout(HttpServletRequest request,Model d,@ModelAttribute("member") Member member){
			HttpSession session = request.getSession();
			//session.setAttribute("mem", null);
			request.getSession().invalidate();
			d.addAttribute("proc","logout");
			return "auth-login";
		}
		
		// http://localhost:7080/pms/main.do?method=main
		@RequestMapping(params="method=main")
		public String main(HttpSession session, @ModelAttribute("sch") MemberSch sch, Model d) {
			// 세션 값
			Member m = (Member)session.getAttribute("mem");
			System.out.println(m.getAuth());
			String page = "";
			if( m.getAuth().equals("pm")) {	
				if(service.IsPm(m.getPno())!=null) {
					m.setProject_no(service.IsPm(m.getPno()).getProject_no());
				}
				
				System.out.println(m.getProject_no()); // 멤버의 프로젝트 번호()로 프로젝트의 정보 가져오기
				d.addAttribute("task",dservice.getTaskNum( m.getProject_no() ));
				d.addAttribute("risk",dservice.getRiskNum( m.getProject_no() ));
				d.addAttribute("membercnt",dservice.getMembercnt( m.getProject_no() ));
				
				
				
				pms_project project = proservice.getProject( m.getProject_no() ); // 프로젝트 번호로 프로젝트 정보 가져오기
				
				// 시작일과 종료일, 현재일, 전체일, 진행도=(현재일-시작일)/전체일 이고 현재일이 종료일보다 크면 현재일은 종료일로 고정
			

				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				try {
					Date start = df.parse(project.getStart1());	// 시작일
					Date end = df.parse(project.getEnd1());		// 완료일
					Date today = new Date();					// 현재날짜

					long startday = Math.abs( start.getTime() / (24*60*60*1000) ); // 시작일수(숫자값)
					long endday = Math.abs( end.getTime() / (24*60*60*1000) ); // 종료일수(숫자값)
					long todayday = Math.abs( today.getTime() / (24*60*60*1000) ); // 현재일수(숫자값)
					long allday = endday - startday;			// 분모:프로젝트총숫자
					// 진행숫자(현재-시작= 진행수)
					long doday = todayday - startday;			// 분자:프로젝트진행일
					if(todayday>endday) {	// 만약 오늘날짜가 종료일보다 크다면
						doday = endday - startday;
					}
					
					// 프로젝트 dto에 나타낼 값 set으로 설정(총기간, 진행일)
					project.setAllday(allday);
					project.setDoday(doday);
					
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				d.addAttribute("project", project); 
				
				page = "dashboard_pm";
			}else if(m.getAuth().equals("wk")) {
				
				d.addAttribute("TaskListAll", oservice.TaskListAll(m.getPno()));
				d.addAttribute("TaskListAll2", oservice.TaskListAll2(m.getPno()));
				d.addAttribute("doneMyList",oservice.doneMyList(m.getPno()));
				
				System.out.println("개발자정보");
				System.out.println(m.getPno());
				System.out.println(m.getName());
				System.out.println("######"+oservice.TaskListAll(m.getPno()));
				page = "task_list_all";
			}
			else if(m.getAuth().equals("ceo")) {
			
				d.addAttribute("allproject", dservice.getAllProject());
				//d.addAttribute("doingproject", dservice.getDoingProject());	
				
				// 진행중인 프로젝트 리스트 받기
				ArrayList<pms_project> doingproject = dservice.DoingProject();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				long totallday = 0;
				long totdoingday = 0;
				for(int i=0; i<doingproject.size(); i++) {	// 배열크기만큼 반복
					
					try {
						Date start = df.parse(doingproject.get(i).getStart1());
						Date end = df.parse(doingproject.get(i).getEnd1());
						Date today = new Date();
						// 진행도
						long startday = Math.abs( start.getTime() / (24*60*60*1000) ); // 시작일수(숫자값)
						long endday = Math.abs( end.getTime() / (24*60*60*1000) ); // 종료일수(숫자값)
						long todayday = Math.abs( today.getTime() / (24*60*60*1000) ); // 현재일수(숫자값)
						long allday = endday - startday;			// 분모:프로젝트총숫자
						// 진행숫자(현재-시작= 진행수)
						long doday = todayday - startday;			// 분자:프로젝트진행일
						if(todayday>endday) {	// 만약 오늘날짜가 종료일보다 크다면
							doday = endday - startday;
						}
						doingproject.get(i).setAllday(allday);
						doingproject.get(i).setDoday(doday);
						totallday += allday;
						totdoingday += doday;
						
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				}
				// 프로젝트 전체일과 진행일 모델에 int값으로 넘기기
				d.addAttribute("totallday", totallday);	
				d.addAttribute("totdoingday", totdoingday);
				
				// 모델에 int값으로 설정
				d.addAttribute("doingproject", dservice.getDoingProject());
				d.addAttribute("alltask", dservice.getAllTask());
				d.addAttribute("doingtask", dservice.getDoingTask());
				d.addAttribute("allrisk", dservice.getAllRisk());
				d.addAttribute("doingrisk", dservice.getDoingRisk());
				d.addAttribute("allmember", dservice.getAllmember());
				
				page = "dashboard_ceo";
			}
			else if(m.getAuth().equals("hp")) {page = "contacts-list";}
			// 전체 인원
			if (sch.getName() == null) sch.setName("");
			// 부서 목록
			d.addAttribute("partList", mservice.deptList());
			// 권한 목록
			d.addAttribute("authList", mservice.authList());		
			d.addAttribute("memList", mservice.showMem(sch));
			// d.addAttribute("memList1", mservice.memList1(sch.getName())); 
			d.addAttribute("member", new Member());		
			d.addAttribute("showprofile",pservice.showProfile(m.getPno()));
			return page;		
		}
}
