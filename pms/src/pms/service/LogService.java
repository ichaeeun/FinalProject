package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.LogDao;
import pms.dto.Log;
@Service
public class LogService {
	@Autowired(required = false)
	private LogDao dao;
	
	public void taskIns(Log log) { // 메인 태스크 추가
		System.out.println("### 서비스단 호출 ##"+log.getPno());
		dao.taskIns(log);
	}
	
}
