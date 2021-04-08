package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.RiskDao;
import pms.dto.RiskBoard;

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

}