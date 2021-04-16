package pms.dao;
//pms.dao.RiskDao
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.RiskBoard;
import pms.dto.RiskFile;
import pms.dto.UptStatus;

@Repository
public interface RiskDao {
	public ArrayList<RiskBoard> rBoard();
	public ArrayList<RiskBoard> rBoard_request();
	public void insertBoard(RiskBoard insert);
	public RiskBoard getBoard(int risk_no);
	public void uptStatus(UptStatus upt_satus);
	public void insertRiskFile(RiskFile riskfile);
	
}
