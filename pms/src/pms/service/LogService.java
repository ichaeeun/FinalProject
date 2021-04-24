package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.LogDao;
import pms.dto.Log;
@Service
public class LogService {
	@Autowired(required = false)
	private LogDao dao;
	
	public void taskIns(Log log) { // Aop메서드 정보를 log테이블(DB) 추가
		System.out.println("### 서비스단 호출 ##"+log.getPno());
		dao.taskIns(log);
	}
	public ArrayList<Log> taskLog(int no){ // 태스크 추가
		return dao.taskLog(no);		
	};
	public ArrayList<Log> reqLog(int no){ // 태스크 완료 승인요청
		return dao.reqLog(no);
	};
	public ArrayList<Log> projLog(int no){ // 프로젝트 인원 할당 
		return dao.projLog(no);
	};
	
}
