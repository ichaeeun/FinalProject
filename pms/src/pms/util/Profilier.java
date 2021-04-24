package pms.util;


import java.util.ArrayList;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import pms.controller.LogController;
import pms.dao.OverviewDao;
import pms.dao.TaskDetailDao;
import pms.dto.Log;
import pms.dto.Task;
import pms.dto.Member;
import pms.dto.TaskRequest;
import pms.service.LogService;
import pms.service.OverviewService;


//springweb.z04_util.Profilier
// 수행할 내용 처리 advice 클래스
public class Profilier {
	@Autowired(required = false)
	private LogService service;
	@Autowired(required = false)
	private TaskDetailDao tdao;

	// 특정한 시점에서 해당 프로그램 내용이 진행되게 처리
	public Object trace(ProceedingJoinPoint joinPoint) {
	
		Object result=null;
		// 해당 객체의 특정 메서드의 수행 시간 check
		// 1. 시작 시간
		String sign = joinPoint.getSignature().toShortString();
		System.out.println(sign+"의 시작!!!");
		long start = System.currentTimeMillis();
		// 2. 수행 처리..
		try {
			result = joinPoint.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("수행 처리 에러:"+e.getMessage());
		}finally {
			// 3. 처리 완료 시간
			long finish = System.currentTimeMillis();
			String className = joinPoint.getClass().getName();// 대상객체의 이름 
			String methodName = joinPoint.getSignature().getName(); // 메서드명
			Object[] args = joinPoint.getArgs(); // 매개변수
			if(methodName=="mTaskInsert") {
				for(Object ob:args) {
					
					Task tk = (Task)ob;
					int maxTask_no = (int)tdao.getMaxTask_no();
					//System.out.println("★★★★"+tk.getTask_no()+"★★★★");
					System.out.println("★★★★"+maxTask_no+"★★★★");
					
				service.taskIns(new Log(tk.getPno(),tk.getProject_no(),(int)maxTask_no,"t"));
				
				System.out.println("이름:"+tk.getTask_status()+":"+tk.getTask_content()+tk.getPno()+tk.getPno());				
				}
			}	
			else if(methodName=="requestApp") {
				System.out.println(methodName);
					for(Object ob:args) {
					System.out.println(ob);
					
					Task dataTk = tdao.taskDetail((int)ob);
					service.taskIns(new Log(dataTk.getPno(),dataTk.getProject_no(),dataTk.getTask_no(),"r"));

					}
			}else if(methodName=="insertProject") {
				for(Object ob:args) {
					
					System.out.println(ob);
					Member m = (Member)ob;				
					service.taskIns(new Log(m.getPno(),m.getProject_no(),0,"p"));
				}
				/*
				 * service.taskIns(new Log(tk.getPno(),tk.getProject_no(),tk.getTask_no(),"a"));
				 */
			}
							
				
			
			System.out.println("매개변수:"+methodName+"태스크가 추가되었습니다!");
			System.out.println("수행시간:"+(finish-start)+"MS");
	
		}		
		
		return result;
	}
}
