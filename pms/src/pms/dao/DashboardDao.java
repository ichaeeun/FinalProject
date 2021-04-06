package pms.dao;

import java.util.ArrayList;


import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.Project;
import pms.dto.Task;
import pms.dto.pms_project;
import pms.dto.pms_projectSch;
// pms.dao.DashboardDao
@Repository
public interface DashboardDao {
	
	public Member IsMem(Member member);
	// (프로젝트 리스트 출력 코드)추가
	public int totCnt(pms_projectSch sch);
	public ArrayList<pms_project> pms_projectList(pms_projectSch sch);
	   // 간트
	public ArrayList<Task> getTask(Project project);

}
