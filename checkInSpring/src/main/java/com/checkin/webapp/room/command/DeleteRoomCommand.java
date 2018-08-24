package com.checkin.webapp.room.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class DeleteRoomCommand implements RoomCommandInterface {

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
	
	public ModelAndView execute(HttpServletRequest request, int r) {
		System.out.println("execute room......");
		ModelAndView mav = new ModelAndView();
		String folder = request.getSession().getServletContext().getRealPath("/img");
		
		
		//DAO작업
		
		RoomDAOInterface dao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		RoomVO vo = new RoomVO();
		vo = dao.selectOneRoom(r);
		System.out.println("execute room......to_string=="+vo.toString());
		String rimg1 = vo.getRimg1();// /webapp/img/~.png
		String rimg2 = vo.getRimg2();
		String rimg3 = vo.getRimg3();
		

		int cnt = dao.deleteRoom(vo);
		System.out.println("execute room......cnt=="+cnt);				
		if(cnt>0) {
			System.out.println("삭제완료....");
			mav.setViewName("redirect:/master/showMyGuestroomList");
			
			String fileName = getFileName(rimg1);
			if(fileName!=null) deleteFile(folder, fileName);
			
			fileName = getFileName(rimg2);
			if(fileName!=null) deleteFile(folder, fileName);
			
			fileName = getFileName(rimg3);
			if(fileName!=null) deleteFile(folder, fileName);

		}else {
			System.out.println("삭제실패....");
			mav.setViewName("redirect:/master/showMyGuestroomList");
		}
		
		return mav;
	}
	
	public String getFileName(String rimg) {
		String fileName = null;
		String strArr[] = rimg.split("/");
		if(strArr.length >= 4) fileName = strArr[3];
		System.out.println("DeleteRoomCommand.....getFileName .. file="+fileName);
		return fileName;
	}
	
	public void deleteFile(String folder, String fileName) {
	
		if(folder!= null && fileName!=null) {
			File file1 = new File(folder,fileName);
			if(file1.exists()) file1.delete();
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
