package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.RiskDao;
import pms.dto.RiskBoard;
import pms.dto.UptStatus;

@Service
public class RiskService {
	@Autowired(required = false)
	private RiskDao dao;
	
	public ArrayList<RiskBoard> rBoard(){
		return dao.rBoard();
	}
	public ArrayList<RiskBoard> rBoard_request(){
		return dao.rBoard_request();
	}
	
	public void insertBoard(RiskBoard insert) {
		dao.insertBoard(insert);
	}
	public RiskBoard getBoard(int risk_no) {
		return dao.getBoard(risk_no);
	}
	
	public void uptStatus (UptStatus upt_satus) {
		dao.uptStatus(upt_satus);
	}

}
