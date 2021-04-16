package pms.dao;

import org.springframework.stereotype.Repository;

import pms.dto.Member;

@Repository
public interface LoginDao {
	public Member IsMem(Member member);
	public Member IsPm(int pno);
}
