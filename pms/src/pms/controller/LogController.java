package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import pms.dto.Log;
import pms.service.LogService;

@Controller
public class LogController {
	@Autowired(required = false)
	private LogService service;
	
	public void taskIns(Log ins) { 
		service.taskIns(ins);
	};
}
