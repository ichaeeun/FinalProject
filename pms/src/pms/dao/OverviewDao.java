package pms.dao;

import java.util.ArrayList;

import pms.dto.Log;
import pms.dto.Task;

public interface OverviewDao {
	public ArrayList<Log> LogList(Log log);
	public ArrayList<Task> TaskList(Task task);
	public ArrayList<Task> TaskList2(Task task);
}
