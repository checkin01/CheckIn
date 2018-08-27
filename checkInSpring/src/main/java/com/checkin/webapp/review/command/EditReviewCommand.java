package com.checkin.webapp.review.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class EditReviewCommand implements ReviewCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo,MultipartFile file1) {
		String folder = request.getSession().getServletContext().getRealPath("/img");
		
		ModelAndView mav = new ModelAndView();
		//쿼리 수정
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		String oldFileName = dao.selectOneReview(vo).getVimg1();
		String newFileName = inputFile(file1, folder);		
		if(newFileName!=null) vo.setVimg1("/webapp/img/"+newFileName);
		// dao 작업
		int cnt = dao.updateReview(vo);
		if(cnt > 0) {
			deleteFile(folder,oldFileName);
			System.out.println("EditReviewCommand..deleteFile().."+oldFileName+"파일 삭제 성공");
			mav.setViewName("redirect:/main/mypage/bookingList");
		}else {
			System.out.println("EditReviewCommand..deleteFile().."+newFileName+"파일 삭제 성공");
			deleteFile(folder,newFileName);
			mav.setViewName("redirect:/main/mypage/bookingList");
		}
		//파일 원래 이름 알아 낸 후 재 등록 수행
		
		return mav;
	}
	

	public void deleteFile(String folder, String filename) {
		File file = new File(folder, filename);
		if (file.exists()) {
			file.delete();
			
		}
	}
	
	public String inputFile(MultipartFile file, String folder) {
	     
	      System.out.println("folder=" + folder);
	      String newFileName = null;

	      try {
	         if (file != null) {
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
