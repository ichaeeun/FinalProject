package pms.dashboard.dao;

import org.springframework.stereotype.Repository;

import pms.dashboard.dto.Member;

@Repository
public interface DashboardDao {
	
	public Member IsMem(Member member);
	
}
