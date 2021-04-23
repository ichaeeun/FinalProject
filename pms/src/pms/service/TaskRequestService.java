package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.TaskRequestDao;
import pms.dto.Member;
import pms.dto.TaskRequest;
@Service
public class TaskRequestService {
	@Autowired(required=false)
	private TaskRequestDao dao;
	
	public ArrayList<TaskRequest> tlistP(Member member){
		return dao.tlistP(member);
	}
	public ArrayList<TaskRequest> tlistW(Member member){
		return dao.tlistW(member);
	}
	
}
