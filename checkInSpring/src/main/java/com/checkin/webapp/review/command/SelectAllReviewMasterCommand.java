package com.checkin.webapp.review.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectAllReviewMasterCommand {
	public ModelAndView execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);		
		List<ReviewVO> list = dao.selectAllReview(mid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("/master/review/showReviewList");
		return mav;
	}
}
