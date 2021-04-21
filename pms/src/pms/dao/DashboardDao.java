package pms.dao;

import org.springframework.stereotype.Repository;

import pms.dto.Member;
import pms.dto.RiskBoard;
import pms.dto.Task;
// pms.dao.DashboardDao
@Repository
public interface DashboardDao {
	public Task getTaskNum(int proeject_no);
	public RiskBoard getRiskNum(int proeject_no);
	public Member getMemcnt(int proeject_no);
	
}
