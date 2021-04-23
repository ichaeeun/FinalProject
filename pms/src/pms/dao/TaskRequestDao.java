package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.TaskRequest;

@Repository
public interface TaskRequestDao {
	public ArrayList<TaskRequest> tlistP(Member member);
	public ArrayList<TaskRequest> tlistW(Member member);
	
	public void tinsert(int task_no); 
	public void tdelete(int task_no);
	
}
