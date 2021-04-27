package pms.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<RiskBoard> rBoard(int project_no){
		return dao.rBoard(project_no);
	}
	public ArrayList<RiskBoard> rBoardAll(){
		return dao.rBoardAll();
	}
	public ArrayList<RiskBoard> rBoard_requestwk(String risk_writer){
		return dao.rBoard_requestwk(risk_writer);
	}
	
	public ArrayList<RiskBoard> rBoard_request(int project_no){
		return dao.rBoard_request(project_no);
	}
//	
//	public RiskBoard getBoard(int risk_no) {
//		return dao.getBoard(risk_no);
//	}
	
	public void uptStatus (UptStatus upt_satus) {
		dao.uptStatus(upt_satus);
	}
	public void insertBoard(int project_no, RiskBoard insert) {
		insert.setProject_no(project_no);
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
			System.out.println("파일이름@@@@@@@"+fname);
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
		System.out.println(rBoard.getFileInfo());
		for(int i = 0; i<dao.fileInfo(risk_no).size(); i++) {
			System.out.println(dao.fileInfo(risk_no).get(i).getFilename());			
		}
		return rBoard;
	}
	
	public void updateRisk(RiskBoard upt) {
		int no = upt.getRisk_no();
		if(upt.getFnames()!=null&&upt.getFnames().length>0) {
			String fname = null;
			String orgFname = null;
			File tmpFile = null;
			File orgFile = null;
			MultipartFile mpf = null;

			File pathFile = new File(risk_uploadTmp);
			for(File f : pathFile.listFiles()) {
				System.out.println("삭제할 파일 : "+f.getName());
				f.delete();
			}
			for(int idx=0; idx<upt.getReport().length; idx++) {
				mpf = upt.getReport()[idx];
				fname = mpf.getOriginalFilename();
				orgFname = upt.getFnames()[idx];
				if(fname != null && !fname.trim().equals("")) {
					tmpFile = new File(risk_uploadTmp+orgFname);
					if(tmpFile.exists()) {
						tmpFile.delete();
					}
					orgFile = new File(risk_upload+orgFname);
					if(orgFile.exists()) {
						orgFile.delete();
					}
					tmpFile = new File(risk_uploadTmp+fname);
					orgFile = new File(risk_upload+fname);
					try {
						mpf.transferTo(tmpFile);
						
						Files.copy(tmpFile.toPath(), orgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 상태 에러 : " + e.getMessage());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 파일 에러 : " + e.getMessage());
					} catch(Exception e) {
						System.out.println("# 기타 에러 : " + e.getMessage());
					}
					HashMap<String, String> hs = new HashMap<String, String>();
					hs.put("no", ""+no);
					hs.put("fname", fname);
					hs.put("orgFname", upt.getFnames()[idx]);
					dao.updateFile(hs);
					
				}
			}
			
		}
		dao.updateRisk(upt);
	}
	
	public void deleteRisk(int risk_no) {
		dao.deleteRisk(risk_no);
	}
	

}
