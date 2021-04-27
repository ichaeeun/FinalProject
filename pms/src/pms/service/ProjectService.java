package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.ProjectDao;
import pms.dto.ProjectAdd;
import pms.dto.pms_project;
import pms.dto.pms_projectSch;

@Service
public class ProjectService {

	@Autowired(required = false)
	private ProjectDao dao;

	// 코드 추가
	public ArrayList<pms_project> pms_projectList(pms_projectSch sch){
		if(sch.getProject_name()==null) sch.setProject_name("");
		// 1. 데이터 총건수 할당.
		sch.setCount(dao.totCnt(sch));
		/*
		// 2. 화면에서 요청값으로 가져온 pageSize로 총페이지수 처리
		//		1) 초기 화면에 표시될 pageSize를 default로 설정.
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		//		2) 총페이지수 : 올림처리(총건수/페이지크기)
		//				ex) 총건수 17건이면 / 5 ==> 3.4 ==> 4페이지필요
		sch.setPageCount((int)Math.ceil(sch.getCount()/
				(double)sch.getPageSize()));
		// 3. 클릭한 현재 페이지(요청) default를 1로 선언.
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		//		마지막 페이지 블럭에서 next를 클릭한 것에 대한 예외 처리.
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// start, end 속성을 도출하기 위해서..
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		// # 블럭 처리..
		// 1. 초기 block의 크기 지정 : 5
		sch.setBlockSize(5);
		// 2. blocknum : 현재페이지/블럭의 크기를 올림 처리.
		int blocknum = (int)Math.ceil(
				sch.getCurPage()/(double)sch.getBlockSize());
		// 3. endBlock
		int endBlock = blocknum*sch.getBlockSize();
		//		블럭의 마지막 페이지번호는 총페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock>sch.getPageCount()?
				sch.getPageCount():endBlock);
		// 4. startBlock
		//	이전 블럭의 마지막 페이지 번호+1 이 현재 블럭의 첫번째 페이지번호 
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1); 
		*/
		return dao.pms_projectList(sch);
		
	}
	// 전체 프로젝트 리스트(완료)
	public ArrayList<pms_project> pms_projectList2(pms_projectSch sch){
		if(sch.getProject_name()==null) sch.setProject_name("");
		// 1. 데이터 총건수 할당.
		sch.setCount(dao.totCnt(sch));
		return dao.pms_projectList2(sch);
	}
	
	// pno가 진행중인 프로젝트 리스트
	public ArrayList<pms_project> projectList(int pno){
		return dao.projectList(pno);
	}
	// pno가 완료한 프로젝트 리스트
	public ArrayList<pms_project> projectList2(int pno){
		return dao.projectList2(pno);
	}

	public pms_project getProject(int pno) {
		// 기본 정보 할당
		pms_project pms_project = dao.getProject(pno);
		return pms_project;
		
	}
	// 프로젝트 추가
	public void insertProject(pms_project insert) {
		dao.insertProject(insert);		// 프로젝트 테이블에 추가
		dao.insertProejectAdd(insert);	// 인원할당 테이블에 PM 정보입력
	}
	// 프로젝트 수정
	public void updateProject(pms_project update) {
		dao.updateProject(update);	// 프로젝트 테이블에 정보 입력

	}
	// 프로젝트의 모든 태스크 완료로 변경
	public void updateTask(int no) {
		dao.updateTask(no);		// 해당 프로젝트에 속한 모든태스크 상태를 완료로 변경

	}
	
	
	
}
