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
	
	public ArrayList<Comment> commentList(){
		return dao.commentList();
	}
	
	public void insertComment(Comment com) {
		dao.insertComment(com);
	}
	
}