package pms.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Mail;
import pms.service.MailService;
import pms.service.ManPowerService;

@Controller
@RequestMapping("mail.do")
public class MailController {
	@Autowired(required=false)
	private MailService service;
	@Autowired(required=false)
	private ManPowerService service2;

	// http://localhost:7080/pms/mail.do?method=send
	@RequestMapping(params="method=send")
	public String send(Mail send) throws MessagingException {
		System.out.println(send.getSubject());
		service.sendMail(send);
		// 메일 전송은 service단에서 처리
		return "contacts-list";
	} 
	// 메일 모달에 값 넣기
	@PostMapping(params="method=jsonMailList")
	public String mailInfo(Model d, @RequestParam("pno") int pno) {
		d.addAttribute("success","Y");
		System.out.println("메일pno:"+pno);
		d.addAttribute("mailMemList",service2.memPoss(pno));
		System.out.println(service2.memPoss(pno).getEmail());
		return "pageJsonReport";
	}
}
