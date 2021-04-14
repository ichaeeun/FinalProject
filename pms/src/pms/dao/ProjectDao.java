package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.pms_project;
import pms.dto.pms_projectSch;

@Repository
public interface ProjectDao {
	// (프로젝트 리스트 출력 코드)추가
	public int totCnt(pms_projectSch sch);
	// 프로젝트 전체 리스트(진행)
	public ArrayList<pms_project> pms_projectList(pms_projectSch sch);
	// 프로젝트 전체 리스트(완료)	
	public ArrayList<pms_project> pms_projectList2(pms_projectSch sch);
	// 본인이 속한 프로젝트 리스트 출력(진행)
	public ArrayList<pms_project> projectList(int pno);
	// 본인이 속한 프로젝트 리스트 출력(완료)
	public ArrayList<pms_project> projectList2(int pno);
	
	
	public pms_project getProject(int pno);
	public void insertProject(pms_project insert);
	public void updateProject(pms_project update);
}

