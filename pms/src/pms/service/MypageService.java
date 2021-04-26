package pms.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import pms.dao.MypageDao;
import pms.dto.Member;

@Service
public class MypageService {
//  info 에 있는 설정 값이 들어온다. ${upload} ${uploadTmp} 
	
	@Value("${profile}")
	private String profile; 
	@Value("${profileTmp}")
	private String profileTmp; 
	
	@Autowired(required=false)
	private MypageDao dao;
	private int i=1;
	
	 public Member showProfile(int pno) {
//		 Member mem = dao.showProfile(pno);
//		 String imgpath = dao.showProfile(pno).getImgpath().substring(48);
//		 mem.setImgpath(imgpath);
		 return dao.showProfile(pno);
	 }
	 
	 public void updateProfile(Member mem) {
		// 1. 물리적 파일 업로드 
			String fname = null;
			File tmpFile = null; // 임시위치 
			File orgFile = null; // 업로드 위치 
			
//			if(i == 1) {
//			      try {
//			    	  profile = new String(profile.getBytes("ISO-8859-1"), "UTF-8");
//			    	  profileTmp = new String(profileTmp.getBytes("ISO-8859-1"), "UTF-8");
//			      } catch (UnsupportedEncodingException e) {
//			         // TODO Auto-generated catch block
//			         e.printStackTrace();
//			      }
//			      }
//			      
//			      System.out.println(profile);
//			      System.out.println(profileTmp);
//			
			
			File pathFile = new File(profileTmp); //폴더 객체 생성 
			//.listFiles() : 해당 폴더 객체 안에 있는 파일을 가져오기 
			// 임시폴더에 있는 모든 파일을 삭제함으로써 중복예외를 방지한다. 
//			if(pathFile.listFiles()!=null) {
//			for(File f:pathFile.listFiles()) {
//				System.out.println("삭제할파일: "+f.getName());
//				// 단위파일을 삭제처리 
//				f.delete();
//			}
//			}
			
				// 1) 파일명 지정 
				System.out.println(mem.getReport()[0].getOriginalFilename());
				fname = mem.getReport()[0].getOriginalFilename();
				if(i == 1) {
				      try {
				    	  fname = new String(fname.getBytes("ISO-8859-1"), "UTF-8");
				      } catch (UnsupportedEncodingException e) {
				         // TODO Auto-generated catch block
				         e.printStackTrace();
				      }
				      }
				i++;
				// 파일을 등록하지 않았을 때 제외 처리 <input type="file">
				if(fname!=null && !fname.trim().equals("")) {
					// 임시파일 객체 선언(경로 + 파일명)  
					// ps) File 객체는 파일과 폴더를 처리할 수 있다. 
					tmpFile = new File(profileTmp+fname); 
					// MultipartFile ==> File로 변환처리 
					try {
						mem.getReport()[0].transferTo(tmpFile); 
						// io발생 예외 필수 처리 
						// 해당 위치에 파일이 생성됨 
						// 임시위치에서 다운로드할 폴더로 (z01_upload로) 복사 처리 
						orgFile = new File(profile+fname);
						// 복사처리 
						// StandardCopyOption.REPLACE_EXISTING : 동일한 파일명 업로드 시 대체 처리 
						Files.copy(tmpFile.toPath(), orgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
						// 파일명, 업로드위치, 제목 
						// String id, String pass, String name, String email, String imgpath
						System.out.println(profile+fname);
//						dao.updateProfile(new Member(mem.getId(),mem.getPass(),mem.getName(),mem.getEmail(),profile+fname,mem.getPno()));
						dao.updateProfile(new Member(mem.getId(),mem.getPass(),mem.getName(),mem.getEmail(),fname,mem.getPno()));
						
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
					
				}else {
					System.out.println("#######수정전"+mem.getName());
					System.out.println("#######수정전"+mem.getPno());
					dao.updateNoFile(new Member(mem.getId(),mem.getPass(),mem.getName(),mem.getEmail(),mem.getPno()));
				}
	 }
}
