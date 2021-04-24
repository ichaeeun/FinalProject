package pms.service;

import java.util.ArrayList;
import java.util.HashMap;

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
		
		// project => calendar, id = 1로 설정
		Calendar p = new Calendar(1,0,"0",project.getProject_name(),
				gservice.getName(project.getPm_pno()),project.getProject_content(),project.getStart1(),project.getEnd1(),
				1,false,"#ffffff",	"#f1556c", "#000000");
		cal.add(p);
		// task => calendar 
		for(int index=0;index<t.size();index++) {
			Calendar c = new Calendar(
					t.get(index).getTask_no(),
					// groupId, 부모no = 1이면 태스크이므로 그룹 아이디를 자기자신으로,
					// 			부모no != 1이면 서브태스크이므로 부모태스크 그대로 지정
					t.get(index).getTask_parent_no()==1?t.get(index).getTask_no():t.get(index).getTask_parent_no(),
					getTaskUsingTaskno(t.get(index).getTask_parent_no()) == null?project.getProject_name():
						getTaskUsingTaskno(t.get(index).getTask_parent_no()).getTask_name(),
					t.get(index).getTask_name(),
					gservice.getName(t.get(index).getPno()),t.get(index).getTask_content(),
					t.get(index).getStartdte(),t.get(index).getEnddte(),
					t.get(index).getTask_priority().equals("High")?1:
						t.get(index).getTask_priority().equals("Medium")?2:3,
					false,
					"#ffffff",
					t.get(index).getTask_priority().equals("High")?"#f1556c":
						t.get(index).getTask_priority().equals("Medium")?"#f7b84b":"#1abc9c",
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
	/*
	public Task insert_caltotask(Calendar cal,int project_no) {
		Task task = new Task();
		
		task.setPno();
		
		return task;
	}
	*/
	
	public ArrayList<String> getTitles(int project_no){
		ArrayList<String> names = new ArrayList<String>();
		ArrayList<Task> t = new ArrayList<Task>();
		pms_project project = gdao.getProject(project_no);
		t = gdao.getTask(project);
		
		String name = project.getProject_name();
		names.add(name);
		for(int i=0;i<t.size();i++) {
			if(t.get(i).getTask_parent_no() == 1)
				names.add(t.get(i).getTask_name());
		}
		
		return  names;
	}
	
	public void insertTask(Calendar cal,int project_no) {
		Task task = new Task();
		// cal => task 변환 필요
		task = convertCalToTask(cal,project_no);
		gdao.insertTask(task);
	}
	
	public void updateTask(Calendar cal, int project_no) {
		Task task = new Task();
		task = convertCalToTask(cal, project_no);
		gdao.updateTask(task);
	}
	
	public void updateProject(Calendar cal, int project_no) {
		pms_project pp = gservice.getProject(project_no);

		pp.setProject_name(cal.getTitle());
		pp.setProject_content(cal.getContent());
		pp.setStart1(cal.getStart());
		pp.setEnd1(cal.getEnd());
		
		gdao.uptProject(pp);
	}
	
	public Task convertCalToTask(Calendar cal,int project_no) {
		Task task = new Task();
		
		/*
		private int id;				task_no
		private int groupid			parent_no
		private String title; 		task_name	
		private String writer;		pno
		private String content;		task_content
		private String start;		startdte
		private String end;			enddte
		private boolean allDay;		?
		private String textColor;	black
		private String backgroundColor; if(priority.equals("High") red ...
		private String borderColor; gray
		
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
		
		sch.parent=$("[name=parent]").val();
	  sch.priority=$("[name=priority]").val();
	  sch.holder=$("[name=holder]").val();
	  
	  private int pno;
	   private int project_no;
	   private int task_no;
	   private String task_content;
	   private int task_parent_no;
	   private String startdte;
	   private String enddte;
	   private String task_status;
	   private String task_priority; //추가 
	   private String task_name; //추가
		 */
		task.setPno(gservice.getPnoUsingName(cal.getHolder()));
		task.setProject_no(project_no);
		// insert에서 id는 nextval 써야해서 아무값이나 상관없음
		task.setTask_no(cal.getId());
		task.setTask_name(cal.getTitle());
		task.setTask_content(cal.getContent());
		// cal에서 parent이름 가져오면 task_no로 변경 db연동
		if(cal.getPriority()==1)task.setTask_priority("High");
		else if(cal.getPriority()==2)task.setTask_priority("Medium");
		else if(cal.getPriority()==3)task.setTask_priority("Low");
		System.out.println("parent: " + cal.getParent());
		System.out.println(getTaskNoUsingTaskName(cal.getParent(),project_no));
		//System.out.println(getTaskNoUsingTaskName(cal.getParent(),project_no).getTask_no());
		task.setTask_parent_no(getTaskNoUsingTaskName(cal.getParent(),project_no)==null?1:getTaskNoUsingTaskName(cal.getParent(),project_no).getTask_no());
		task.setStartdte(cal.getStart());
		task.setEnddte(cal.getEnd());
		task.setTask_status("진행");
		
		System.out.println("pno: "+task.getPno());
		System.out.println("project_no: "+task.getProject_no());
		System.out.println("task_no: "+task.getTask_no());
		System.out.println("taskname: "+task.getTask_name());
		System.out.println("taskcontent: "+task.getTask_content());
		System.out.println("priority: "+task.getTask_priority());
		System.out.println("parent_no: "+task.getTask_parent_no());
		System.out.println("start: "+task.getStartdte());
		System.out.println("end: "+task.getEnddte());
		System.out.println("status: "+task.getTask_status());
		
		return task;
	}
	
	public Task getTask(String task_name) {
		Task task = new Task();
		task = dao.getTask(task_name);
		
		return task;
	}
	
	public Task getTaskUsingTaskno(int task_no) {
		Task task = new Task();
		task = dao.getTaskUsingTaskno(task_no);
		
		return task;
	}
	
	public Task getTaskNoUsingTaskName(String task_name,int project_no) {
		HashMap<String,String> hm = new HashMap<String,String>();
		hm.put("task_name", task_name);
		hm.put("project_no", ""+project_no);
		return dao.getTaskNoUsingTaskName(hm);
	}
	
	
	
	
	
	
	
	
	
}
