package pms.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.GanttDao;
import pms.dto.Gantt;
import pms.dto.ProjectAdd;
import pms.dto.Task;
import pms.dto.pms_project;

@Service
public class GanttService {
	
	@Autowired(required = false)
	private GanttDao dao;
	
	
	
	// ================ 간트 ================================
	public ArrayList<Task> getTask(pms_project project) {
		ArrayList<Task> t = new ArrayList<Task>();
		t = dao.getTask(project);
		/*
		for(int i=0;i<t.size();i++) {
			System.out.println(t.get(i).getStart());
			System.out.println(t.get(i).getEnd());
		}
		*/
		return dao.getTask(project);
	}
	
	public ArrayList<Gantt> getGantt(ArrayList<Task> task) {
		ArrayList<Gantt> gantt = new ArrayList<Gantt>(); 
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date d = df.parse(day1);
		//String formattedTime = output.format(d);
		//d = df.parse(day2);
		//String formattedTime2 = output.format(d);
		
		// 기한 저장
		ArrayList<Integer> duration = new ArrayList<Integer>(); 
		// 시작일 저장
		ArrayList<String> startarr = new ArrayList<String>();
		// 마감일 저장
		ArrayList<String> endarr = new ArrayList<String>();
		
		for(int j=0;j<task.size();j++) {
			try {
				Date start = df.parse(task.get(j).getStartdte());
				Date end = df.parse(task.get(j).getEnddte());
				
				String formattedTime1 = dateFormat2.format(start);
				String formattedTime2 = dateFormat2.format(end);
				
				startarr.add(formattedTime1);
				endarr.add(formattedTime2);
				
				long calDateDay = end.getTime() - start.getTime();
				long calDateDays = calDateDay / (24*60*60*1000);
				
				calDateDays = Math.abs(calDateDays);
				duration.add((int)calDateDays);
				/*
				System.out.println("duration: " + (int)calDateDays);
				System.out.println("start_date: " + formattedTime1);
				System.out.println("end_date: " + formattedTime2);
				*/
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		for(int i=0;i<task.size();i++) {
			Gantt g = new Gantt(task.get(i).getTask_no(),
					startarr.get(i),
					endarr.get(i), task.get(i).getTask_name(),
					task.get(i).getTask_content(),
					task.get(i).getTask_priority().equals("High")?1:
						task.get(i).getTask_priority().equals("Medium")?2:3,
					0,task.get(i).getTask_no(),
					task.get(i).getTask_parent_no(),getName(task.get(i).getPno()));
			//System.out.println(getName(task.get(i).getPno()));
			gantt.add(g);
		}
		
		return gantt;
	}
	// project_no으로 project 객체 가져오기
	public pms_project getProject(int project_no) {
		return dao.getProject(project_no);
	}
	
	// 서비스 한개로 json 파일 생성, 프로젝트번호는 세션값임
	public String list(int project_no) {
		// 프로젝트 번호로 프로젝트 객체 가져오는 메서드
		pms_project pp = getProject(project_no);
		// 프로젝트 정보로 태스크 리스트 가져오기
		ArrayList<Task> task = new ArrayList<Task>(); 
		task = getTask(pp);
		// 태스크 => 간트 변형
		ArrayList<Gantt> gantt = new ArrayList<Gantt>();
		gantt = getGantt(task);
		// json 데이터 변경( 파일 생성 )
		return jsonadd(gantt,pp);
		
	}
	
	public String jsonadd(ArrayList<Gantt> gantt, pms_project project) {
		JSONObject g = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		// project 가 제일 위로 들어가야함
		// project => gantt
		//g.put("id", project.getProject_no());
		g.put("id", 1);
		// 날짜 형식 변경
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date start = df.parse(project.getStart1());
			Date end = df.parse(project.getEnd1());
			String start_date = dateFormat2.format(start);
			String end_date = dateFormat2.format(end);
			g.put("start_date", start_date);
			g.put("end_date", end_date);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//g.put("duration", 20); // end - start
		g.put("title", project.getProject_name());
		g.put("text", project.getProject_content());
		g.put("progress", 0);
		g.put("sortorder", 1);
		g.put("parent", 0);
		g.put("open", true);
		g.put("priority",1);
		// pno 를 이용해 이름 가져오기
		g.put("holder", getName(project.getPm_pno()));
		
		array.add(g);
		g = new JSONObject();
		// task => gantt
		for(int index=0;index<gantt.size();index++) {
			g.put("id", gantt.get(index).getId());
			g.put("start_date", gantt.get(index).getStart_date());
			g.put("end_date", gantt.get(index).getEnd_date());
			g.put("title", gantt.get(index).getTitle());
			//g.put("duration", gantt.get(index).getDuration());
			g.put("text", gantt.get(index).getText());
			g.put("progress", gantt.get(index).getProgress());
			g.put("sortorder", gantt.get(index).getSortorder());
			g.put("parent", gantt.get(index).getParent());
			g.put("open", true);
			g.put("priority", gantt.get(index).getPriority());
			g.put("holder", gantt.get(index).getHolder());
			System.out.println("gantt"+index+": "+g.toJSONString());
			array.add(g);
			g = new JSONObject();
		}
		result.put("data", array);
		
		String json = result.toJSONString();
		//System.out.println(json);
		// 파일 생성
		
		// 경로 변경 필요
		/*
		String FilePath = "C:\\Users\\주인\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json";
		File file = new File("C:\\Users\\주인\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json");
		
		//String FilePath = "C:\\Users\\user\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json";
		//File file = new File("C:\\Users\\user\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json");
		
		file.delete();
		try {
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		//UpdateFile(FilePath,json);
		
		return json;
	}
	// ================ 간트 ================================
	
	// 파일 생성
	public static void CreateFile(String FilePath) {
		System.out.println(FilePath);
		
		try {
			int nLast = FilePath.lastIndexOf("\\");
			String strDir = FilePath.substring(0,nLast);
			String strFile = FilePath.substring(nLast+1,FilePath.length());
			
			File dirFolder = new File(strDir);
			dirFolder.mkdir();
			File f= new File(dirFolder,strFile);
			f.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static String ReadFileText(File file) {
		String strText = "";
		int nBuffer;
		
		try {
			BufferedReader buffRead = new BufferedReader(new FileReader(file));
			try {
				while((nBuffer = buffRead.read()) != -1) {
					strText += (char)nBuffer;
				}
				buffRead.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return strText;
	}
	
	private static void UpdateFile(String FilePath, String Text) {
		
		try {
			File f = new File(FilePath);
			if(f.exists() == false) {
				CreateFile(FilePath);
			}
			
			String fileText = ReadFileText(f);
			BufferedWriter buffWrite = new BufferedWriter(new FileWriter(f));
			Text = fileText + "\r\n" + Text;
			
			buffWrite.write(Text,0,Text.length());
			
			buffWrite.flush();
			buffWrite.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// pno로 이름 가져오기
	public String getName(int pno) {
		return dao.getName(pno);
	}
	
	// gantt -> task
	public Task insert_gantttotask(Gantt gantt, int project_no) {
		Task task = new Task();
		int pno = 9001;
		//pno = dao.getMaxPno();
		task.setPno(pno); 	// 미정
		task.setTask_no(0);	// mapper에서 task_no_seq로 처리

		task.setProject_no(project_no);
		task.setTask_name(gantt.getTitle());
		task.setTask_content(gantt.getText());
		if(gantt.getPriority() == 1) task.setTask_priority("High");
		if(gantt.getPriority() == 2) task.setTask_priority("Medium");
		if(gantt.getPriority() == 3) task.setTask_priority("Low");
		task.setTask_parent_no(gantt.getParent());
		task.setStartdte(gantt.getStart_date());
		task.setEnddte(gantt.getEnd_date());
		task.setTask_status("진행");
		
		return task;
	}
	
	public pms_project upt_gantttoproject(Gantt g,int project_no) {
		// project_no으로 project 정보 가져오기
		pms_project pp = getProject(project_no);
		// gantt 화면에서 변경된 정보만 set변경
		pp.setProject_name(g.getTitle());
		pp.setProject_content(g.getText());
		pp.setStart1(g.getStart_date());
		pp.setEnd1(g.getEnd_date());
		
		return pp;
	}
	
	public void uptProject(Gantt g, int project_no) {
		pms_project pp = upt_gantttoproject(g, project_no);
		dao.uptProject(pp);
	}
	
	public Task update_gantttotask(Gantt gantt,int project_no) {
		Task task = new Task();
		int pno = 0;
		// view 단에서 holder 입력 시 자동으로 id도 셋팅되게
		// holder가 입력되지 않았다면 pno,  
		/*
		if(gantt.getHolder().equals("") || gantt.getHolder() == null) {
			pno = dao.getMaxPno();
			task.setPno(pno+1); 	// 미정
			task.setTask_no(0);	// mapper에서 task_no_seq로 처리
		} 
		else {
			pno = getPnoUsingName(gantt.getHolder());
			task.setPno(pno);
			task.setTask_no(gantt.getId());
		}
		*/
		if(gantt.getHolder().equals("") || gantt.getHolder() == null) {
			//pno = dao.getMaxPno();
			pno = 9000;
			task.setPno(pno+1); 	// 미정
		} 
		else {
			// holder 가 없는 사람이라면 , 동명이인이라면 => 할당된 사람만 select - option으로 고르게끔
			pno = getPnoUsingName(gantt.getHolder());
			task.setPno(pno);
		}
		
		task.setTask_no(gantt.getId());
		task.setProject_no(project_no);
		task.setTask_name(gantt.getTitle());
		task.setTask_content(gantt.getText());
		if(gantt.getPriority() == 1) task.setTask_priority("High");
		if(gantt.getPriority() == 2) task.setTask_priority("Medium");
		if(gantt.getPriority() == 3) task.setTask_priority("Low");
		task.setTask_parent_no(gantt.getParent());
		task.setStartdte(gantt.getStart_date());
		task.setEnddte(gantt.getEnd_date());
		task.setTask_status("진행");
		
		return task;
	}
	
	// 새로운 업무 생성
	public void insertTask(Task task) {
		dao.insertTask(task);
	}
	
	// 이름으로 pno 가져오기
	public int getPnoUsingName(String name) {
		return dao.getPnoUsingName(name);
	}
	
	public int getMaxpno() {
		return dao.getMaxPno();
	}
	
	public void updateTask(Task task) {
		//task.setStartdte(SwitchDate(task.getStartdte()));
		//task.setEnddte(SwitchDate(task.getEnddte()));
		dao.updateTask(task);
	}

	public void deleteTask(int task_no) {
		// parent_no == task_no 인 애들 다 삭제 메서드
		HashMap<String,Integer> hm = new HashMap();
		hm.put("task_no", task_no);
		hm.put("parent_no", task_no);
		dao.deleteTask(hm);
	}
	
	public String SwitchDate(String before) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String result = "";
		Date after;
		try {
			after = df2.parse(before);
			String formattedTime1 = df.format(after);
			result = formattedTime1;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("result: " + result);
		return result;
	}
	
	public ArrayList<String> getProjectAdd(int project_no){
		ArrayList<ProjectAdd> proadd = new ArrayList<ProjectAdd>();
		ArrayList<String> names = new ArrayList<String>();
		proadd = dao.getProjectAdd(project_no);
		
		for(int i=0;i<proadd.size();i++) {
			String name = dao.getName(proadd.get(i).getPno());
			names.add(name);
		}
		return names;
	}
	
}
