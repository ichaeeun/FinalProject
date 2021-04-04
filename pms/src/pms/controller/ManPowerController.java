package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("manpower.do")
public class ManPowerController {
	// http://localhost:7080/pms/manpower.do?method=contacts_list
	@RequestMapping(params="method=contacts_list")
	public String contacts_list() {
		return "contacts-list";
	}
	
	// http://localhost:7080/pms/manpower.do?method=contacts_profile
	@RequestMapping(params="method=contacts_profile")
	public String contacts_profile() {
		return "contacts-profile";
	}
}
