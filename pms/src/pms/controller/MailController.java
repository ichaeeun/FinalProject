package pms.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.dto.Mail;
import pms.service.MailService;

@Controller
@RequestMapping("mail.do")
public class MailController {
	@Autowired(required=false)
	private MailService service;
	

	// http://localhost:7080/springweb/mail.do?method=send
	@RequestMapping(params="method=send")
	public String send(Mail send) throws MessagingException {
		System.out.println(send.getSubject());
		service.sendMail(send);
		// 메일 전송은 service단에서 처리
		return "contacts-list";
	}
}
