package com.checkin.webapp.review.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.review.model.ReviewVO;

public interface ReviewCommandInterface {
	
	public ModelAndView execute(HttpServletRequest request);
	
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo);
}
