package pms.dashboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dashboard.dao.DashboardDao;
import pms.dashboard.dto.Member;
import pms.dashboard.dto.pms_project;
import pms.dashboard.dto.pms_projectSch;

@Service
public class DashboardService {
	
	@Autowired(required = false)
	private DashboardDao dao;
	
	public Member IsMem(Member member) {
		return dao.IsMem(member);
	}
	// 코드 추가
	public ArrayList<pms_project> pms_projectList(pms_projectSch sch){
		if(sch.getProject_name()==null) sch.setProject_name("");
		// 1. 데이터 총건수 할당.
		sch.setCount(dao.totCnt(sch));
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
		
		return dao.pms_projectList(sch);
		
	}
}
