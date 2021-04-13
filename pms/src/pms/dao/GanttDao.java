package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Gantt;
import pms.dto.Task;
import pms.dto.pms_project;

@Repository
public interface GanttDao {
	public ArrayList<Task> getTask(pms_project project);
	public String getName(int pno);
	public void insertTask(Gantt gantt);
}
