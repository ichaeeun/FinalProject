package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Comment;
import pms.dto.Task;

@Repository
public interface TaskDetailDao {
	public Task taskDetail(int task_no); // 태스크 상세 조회 
	public ArrayList<Task> subtaskList(int task_no); // 태스크 내에서 서브태스크 조회 
	public int taskcurrval();
	
	public void insertSubtask(Task t); // 서브태스크 추가 
	public void updateTask(Task t); // 태스크 수정 
	public void updateSub(Task t);
	
	public ArrayList<Task> showMember(int task_no); // 태스크 내에서 추가 시 해당태스크의 프로젝트 참여중인 멤버 select 박스 
	public ArrayList<Comment> commentList(int task_no);
	public void insertComment(Comment com);
	
	public void deleteSub(int task_no); // 서브태스크 삭제 
	public void deleteTask(int task_no); // 태스크 삭제 
	public void deletecomm(int comment_no);// 커멘트 삭제 
	
	public void requestApp(int task_no); // 태스크 승인 요청 
	public void approval(int task_no); // 태스크 완료 승인 .
	
	public void statusToDone(int task_no); // 완료로 상태 변경 
	public void statusFromDone(int task_no); // 진행으로 상태 변경 
}
