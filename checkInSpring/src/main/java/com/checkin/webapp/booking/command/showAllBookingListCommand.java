package com.checkin.webapp.booking.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.BookingVO;

public class ShowAllBookingListCommand {
	public ModelAndView execute(HttpServletRequest request, BookingVO vo) {
		
		//session에서 mid 가져오기		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		System.out.println("mid:"+mid);
		
		//mid로 bookingList 조회
		BookingDAOInterface dao = Constants.sqlSession.getMapper(BookingDAOInterface.class);				
		List<BookingVO> list = dao.selectAllBookingListMaster(mid);
		
		//select aname from accomodation where mid = 'master6';
		AccomodationDAOInterface accoDAO = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		String aname = accoDAO.getAname(mid);
		
		//mav 생성
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("aname",aname);
		mav.setViewName("/master/booking/manageBookingInfo");
		return mav;
	}
}
