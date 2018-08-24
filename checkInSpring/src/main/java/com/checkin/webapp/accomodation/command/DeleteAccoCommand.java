package com.checkin.webapp.accomodation.command;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.room.model.RoomDAOInterface;
import com.checkin.webapp.room.model.RoomVO;

public class DeleteAccoCommand implements AccomodationCommandInterface {
	
	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("DeleteAccoCommand");
		String folder = request.getSession().getServletContext().getRealPath("/img");
		String mid = (String)request.getSession().getAttribute("mid");
		
		deleteAccomodation(mid,folder);
		mav.setViewName("redirect:/master/first");
		return mav;
	}
	
	public void deleteAccomodation(String mid,String folder) {
		AccomodationDAOInterface accoDao= Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		AccomodationVO accomodation = getAccomodation(mid,accoDao);
		//query 작업
		int result = accoDao.deleteAccomodation(accomodation);
		if(result>0) {
			deleteAccomodationImgFiles(accomodation,folder );
			deleteRooms(mid,folder);
		}	
	}
	
	public AccomodationVO getAccomodation(String mid,AccomodationDAOInterface dao) {
		AccomodationVO accomodation = new AccomodationVO();
		 accomodation.setMid(mid);
		 return dao.selectOneRecord(accomodation);
	}

	//Accomodation image file 삭제
	public void deleteAccomodationImgFiles(AccomodationVO vo,String folder){
		List<String> list = new ArrayList<String>();
		String aimg = null;
		String filename = null;
		//file name 얻어와서 deleteFile 수행
		aimg = vo.getAimg1();
		filename = getFileName(aimg);
		deleteFile(filename,folder);
		
		aimg = vo.getAimg2();
		filename = getFileName(aimg);
		deleteFile(filename,folder);
		
		aimg = vo.getAimg3();
		filename = getFileName(aimg);
		deleteFile(filename,folder);
	}
	
	public void deleteRooms(String mid, String folder) {
		//int알아내기
		RoomDAOInterface roomDao = Constants.sqlSession.getMapper(RoomDAOInterface.class);
		
		List<RoomVO> rooms = getRooms(mid,roomDao);
		
		deleteRoomsImgFiles(rooms,folder);
		
		
	}
	
	public List<RoomVO> getRooms(String mid,RoomDAOInterface dao) {
		RoomVO vo = new RoomVO();
		vo.setMid(mid);
		//dao쓰기
		return dao.selectAllRoomList(vo);
	}

	
	public void deleteRoomsImgFiles(List<RoomVO> rooms ,String folder){
		String rimg = null;
		String filename = null;
		for(RoomVO room:rooms) {
			rimg = room.getRimg1();
			filename = getFileName(rimg);
			deleteFile(filename,folder);
			
			rimg = room.getRimg2();
			filename = getFileName(rimg);
			deleteFile(filename,folder);
			
			rimg = room.getRimg3();
			filename = getFileName(rimg);
			deleteFile(filename,folder);
		}
	}
	
	public String getFileName(String rimg) {
		String fileName = null;
		if(rimg!=null && rimg != "") {
			String strArr[] = rimg.split("/");
			if(strArr.length >= 4) fileName = strArr[3];
			System.out.println("DeleteAccoCommand.....getFileName .. file="+fileName);
		}
		return fileName;
	}
	
	public void deleteFile(String folder, String fileName) {
		if(folder!= null && fileName!=null) {
			File file1 = new File(folder,fileName);
			if(file1.exists()) file1.delete();
		}
	}
	
 	
	

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		
		return null;
	}

}
