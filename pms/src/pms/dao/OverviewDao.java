package pms.dao;

import java.util.ArrayList;

import pms.dto.Log;
import pms.dto.Task;
import pms.dto.Overview;

public interface OverviewDao {
	public ArrayList<Log> LogList(int no);
	public ArrayList<Task> TaskList(int no);
	public ArrayList<Task> TaskList2(int no);
	public ArrayList<Overview> ViewMem(int no);
}
