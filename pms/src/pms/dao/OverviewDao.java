package pms.dao;

import java.util.ArrayList;

import pms.dto.Log;
import pms.dto.Member;
import pms.dto.Task;
import pms.dto.Overview;

public interface OverviewDao {
	public ArrayList<Log> LogList(int no);
	public ArrayList<Task> TaskList(int no);
	public ArrayList<Task> TaskList2(int no);
	// 개발자 전체 태스크 리스트
	public ArrayList<Task> TaskListAll(int pno);
	public ArrayList<Task> TaskListAll2(int pno);
	
	public ArrayList<Overview> ViewMem(int no);
	public void mTaskInsert(Task t); // 메인태스크 추가
	public ArrayList<Member> taskMember(int no); // tasklist에 maintask추가 select option
}
