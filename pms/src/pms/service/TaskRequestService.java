package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.TaskRequestDao;
import pms.dto.TaskRequest;
@Service
public class TaskRequestService {
	@Autowired(required=false)
	private TaskRequestDao dao;
	
	public ArrayList<TaskRequest> tlist(){
		return dao.tlist();
	}
	
}
