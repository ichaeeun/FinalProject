package pms.dashboard.dao;

import org.springframework.stereotype.Repository;

import pms.dashboard.dto.Login;

@Repository
public interface DashboardDao {
	
	public Login IsMem(Login login);
	
}
