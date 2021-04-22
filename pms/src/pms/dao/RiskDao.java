package pms.dao;
//pms.dao.RiskDao
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.dto.RiskBoard;
import pms.dto.RiskFile;
import pms.dto.UptStatus;

@Repository
public interface RiskDao {
	public ArrayList<RiskBoard> rBoard(int project_no);
	public ArrayList<RiskBoard> rBoard_request(int project_no);
	public ArrayList<RiskBoard> rBoardAll();
	public void insertBoard(RiskBoard insert);
	public RiskBoard getBoard(int risk_no);
	public void uptStatus(UptStatus upt_satus);
	public void insertRiskFile(RiskFile riskfile);
	public ArrayList<RiskFile> getRiskFile(int fno);
	public ArrayList<RiskFile> fileInfo(int fno);
	public void updateRisk(RiskBoard upt);
	public void updateFile(HashMap<String, String> hs);
	public void deleteRisk(int risk_no);
	public void deleteFile(int risk_no);
}