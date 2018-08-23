package com.checkin.webapp.room.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class UpdateRoomOkCommand implements RoomCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RoomVO executeVo(HttpServletRequest request, RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView execute(HttpServletRequest request, RoomVO vo,MultipartFile file1, MultipartFile file2, MultipartFile file3) {
		ModelAndView mav = new ModelAndView();
		String folder = request.getSession().getServletContext().getRealPath("/img");
		String newFileName1=null;
		String newFileName2=null;
		String newFileName3=null;
		try {
			
		newFileName1 = inputFile(file1, folder);		
		if(newFileName1!=null) vo.setRimg1("/webapp/img/"+newFileName1);
		
		newFileName2 = inputFile(file2, folder);
		if(newFileName2!=null) vo.setRimg2("/webapp/img/"+newFileName2);
		
		newFileName3 = inputFile(file3, folder);
		if(newFileName3!=null) vo.setRimg3("/webapp/img/"+newFileName3);
		
		//DAO작업
		System.out.println("EditRoom..before executing dao" + vo.toString());
		System.out.println("EditRoom.. dao.. execute...");

		RoomDAOInterface dao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		
		int cnt = dao.updateRoom(vo);
		 System.out.println("updateRoom.." + vo.toString());
		 
		
		if(cnt>0) {
			mav.setViewName("redirect:/master/showMyGuestroomList");
		}else {
			System.out.println("룸추가 실패...");
			mav.setViewName("redirect:/master/modifyGuestroomInfo");
		}
		}catch(Exception e) {
			System.out.println("updateRoomOkCommand.. error");
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			mav.setViewName("redirect:/error");
		}
		return mav;
	}
	 
	
	public void deleteFile(String folder, String filename) {
		File file = new File(folder, filename);

		if (file.exists()) {
			file.delete();
			System.out.println("UpdateRoomOkCommand..deleteFile()..파일 삭제 성공");
		}

	}
	
	
		public String inputFile(MultipartFile file, String folder) {
	     
	      System.out.println("folder=" + folder);
	      String newFileName = null;
	      // String argName2 = file2.getName();
	      // String argName3 = file3.getName();

	      try {
	         if (file != null) {
	            //String argName1 = file1.getName(); // path를 포함한 이름 구한다.
	            String orgFilename = file.getOriginalFilename();
	            if (!orgFilename.isEmpty()) {
	               // 파일명이 존재하면
	               // 파일이 업로드 될 폴데에 존재하는지 확인
	               newFileName = getFileNewName(folder,orgFilename);
	               file.transferTo(new File(folder,newFileName));
	               }
	         } else {
	            System.out.println("UpdateRoom.. file null...");
	         }

	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return newFileName;
	   }
	

	   public String getFileNewName(String folder,String orgFileName ) {
	      String newFileName = orgFileName;
	      File fCheck = new File(folder, orgFileName);
	      int cnt = 1; // 파일명에 붙일 번호

	      while (fCheck.exists()) {// 파일이 존재하는 지 확인 : 있으면 true, 없으면 false
	         int idx = orgFileName.lastIndexOf(".");// 마지막 .의 위치를 구하여 파일명과 확장자를 구한다.
	         // 파일명
	         String firstFile = orgFileName.substring(0, idx);
	         // 확장자
	         String lastFile = orgFileName.substring(idx + 1);
	         fCheck = new File(folder, firstFile + cnt + "." + lastFile);
	         if (!fCheck.exists()) {
	            newFileName = fCheck.getName();
	            break;
	         }
	      cnt++;
	      }
	      return newFileName;
	   }

	  
	
	
	
}
