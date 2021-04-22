package pms.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.MemberSch;
import pms.dto.ProjectAdd;
import pms.dto.pms_project;

// pms.manpower.dao.ManPowerDao
@Repository
public interface ManPowerDao {
	// 전체인원
	public ArrayList<Member> memList1(String name);
	// 가용인원 - pno 가져오기
	public ArrayList<Integer> pnoList(HashMap<String,String> hm);
	// 가용인원 - 1명 참여 프로젝트 가져오기
	public ArrayList<ProjectAdd> projectList(int pno);
	// 가용인원 - 프로젝트 상태
	public String status(int project_no);
	// 가용인원 - 최종 조회
	public Member memPoss(int pno);
	
	// 전체인원 페이징
	public ArrayList<Member> showMem(MemberSch sch);
	// 가용인원 합치기 페이징
	public ArrayList<Member> showMem2(MemberSch sch);
	// 부서인원 페이징
	public ArrayList<Member> showMem3(MemberSch sch);
	
	
	// 부서인원 - 부서목록
	public ArrayList<Member> deptList();
	// 부서인원 - 최종 조회
	public ArrayList<Member> memList3(String part);
	
	// 프로젝트넘버에 따른 프로젝트
	public pms_project project(int project_no);
	public ArrayList<ProjectAdd> projectpno(int pno);
	
	// 계정생성 - 권한 목록
	public ArrayList<Member> authList();
	// 계정생성 - insert
	public void addMember(Member ins);
	// 계정삭제
	public void deleteMember(int pno);
	
	// 프로젝트 리스트
	public ArrayList<pms_project> allProject();
	// 직급 변경
	public void alertAuth(Member member);
	// 프로젝트 할당
	public void insertProject(Member member);
	
	// 총 데이터 건수
	public int toCnt(MemberSch sch);
	
	// 계정생성 유효성 체크
	public int chId(String id);
	public int chEmail(String email);
}





