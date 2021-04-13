package pms.dao;

import java.util.ArrayList;

import pms.dto.Log;
import pms.dto.Task;

public interface OverviewDao {
	public ArrayList<Log> LogList(Log log);
	public ArrayList<Task> TaskList(int no);
	public ArrayList<Task> TaskList2(int no);
}
