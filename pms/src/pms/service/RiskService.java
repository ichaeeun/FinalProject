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

import pms.dao.RiskDao;
import pms.dto.RiskBoard;
import pms.dto.RiskFile;
import pms.dto.UptStatus;

@Service
public class RiskService {
	@Value("${task_upload}")
	private String upload; 
	@Value("${task_uploadTmp}")
	private String uploadTmp;
	
	@Autowired(required = false)
	private RiskDao dao;
	
	public ArrayList<RiskBoard> rBoard(){
		return dao.rBoard();
	}
	public ArrayList<RiskBoard> rBoard_request(){
		return dao.rBoard_request();
	}
	
	public RiskBoard getBoard(int risk_no) {
		return dao.getBoard(risk_no);
	}
	
	public void uptStatus (UptStatus upt_satus) {
		dao.uptStatus(upt_satus);
	}
	public void insertBoard(RiskBoard insert) {
		dao.insertBoard(insert);
		String fname = null;
		File tmpFile = null;
		File orgFile = null;
		
		File pathFile = new File(uploadTmp);
		if(pathFile.listFiles()!=null) {
			for(File f:pathFile.listFiles()) {
				System.out.println("삭제할 파일:" + f.getName());
				f.delete();
			}
		}
		for(MultipartFile mpf : insert.getReport()) {
			System.out.println(mpf.getOriginalFilename());
			fname = mpf.getOriginalFilename();
			if(fname!=null&&!fname.trim().equals("")) {
				tmpFile = new File(uploadTmp+fname);
				try {
					mpf.transferTo(tmpFile);
					orgFile = new File(upload+fname);
					Files.copy(tmpFile.toPath(), orgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
					dao.insertRiskFile(new RiskFile(insert.getRisk_writer(),insert.getRnum(),fname,upload));
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					System.out.println("상태값 에러: "+e.getMessage());
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("파일 생성 에러 :" +e.getMessage());
				}catch(Exception e) {
					System.out.println("기타 에러 : "+e.getMessage());
				}finally {
					System.out.println("종료");
				}
			}
		}
	}

}
