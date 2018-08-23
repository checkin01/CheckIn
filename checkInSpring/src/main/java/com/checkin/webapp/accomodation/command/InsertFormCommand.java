package com.checkin.webapp.accomodation.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.accomodation.model.AccomodationVO;

public class InsertFormCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		System.out.println("InsertFormCommand.. In");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master/accomodation/registerAccomodation");
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
