package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	// http://localhost:7080/pms/risk.do?method=riskDetail
	@RequestMapping(params="method=riskDetail")
	public String riskdetail() {
		return"risk_detail";
	}
	// http://localhost:7080/pms/risk.do?method=riskBoardCreate
	@RequestMapping(params="method=riskBoardCreate")
	public String riskformCreate() {
		return"riskBoardCreate";		
	}
	// http://localhost:7080/pms/risk.do?method=riskRequest
	@RequestMapping(params="method=riskRequest")
	public String riskrequest() {
		return"risk_request";		
	}

}
