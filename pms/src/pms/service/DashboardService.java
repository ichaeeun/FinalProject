package pms.service;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.DashboardDao;
import pms.dto.DashBoard;
import pms.dto.Gantt;
import pms.dto.Member;
import pms.dto.Project;
import pms.dto.ProjectAdd;
import pms.dto.RiskBoard;
import pms.dto.Task;
import pms.dto.pms_project;
import pms.dto.pms_projectSch;
// pms.service.DashboardService
@Service
public class DashboardService {
	
	@Autowired(required = false)
	private DashboardDao dao;
	public Task getTaskNum(int proeject_no) {
		return dao.getTaskNum(proeject_no);
		
	}
	public RiskBoard getRiskNum(int proeject_no) {
		return dao.getRiskNum(proeject_no);
		
	}
	public Member getMemcnt(int proeject_no) {
		return dao.getMemcnt(proeject_no);
	}
	public int getAllProject() {
		return dao.getAllProject();
	}
	
	public int getDoingProject() {
		return dao.getDoingProject();
		
	}
	public ArrayList<pms_project> DoingProject(){

		return dao.DoingProject();
	}
	public int getAllTask() {
		return dao.getAllTask();
		
	}
	public int getDoingTask() {
		return dao.getDoingTask();
	}
	public int getAllRisk() {
		return dao.getAllRisk();
	}
	public int getDoingRisk() {
		return dao.getDoingRisk();
	}
	public int getAllmember() {
		return dao.getAllmember();
	}
	public int getMembercnt(int proeject_no) {
		return dao.getMembercnt(proeject_no);
	}
}	