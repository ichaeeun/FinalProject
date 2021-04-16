package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.RiskBoard;
import pms.dto.UptStatus;
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
	public String riskdetail(@RequestParam("risk_no") int risk_no, Model d) {
		System.out.println("리스크넘버:"+risk_no);
		d.addAttribute("riskboard",service.getBoard(risk_no));
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
	// http://localhost:7080/pms/risk.do?method=uptStatus
	@RequestMapping(params = "method=uptStatus")
	public String uptStatus (@RequestParam("risk_no") int risk_no, Model d) {
		System.out.println("test:"+risk_no);
		UptStatus upt_satus = new UptStatus("승인", risk_no);
		
		service.uptStatus(upt_satus);
		d.addAttribute("uptFinish", "Y");
		return "forward:risk.do?method=riskDetail";		// 요청값을 갖고 리스크 디테일 컨트롤러로 이동.
	}
	
	
	// http://localhost:7080/pms/risk.do?method=download
	// 화면단에 클릭시, 
	// http://localhost:7080/board/risk.do?method=download&filename=파일명
	@RequestMapping(params="method=download")
	public String download(@RequestParam("filename") String filename, Model d) {
		System.out.println("파일명 : "+filename);
		d.addAttribute("downloadFile", filename);
		// viewer안에 선언한 모델명 - 파일다운로드뷰어에 같은 이름을 사용해준다.
		// 컨테이너 안에 있는 viewer명.
		return"downloadviewerrisk";
	}
	
	
}
