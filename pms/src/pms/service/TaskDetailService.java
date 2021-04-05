package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.TaskDetailDao;
import pms.dto.Task;

@Service
public class TaskDetailService {
	
	@Autowired(required=false)
	private TaskDetailDao dao;
	
	public Task taskDetail(int task_no) {
		return dao.taskDetail(task_no);
	}
	
}
