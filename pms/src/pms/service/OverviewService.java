package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.OverviewDao;
import pms.dto.Log;
import pms.dto.Task;
import pms.dto.Overview;

@Service
public class OverviewService {
	@Autowired(required = false)
	private OverviewDao dao;
	
	public ArrayList<Log> LogList(int no){
		return dao.LogList(no);
	}
	public ArrayList<Task> TaskList(int no){
		return dao.TaskList(no);
	}
	public ArrayList<Task> TaskList2(int no){
		return dao.TaskList2(no);
	}
	public ArrayList<Overview> ViewMem(int no){
		return dao.ViewMem(no);
	};
	public void mTaskInsert(Task t) {
		dao.mTaskInsert(t);
	}
}
