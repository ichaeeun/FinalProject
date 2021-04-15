package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.OverviewDao;
import pms.dao.TaskDetailDao;
import pms.dto.Log;
import pms.dto.Member;
import pms.dto.Task;
import pms.dto.Overview;

@Service
public class OverviewService {
	@Autowired(required = false)
	private OverviewDao dao;
	
	public ArrayList<Log> LogList(int no){ // 로그출력
		return dao.LogList(no);
	}
	public ArrayList<Task> TaskList(int no){ // 전체태스크 리스트 출력
		return dao.TaskList(no);
	}
	public ArrayList<Task> TaskList2(int no){ // 마감임박 태스크 리스트 출력
		return dao.TaskList2(no);
	}
	public ArrayList<Overview> ViewMem(int no){ // 오버뷰 멤버 & progress출력
		return dao.ViewMem(no);
	}
	public void mTaskInsert(Task t) {
		dao.mTaskInsert(t);
	}
	public ArrayList<Member> taskMember(int no){ //project_no
		return dao.taskMember(no);
	}

}
