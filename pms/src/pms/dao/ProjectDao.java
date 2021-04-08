package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.pms_project;
import pms.dto.pms_projectSch;

@Repository
public interface ProjectDao {
	// (프로젝트 리스트 출력 코드)추가
	public int totCnt(pms_projectSch sch);
	public ArrayList<pms_project> pms_projectList(pms_projectSch sch);
	public pms_project getProject(int no);
}
