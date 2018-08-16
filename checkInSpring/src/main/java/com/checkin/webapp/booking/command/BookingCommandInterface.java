package com.checkin.webapp.booking.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.booking.model.BookingVO;

public interface BookingCommandInterface {
	
	public ModelAndView execute(HttpServletRequest request, BookingVO vo);
	
	public ModelAndView execute(HttpServletRequest request);
}
