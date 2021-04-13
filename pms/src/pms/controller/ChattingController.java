package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	// http://localhost:7080/springweb/chatting.do
		// 192.168.0.47:7080
		@RequestMapping("/chatting.do")
		public String chatting() {
			return "chatting";
		}
}
