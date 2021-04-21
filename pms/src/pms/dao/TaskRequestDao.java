package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.TaskRequest;

@Repository
public interface TaskRequestDao {
	public ArrayList<TaskRequest> tlist();
	public void tinsert(int task_no); 
	public void tdelete(int task_no);
	
}
