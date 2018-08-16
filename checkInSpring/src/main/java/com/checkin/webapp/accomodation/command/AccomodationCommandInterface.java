package com.checkin.webapp.accomodation.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.accomodation.model.AccomodationVO;

public interface AccomodationCommandInterface {
	
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo);
	
	public ModelAndView execute(HttpServletRequest request);

}
