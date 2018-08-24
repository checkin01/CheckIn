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
	

}
