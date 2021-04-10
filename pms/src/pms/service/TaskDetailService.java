package pms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.TaskDetailDao;
import pms.dto.Comment;
import pms.dto.Task;

@Service
public class TaskDetailService {
	
	@Autowired(required=false)
	private TaskDetailDao dao;
	
	public Task taskDetail(int task_no) {
		return dao.taskDetail(task_no);
	}
	
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
}
