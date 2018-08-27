package com.checkin.webapp.review.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectListCommand implements ReviewCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo) {
		System.out.println("SelectListCommand...execute");
		ModelAndView mav = new ModelAndView();
		
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		
		List<ReviewVO> list = dao.selectAllReviewList(vo);
		System.out.println("SelectListCommand...execute..result="+list.size());
		
		return null;
	}

}
