package pms.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.dto.Calendar;
import pms.dto.Task;

@Repository
public interface CalDao {
	
	public ArrayList<Task> calenList(int project_no);
	public Task getTask(String task_name);
	public Task getTaskUsingTaskno(int task_no);
	public Task getTaskNoUsingTaskName(HashMap<String,String> hm);
}
