package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.RiskBoard;
import pms.dto.Task;
import pms.dto.pms_project;
// pms.dao.DashboardDao
@Repository
public interface DashboardDao {
	// 프로젝트 번호로 태스크수, 리스크수, 멤버수 가져오기
	public Task getTaskNum(int proeject_no); 
	public RiskBoard getRiskNum(int proeject_no);
	public Member getMemcnt(int proeject_no);
	
	public int getMembercnt(int proeject_no);
	// 전체 프로젝트 수 가져오기
	public int getAllProject();		// 전체 프로젝트 수
	public int getDoingProject();	// 진행 프로젝트 수
	public int getAllTask();		// 전체 태스크
	public int getDoingTask();		// 진행 태스크
	public int getAllRisk();		// 전체 리스크
	public int getDoingRisk();		// 진행 리스크
	public int getAllmember();		// 전체 인원
	
	public ArrayList<pms_project> DoingProject(); // 진행중인 프로젝트 리스트
	
}
