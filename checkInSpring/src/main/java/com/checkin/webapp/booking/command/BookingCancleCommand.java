package com.checkin.webapp.booking.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.BookingVO;

public class BookingCancleCommand implements BookingCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, BookingVO vo) {
		System.out.println("BookingCancleCommand...");
		ModelAndView mav = new ModelAndView();
		BookingDAOInterface dao = Constants.sqlSession.getMapper(BookingDAOInterface.class);
		mav.setViewName("redirect:/main/mypage/bookingList");
		int result = dao.cancelBooking(vo);
		System.out.println("BookingCancleCommand.. result : "+result);
		
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
