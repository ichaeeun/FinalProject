package pms.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
	@Value("${risk_upload}")
	private String risk_upload; 
	@Value("${risk_uploadTmp}")
	private String risk_uploadTmp;
	private int i = 1;
	
	@Autowired(required = false)
	private RiskDao dao;
	
	public ArrayList<RiskBoard> rBoard(){
		return dao.rBoard();
	}
	public ArrayList<RiskBoard> rBoard_request(){
		return dao.rBoard_request();
	}
//	
//	public RiskBoard getBoard(int risk_no) {
//		return dao.getBoard(risk_no);
//	}
	
	public void uptStatus (UptStatus upt_satus) {
		dao.uptStatus(upt_satus);
	}
	public void insertBoard(RiskBoard insert) {
		dao.insertBoard(insert);
		String fname = null;
		File tmpFile = null;
		File orgFile = null;
		System.out.println(risk_upload);
		System.out.println(risk_uploadTmp);
		if(i == 1) {
		      try {
		    	  risk_upload = new String(risk_upload.getBytes("ISO-8859-1"), "UTF-8");
		    	  risk_uploadTmp = new String(risk_uploadTmp.getBytes("ISO-8859-1"), "UTF-8");
		      } catch (UnsupportedEncodingException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      }
		      i++;
		      System.out.println(risk_upload);
		      System.out.println(risk_uploadTmp);
		
		File pathFile = new File(risk_uploadTmp);
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
				tmpFile = new File(risk_uploadTmp+fname);
				try {
					mpf.transferTo(tmpFile);
					orgFile = new File(risk_upload+fname);
					Files.copy(tmpFile.toPath(), orgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
					dao.insertRiskFile(new RiskFile(insert.getRisk_writer(),insert.getRnum(),fname,risk_upload));
					System.out.println(insert.getRnum());
					
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
	
	public RiskBoard getBoard(int risk_no) {
		RiskBoard rBoard = dao.getBoard(risk_no);
		rBoard.setFileInfo(dao.fileInfo(risk_no));
		for(int i = 0; i<dao.fileInfo(risk_no).size(); i++) {
			System.out.println(dao.fileInfo(risk_no).get(i).getFilename());			
		}
		return rBoard;
	}
	

}
