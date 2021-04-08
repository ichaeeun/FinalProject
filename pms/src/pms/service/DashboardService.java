package pms.service;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.DashboardDao;
import pms.dto.Gantt;
import pms.dto.Member;
import pms.dto.Project;
import pms.dto.Task;
import pms.dto.pms_project;
import pms.dto.pms_projectSch;
// pms.service.DashboardService
@Service
public class DashboardService {
	
	@Autowired(required = false)
	private DashboardDao dao;
	
	public Member IsMem(Member member) {
		return dao.IsMem(member);
	}
	// 코드 추가
	/*public ArrayList<pms_project> pms_projectList(pms_projectSch sch){
		if(sch.getProject_name()==null) sch.setProject_name("");
		// 1. 데이터 총건수 할당.
		sch.setCount(dao.totCnt(sch));
		// 2. 화면에서 요청값으로 가져온 pageSize로 총페이지수 처리
		//		1) 초기 화면에 표시될 pageSize를 default로 설정.
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		//		2) 총페이지수 : 올림처리(총건수/페이지크기)
		//				ex) 총건수 17건이면 / 5 ==> 3.4 ==> 4페이지필요
		sch.setPageCount((int)Math.ceil(sch.getCount()/
				(double)sch.getPageSize()));
		// 3. 클릭한 현재 페이지(요청) default를 1로 선언.
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		//		마지막 페이지 블럭에서 next를 클릭한 것에 대한 예외 처리.
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
				
		// start, end 속성을 도출하기 위해서..
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		// # 블럭 처리..
		// 1. 초기 block의 크기 지정 : 5
		sch.setBlockSize(5);
		// 2. blocknum : 현재페이지/블럭의 크기를 올림 처리.
		int blocknum = (int)Math.ceil(
				sch.getCurPage()/(double)sch.getBlockSize());
		// 3. endBlock
		int endBlock = blocknum*sch.getBlockSize();
		//		블럭의 마지막 페이지번호는 총페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock>sch.getPageCount()?
				sch.getPageCount():endBlock);
		// 4. startBlock
		//	이전 블럭의 마지막 페이지 번호+1 이 현재 블럭의 첫번째 페이지번호 
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1); 
		
		return dao.pms_projectList(sch);
		
	}*/
	   public ArrayList<Task> getTask(Project project) {
		      ArrayList<Task> t = new ArrayList<Task>();
		      t = dao.getTask(project);
		      for(int i=0;i<t.size();i++) {
		         System.out.println(t.get(i).getStartdte());
		         System.out.println(t.get(i).getEnddte());
		      }
		      
		      return dao.getTask(project);
		   }
		   
		   public ArrayList<Gantt> getGantt(ArrayList<Task> task) {
		      ArrayList<Gantt> gantt = new ArrayList<Gantt>(); 
		      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		      ArrayList<Integer> duration = new ArrayList<Integer>(); 
		      ArrayList<String> str = new ArrayList<String>();
		      
		      for(int j=0;j<task.size();j++) {
		         try {
		            Date start = df.parse(task.get(j).getStartdte());
		            Date end = df.parse(task.get(j).getEnddte());
		            str.add(df.format(start));
		            long calDateDay = end.getTime() - start.getTime();
		            long calDateDays = calDateDay / (24*60*60*1000);
		            
		            calDateDays = Math.abs(calDateDays);
		            duration.add((int)calDateDays);
		         } catch (ParseException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }
		      }
		      
		      for(int i=0;i<task.size();i++) {
		         Gantt g = new Gantt(task.get(i).getTask_no(),
		               str.get(i),
		               duration.get(i),
		               task.get(i).getTask_content(),
		               0,task.get(i).getTask_no(),
		               task.get(i).getTask_parent_no(),true);
		         
		         gantt.add(g);
		      }
		      
		      return gantt;
		   }
		   
		   public Gantt getGantt(Task task) {
//		      ArrayList<Gantt> gantt = new ArrayList<Gantt>(); 
		      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		      ArrayList<Integer> duration = new ArrayList<Integer>(); 
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
		               task.getTask_content(),
		               0,task.getTask_no(),
		               task.getTask_parent_no(),true);
		         
		      
		      
		      return g;
		   }
		   // ================ 간트 ================================
		}	