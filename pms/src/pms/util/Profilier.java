package pms.util;

import java.util.ArrayList;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import pms.controller.LogController;
import pms.dao.OverviewDao;
import pms.dto.Log;
import pms.dto.Task;
import pms.service.LogService;
import pms.service.OverviewService;


//springweb.z04_util.Profilier
// 수행할 내용 처리 advice 클래스
public class Profilier {
	@Autowired(required = false)
	private LogService service;


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
			for(Object ob:args) {
				Task tk = (Task)ob;
				service.taskIns(new Log(tk.getPno(),tk.getProject_no(),tk.getTask_no()));
				
				System.out.println("이름:"+tk.getTask_name()+":"+tk.getTask_content()+tk.getPno()+tk.getPno());				
			}

			
			System.out.println(className+"의"+methodName+"매개변수:"+args+"태스크가 추가되었습니다!");
			System.out.println("수행시간:"+(finish-start)+"MS");
	
		}		
		
		return result;
	}
}
