package com.checkin.webapp.booking.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.BookingVO;
import com.checkin.webapp.booking.model.CheckBookingVO;

public class BookingCommand implements BookingCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, BookingVO vo) {
		ModelAndView mav = new ModelAndView();
		//dao 작업............................
		
		
		return null;
	}
	
	public int executeAjax(HttpServletRequest request, BookingVO vo) {
		int result1 = 0;
		int result2 = 0;
		//dao 작업............................
		
		BookingDAOInterface dao = Constants.sqlSession.getMapper(BookingDAOInterface.class);
		CheckBookingVO bookingVO = new CheckBookingVO();
		bookingVO.setA(vo.getA());
		bookingVO.setCheckin(vo.getBcheckin());
		bookingVO.setCheckout(vo.getBcheckout());
		result1 = dao.checkAvailBooking(bookingVO);
		if(result1 == 0 ) {
			result2 = dao.insertBooking(vo);
		}else {
			result2 = 0;
		}
		
		System.out.println("BookingCommand..."+result2);
		
		return result2;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
