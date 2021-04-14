package pms.service;

import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.dao.TaskDetailDao;
import pms.dto.Comment;
import pms.dto.Task;
import pms.dto.TaskFile;

@Service
public class TaskDetailService {
//  info 에 있는 설정 값이 들어온다. ${upload} ${uploadTmp} 
	@Value("${task_upload}")
	private String upload; 
	@Value("${task_uploadTmp}")
	private String uploadTmp; 
	
	@Autowired(required=false)
	private TaskDetailDao dao;
	
	public Task taskDetail(int task_no) {
		Task task = dao.taskDetail(task_no);
		task.setFileInfo(dao.getTaskFile(task_no));
		return task;
	}
	public ArrayList<TaskFile> taskFileList(int task_no){
		return dao.taskFileList(task_no);
	}; 
	public ArrayList<Task> subtaskList(int task_no){
		return dao.subtaskList(task_no);
	};
	
	public int taskcurrval() {
		return dao.taskcurrval();
	}
	
	public void insertSubtask(Task t) {
		dao.insertSubtask(t);
	}
	
	public void updateTask(Task t) {
		dao.updateTask(t);
	}
	
	public void updateSub(Task t) {
		dao.updateSub(t);
	}
	
	public ArrayList<Task> showMember(int task_no){
		return dao.showMember(task_no);
	}
	
	public ArrayList<Comment> commentList(int task_no){
		return dao.commentList(task_no);
	}
	
	public void insertComment(Comment com) {
		dao.insertComment(com);
	}
	
	public void deleteSub(int task_no) {
		dao.deleteSub(task_no);
	}
	
	public void deleteTask(int task_no) {
		dao.deleteTask(task_no);
	}; // 태스크 삭제 
	
	public void deletecomm(int task_no) {
		dao.deletecomm(task_no);
	}
	
	public void requestApp(int task_no) { //태스크 승인 요청 
		dao.requestApp(task_no);
	}
	
	public void approval(int task_no) { // 태스크 완료 승인 .
		dao.approval(task_no);
	}
	
	public void statusToDone(int task_no) { // 완료로 상태 변경 
		dao.statusToDone(task_no);
	}; 
	public void statusFromDone(int task_no) { // 진행으로 상태 변경 
		dao.statusFromDone(task_no);
	}; 
	
	public void insertTaskFile(TaskFile tf) { // 파일업로드
		// 1. 물리적 파일 업로드 
				String fname = null;
				File tmpFile = null; // 임시위치 
				File orgFile = null; // 업로드 위치 
				
				File pathFile = new File(uploadTmp); //폴더 객체 생성 
				//.listFiles() : 해당 폴더 객체 안에 있는 파일을 가져오기 
				// 임시폴더에 있는 모든 파일을 삭제함으로써 중복예외를 방지한다. 
				if(pathFile.listFiles()!=null) {
				for(File f:pathFile.listFiles()) {
					System.out.println("삭제할파일: "+f.getName());
					// 단위파일을 삭제처리 
					f.delete();
				}
				}
				
				// # 다중 파일 처리 / 반복문 수행 
				for(MultipartFile mpf:tf.getReport()) {
					// 1) 파일명 지정 
					System.out.println(mpf.getOriginalFilename());
					fname = mpf.getOriginalFilename();
					// 파일을 등록하지 않았을 때 제외 처리 <input type="file">
					if(fname!=null && !fname.trim().equals("")) {
						// 임시파일 객체 선언(경로 + 파일명)  
						// ps) File 객체는 파일과 폴더를 처리할 수 있다. 
						tmpFile = new File(uploadTmp+fname); 
						// MultipartFile ==> File로 변환처리 
						try {
							mpf.transferTo(tmpFile); 
							// io발생 예외 필수 처리 
							// 해당 위치에 파일이 생성됨 
							// 임시위치에서 다운로드할 폴더로 (z01_upload로) 복사 처리 
							orgFile = new File(upload+fname);
								
							
							// 복사처리 
							// StandardCopyOption.REPLACE_EXISTING : 동일한 파일명 업로드 시 대체 처리 
							Files.copy(tmpFile.toPath(), orgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
							// 파일명, 업로드위치, 제목 
							dao.insertTaskFile(new TaskFile(tf.getName(),tf.getTask_no(),fname,upload));
							
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							System.out.println("상태값 에러: "+e.getMessage());
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							System.out.println("파일 생성 에러: "+e.getMessage());
						} catch(Exception e) {
							System.out.println("기타에러: "+e.getMessage());
						} finally{
							System.out.println("종료");
						}
						
					}
				}
	}; 
}
