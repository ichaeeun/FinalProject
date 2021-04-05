package pms.dao;

import org.springframework.stereotype.Repository;

import pms.dto.Task;

@Repository
public interface TaskDetailDao {
	public Task taskDetail(int task_no);
}
