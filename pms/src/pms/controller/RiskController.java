package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.RiskBoard;
import pms.service.RiskService;

@Controller
@RequestMapping("risk.do")
public class RiskController {
	@Autowired(required = false)
	private RiskService service;
	
	// http://localhost:7080/pms/risk.do?method=riskBoard
	@RequestMapping(params="method=riskBoard")
	public String riskform(Model d) {
		d.addAttribute("risklist", service.rBoard());
		return "riskBoard";
	}
	// http://localhost:7080/pms/risk.do?method=riskRequest
	@RequestMapping(params="method=riskRequest")
	public String riskrequest(Model d) {
		d.addAttribute("requestlist",service.rBoard_request());
		return"risk_request";		
	}
	// http://localhost:7080/pms/risk.do?method=riskDetail
	@RequestMapping(params="method=riskDetail")
	public String riskdetail() {
		return"risk_detail";
	}
	
	
	// http://localhost:7080/pms/risk.do?method=riskBoardCreate
	@RequestMapping(params="method=riskBoardCreate")
	public String riskformCreate(@ModelAttribute("riskboard") RiskBoard b) {
		return"riskBoardCreate";		
	}
	// http://localhost:7080/pms/risk.do?method=insert
	@RequestMapping(params = "method=insert")
	public String insertBoard(RiskBoard insert, Model d) {
		service.insertBoard(insert);
		d.addAttribute("proc","insert");
		d.addAttribute("risklist",service.rBoard());
		return "riskBoard";
	}


}
