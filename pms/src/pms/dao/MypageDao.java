package pms.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.dto.Comment;
import pms.dto.Member;
import pms.dto.Task;
import pms.dto.TaskFile;
import pms.dto.pms_project;

@Repository
public interface MypageDao {
	public void updateProfile(Member mem);  // 멤버 프로필 변경 
	public void updateNoFile(Member mem);
	public Member showProfile(int pno);
}
