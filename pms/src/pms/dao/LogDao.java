package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Log;

@Repository
public interface LogDao {
	public void taskIns(Log log);
	public ArrayList<Log> taskLog(int no); // 태스크 추가
	public ArrayList<Log> reqLog(int no); // 태스크 완료 승인요청
	public ArrayList<Log> projLog(int no); // 프로젝트 인원 할당 
	
}
