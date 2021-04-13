package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.OverviewDao;
import pms.dto.Log;
import pms.dto.Task;

@Service
public class OverviewService {
	@Autowired(required = false)
	private OverviewDao dao;
	
	public ArrayList<Log> LogList(Log log){
		return dao.LogList(log);
	}
	public ArrayList<Task> TaskList(int no){
		return dao.TaskList(no);
	}
	public ArrayList<Task> TaskList2(int no){
		return dao.TaskList2(no);
	}
}
