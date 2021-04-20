package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.LogDao;
import pms.dto.Log;
@Service
public class LogService {
	@Autowired(required = false)
	private LogDao dao;
	
	public void taskIns(Log ins) { // 메인 태스크 추가
		dao.taskIns(ins);
	}
}
