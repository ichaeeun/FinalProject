package pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.Member;

@Controller
public class ChattingController {

	// http://localhost:7080/pms/chatting.do
		// 192.168.0.47:7080
		@RequestMapping("chatting.do")
		public String chatting(HttpSession session, @RequestParam int no) {

			Member m = (Member)session.getAttribute("mem");
			
			System.out.println(m.getName()+m.getPno());
			return "chatting";
		}
}
