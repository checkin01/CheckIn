package com.checkin.webapp.accomodation.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class ViewAccoCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		System.out.println("GetAccoCommand.. in");
		ModelAndView mav = new ModelAndView();
		
		//session 처리
		String mid = getMidToSession(request);
		if(mid != null && mid != "") {
			System.out.println("GetAccoCommand.."+mid);
		
			//dao처리
			AccomodationVO vo = excuteDAO(mid);
			if(vo==null) {
				System.out.println("ViewAccomodation.. 등록된 숙소 정보가 존재 하지 않습니다.");
				mav.setViewName("master/first");
			
			}else {
				mav.addObject("accoVO", vo);
				mav.setViewName("master/accomodation/manageAccomodation");
			}
		}else {
			mav.setViewName("redirect:/main/login");
		}
		
		
		return mav;
	}
	
	public String getMidToSession(HttpServletRequest request) {
		return (String)request.getSession().getAttribute("mid");
	}
	
	public AccomodationVO excuteDAO(String mid) {
		AccomodationVO vo = new AccomodationVO();
		vo.setMid(mid);
	
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		System.out.println("ViewAccomodationDAO..excuteDAO.."+vo.toString());
		return dao.selectOneRecord(vo);

	}
}
