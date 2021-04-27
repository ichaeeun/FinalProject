package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.ProjectAdd;
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
	
	public void insertProject(pms_project insert);		// 프로젝트 추가
	public void insertProejectAdd(pms_project insert);	// 인원할당 테이블에(PM번호, 프로젝트번호)추가
		
	public void updateProject(pms_project update);		// 프로젝트 수정
	
	public void updateTask(int no);			// 프로젝트에 속한 태스크 수정
	
	public ArrayList<Member> pmlist();		// 진행중인 프로젝트가 없는 pm의 이름번호
		
	
	
}

