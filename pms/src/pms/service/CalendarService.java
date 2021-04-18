package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.CalDao;
import pms.dao.GanttDao;
import pms.dto.Calendar;
import pms.dto.Task;
import pms.dto.pms_project;

@Service
public class CalendarService {
	
	@Autowired(required = false)
	private CalDao dao;
	@Autowired(required = false)
	private GanttDao gdao;
	@Autowired(required = false)
	private GanttService gservice;
	
	public ArrayList<Calendar> calenList(int project_no){
		ArrayList<Task> t = new ArrayList<Task>();
		ArrayList<Calendar> cal = new ArrayList<Calendar>();
		// project 가져오기
		pms_project project = gdao.getProject(project_no);
		// task 가져오기
		t = gdao.getTask(project);
		
		// project => calendar
		Calendar p = new Calendar(project.getProject_no(),project.getProject_no(),project.getProject_name(),
				gservice.getName(project.getPno()),project.getProject_content(),project.getStart1(),project.getEnd1(),
				true,"#ffffff",	"#FF0000", "#000000");
		cal.add(p);
		// task => calendar 
		for(int index=0;index<t.size();index++) {
			Calendar c = new Calendar(
					t.get(index).getTask_no(),project_no,t.get(index).getTask_name(),
					gservice.getName(t.get(index).getPno()),t.get(index).getTask_content(),
					t.get(index).getStartdte(),t.get(index).getEnddte(),true,
					"#ffffff",
					t.get(index).getTask_priority().equals("High")?"#FF0000":
						t.get(index).getTask_priority().equals("Medium")?"#FFFF00":"#00FF00",
					"#000000"
					);
			cal.add(c);
		}
		/*
		private int id;				task_no
		private int groupid			project_no
		private String title; 		task_name	
		private String writer;		pno
		private String content;		task_content
		private String start;		startdte
		private String end;			enddte
		private boolean allDay;		?
		private String textColor;	black
		private String backgroundColor; if(priority.equals("High") red ...
		private String borderColor; gray
		
		private int pno;
	   private int project_no;
	   private int task_no;
	   private String task_content;
	   private int task_parent_no;
	   private String startdte;
	   private String enddte;
	   private String task_status;
	   private String task_priority; //추가 
	   private String task_name;
		
		pno number,
	    project_no number,
	    task_no number primary key,
	    task_name varchar2(200),
	    task_content varchar2(200),
	    task_priority varchar2(10),
	    task_parent_no number,
	    startdte varchar2(200),
	    enddte varchar2(200),
	    task_status varchar2(50)
		 */
		
		return cal;
	}
}
