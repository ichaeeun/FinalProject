package pms.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dashboard.dao.DashboardDao;
import pms.dashboard.dto.Member;

@Service
public class DashboardService {
	
	@Autowired(required = false)
	private DashboardDao dao;
	
	public Member IsMem(Member member) {
		return dao.IsMem(member);
	}
}
