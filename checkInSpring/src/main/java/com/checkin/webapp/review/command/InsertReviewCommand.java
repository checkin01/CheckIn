package com.checkin.webapp.review.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class InsertReviewCommand implements ReviewCommandInterface {

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
	
	public ModelAndView execute(HttpServletRequest request,ReviewVO vo , MultipartFile file1) {
		String folder = request.getSession().getServletContext().getRealPath("/img");
		
		
		ModelAndView mav = new ModelAndView();
		
		String newFileName = inputFile(folder, file1);
		if(newFileName!=null)
			vo.setVimg1("/webapp/img/"+newFileName);
		System.out.println("InsertReview..."+vo.toString());
		
		//dao
		//file 넣는 작업
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		int result = dao.insertReview(vo);
		if(result > 0) {
			//updateVRecordBooking
			//dao.updateVRecordBooking(vo);
			
			mav.setViewName("redirect:/master/mypage/bookList");
		}else {
			if(folder!=null && newFileName!= null) {
				File file = new File(folder,newFileName);
				if(file.exists())file.delete();
			}
			
		}
		
		mav.setViewName("redirect:/main/mypage/bookingList");
		return mav;
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

	public String inputFile( String folder,MultipartFile file) {
		
		String newFileName = null;

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
				System.out.println("EditAccoCommand.. file null...");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return newFileName;
	}

}
