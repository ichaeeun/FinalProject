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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.GanttDao;
import pms.dto.Gantt;
import pms.dto.Project;
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
				
				System.out.println("duration: " + (int)calDateDays);
				System.out.println("start_date: " + formattedTime1);
				System.out.println("end_date: " + formattedTime2);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		for(int i=0;i<task.size();i++) {
			Gantt g = new Gantt(task.get(i).getTask_no(),
					startarr.get(i),
					duration.get(i),
					task.get(i).getTask_content(),task.get(i).getTask_priority(),
					0,task.get(i).getTask_no(),
					task.get(i).getTask_parent_no());
			
			gantt.add(g);
		}
		
		return gantt;
	}
	
	public Gantt getGantt(Task task) {
//		ArrayList<Gantt> gantt = new ArrayList<Gantt>(); 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		ArrayList<Integer> duration = new ArrayList<Integer>(); 
		int duration = 0;
			try {
				System.out.println(task.getStartdte());
				System.out.println(task.getEnddte());
				Date start = df.parse(task.getStartdte());
				Date end = df.parse(task.getEnddte());
				
				long calDateDay = end.getTime() - start.getTime();
				long calDateDays = calDateDay / (24*60*60*1000);
				
				calDateDays = Math.abs(calDateDays);
				duration = (int)calDateDays;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Gantt g = new Gantt(task.getTask_no(),
					task.getStartdte(),
					duration,
					task.getTask_content(),task.getTask_priority(),
					0,task.getTask_no(),
					task.getTask_parent_no());
			
		
		
		return g;
	}
	// ================ 간트 ================================
	public String jsonadd(ArrayList<Gantt> gantt, pms_project project) {
		JSONObject g = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		// project 가 제일 위로 들어가야함
		// project => gantt
		g.put("id", 1);
		g.put("start_date", "2021-04-04 00:00:00");
		g.put("duration", 20); // end - start
		g.put("text", project.getProject_content());
		g.put("progress", 0);
		g.put("sortorder", 1);
		g.put("parent", 0);
		g.put("open", true);
		//g.put("priority", "High");
		
		array.add(g);
		g = new JSONObject();
		// task => gantt
		for(int index=0;index<gantt.size();index++) {
			g.put("id", gantt.get(index).getId());
			g.put("start_date", gantt.get(index).getStart_date());
			g.put("duration", gantt.get(index).getDuration());
			g.put("text", gantt.get(index).getText());
			g.put("progress", gantt.get(index).getProgress());
			g.put("sortorder", gantt.get(index).getSortorder());
			g.put("parent", gantt.get(index).getParent());
			g.put("open", true);
			//g.put("priority", gantt.get(index).getPriority());
			System.out.println("gantt"+index+": "+g.toJSONString());
			array.add(g);
			g = new JSONObject();
		}
		result.put("data", array);
		
		String json = result.toJSONString();
		System.out.println(json);
		// 파일 생성
		
		// 경로 변경 필요
		String FilePath = "C:\\Users\\주인\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json";
		File file = new File("C:\\Users\\주인\\git\\FinalProject\\pms\\WebContent\\Admin\\dist\\assets\\data\\data2.json");
		file.delete();
		try {
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UpdateFile(FilePath,json);
		
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
}
