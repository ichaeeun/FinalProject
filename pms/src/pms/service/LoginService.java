package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.LoginDao;
import pms.dto.Member;

@Service
public class LoginService {
	
	@Autowired(required = false)
	private LoginDao dao;
	
	
	public Member IsMem(Member member) {
		return dao.IsMem(member);
	}
	public Member IsPm(String auth) {
		return dao.IsPm(auth);
	}
}
