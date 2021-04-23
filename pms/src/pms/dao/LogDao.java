package pms.dao;

import org.springframework.stereotype.Repository;

import pms.dto.Log;

@Repository
public interface LogDao {
	public void taskIns(Log log);
}
