package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Task;

@Repository
public interface CalDao {
	
	public ArrayList<Task> calenList(int project_no);
}
