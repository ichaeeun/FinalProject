package pms.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dashboard.dao.DashboardDao;
import pms.dashboard.dto.Login;

@Service
public class DashboardService {
	
	@Autowired(required = false)
	private DashboardDao dao;
	
	public Login IsMem(Login login) {
		if(login.getId() == null) login.setId("");
		if(login.getPw() == null) login.setPw("");
		return dao.IsMem(login);
	}
}
