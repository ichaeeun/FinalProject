package pms.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.ManPowerDao;
import pms.dto.Member;
import pms.dto.MemberSch;
import pms.dto.ProjectAdd;
import pms.dto.pms_project;

@Service
public class ManPowerService {
	@Autowired(required=false)
	private ManPowerDao dao;
	// 전체 인원 조회
	public ArrayList<Member> memList1(String name){
		return dao.memList1(name);
	}

	// 페이징
	// count curPage start end
	// blockSize startBlock endBlock
	public ArrayList<Member> showMem(MemberSch sch){
		if(sch.getName()==null) sch.setName("");
		// 1. 데이터 총 건수 할당
		sch.setCount(dao.toCnt(sch));
		// 2. pageSize 할당 (한 페이지에 조회될 데이터 수)
		sch.setPageSize(8);
		// 3. 총 페이지 수 할당 (총건수/페이지크기) 해서 올림하기
		sch.setPageCount((int)Math.ceil(sch.getCount()/
				(double)8));
		// 4. 클릭한 현재 페이지 (화면에서 요청값으로 전달 받음) ==> default는 1
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 5. 마지막 페이지 블럭에서 next를 클릭한 것에 대한 처리
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// 6. start와 end 도출
		sch.setEnd(sch.getCurPage()*8);
		sch.setStart((sch.getCurPage()-1)*8+1);
		
		// # 블럭 처리
		// 1. 초기 block의 크기 지정 : 5
		sch.setBlockSize(5);
		// 2. blockNum : 현제페이지/블럭크기 올림처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		// 3. endblock
		int endBlock = blocknum*8;
		// 블럭의 마지막 페이지 번호는 총 페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
			// 마지막 블럭의 경우와 아닌 경우를 나누어서 설정함
		// 4. startBlock
			// 이전 블럭의 마지막 페이지 번호 + 1이 현재 블럭의 첫번째 페이지 번호
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);		
		return dao.showMem(sch);
	}
	
	public ArrayList<Member> showMem2(MemberSch sch){
		if(sch.getName()==null) sch.setName("");
		// 1. 데이터 총 건수 할당
		sch.setCount(dao.toCnt(sch));
		// 2. pageSize 할당 (한 페이지에 조회될 데이터 수)
		sch.setPageSize(8);
		// 3. 총 페이지 수 할당 (총건수/페이지크기) 해서 올림하기
		sch.setPageCount((int)Math.ceil(sch.getCount()/
				(double)8));
		// 4. 클릭한 현재 페이지 (화면에서 요청값으로 전달 받음) ==> default는 1
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 5. 마지막 페이지 블럭에서 next를 클릭한 것에 대한 처리
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// 6. start와 end 도출
		sch.setEnd(sch.getCurPage()*8);
		sch.setStart((sch.getCurPage()-1)*8+1);
		
		// # 블럭 처리
		// 1. 초기 block의 크기 지정 : 5
		sch.setBlockSize(5);
		// 2. blockNum : 현제페이지/블럭크기 올림처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		// 3. endblock
		int endBlock = blocknum*8;
		// 블럭의 마지막 페이지 번호는 총 페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
			// 마지막 블럭의 경우와 아닌 경우를 나누어서 설정함
		// 4. startBlock
			// 이전 블럭의 마지막 페이지 번호 + 1이 현재 블럭의 첫번째 페이지 번호
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);		
		return dao.showMem2(sch);
	}
	public ArrayList<Member> showMem3(MemberSch sch){
		if(sch.getPart()==null) sch.setPart("");
		// 1. 데이터 총 건수 할당
		sch.setCount(dao.toCnt(sch));
		// 2. pageSize 할당 (한 페이지에 조회될 데이터 수)
		sch.setPageSize(8);
		// 3. 총 페이지 수 할당 (총건수/페이지크기) 해서 올림하기
		sch.setPageCount((int)Math.ceil(sch.getCount()/
				(double)8));
		// 4. 클릭한 현재 페이지 (화면에서 요청값으로 전달 받음) ==> default는 1
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 5. 마지막 페이지 블럭에서 next를 클릭한 것에 대한 처리
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// 6. start와 end 도출
		sch.setEnd(sch.getCurPage()*8);
		sch.setStart((sch.getCurPage()-1)*8+1);
		
		// # 블럭 처리
		// 1. 초기 block의 크기 지정 : 5
		sch.setBlockSize(5);
		// 2. blockNum : 현제페이지/블럭크기 올림처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		// 3. endblock
		int endBlock = blocknum*8;
		// 블럭의 마지막 페이지 번호는 총 페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
			// 마지막 블럭의 경우와 아닌 경우를 나누어서 설정함
		// 4. startBlock
			// 이전 블럭의 마지막 페이지 번호 + 1이 현재 블럭의 첫번째 페이지 번호
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);		
		return dao.showMem3(sch);
	}
	// 가용인원 조회
	// 1) 사원의 직급 가져오기
	public ArrayList<Integer> pnoList(HashMap<String,String> hm){
		hm.put("pm", "pm");
		hm.put("wk", "wk");	
		return dao.pnoList(hm);
	}
	// 2) 해당 사원의 프로젝트 리스트 가져오기
	public ArrayList<ProjectAdd> projectList(int pno){	
		return dao.projectList(pno);	
	}
	// 3) 프로젝트 상태 가져오기
	public String status(int project_no) {
		return dao.status(project_no);
	}
	// 4) 사원 정보 가져오기
	public Member memPoss(int pno) {
		return dao.memPoss(pno);
	}
	

	
	
	
	
	
	public ArrayList<Member> deptList(){
		return dao.deptList();
	}
	
	public ArrayList<Member> memList3(String part){
		
		return dao.memList3(part);
	}
	public pms_project project(int project_no) {
		return dao.project(project_no);
	}
	public ArrayList<ProjectAdd> projectpno(int pno){
		return dao.projectpno(pno);
	}
	
	public ArrayList<Member> authList(){
		return dao.authList();
	}
	
	public void addMember(Member ins) {
		dao.addMember(ins);
	}
	
	public void deleteMember(int pno) {
		dao.deleteMember(pno);
	}
	
	public ArrayList<pms_project> allProject(){
		return dao.allProject();
	}
	
	public void alertAuth(Member member) {
		dao.alertAuth(member);
	}
	
	public void insertProject(Member member) {
		dao.insertProject(member);
	}
	
	public int chId(String id) {
		return dao.chId(id);
	}
	public int chEmail(String email) {
		return dao.chEmail(email);
	}	
}









