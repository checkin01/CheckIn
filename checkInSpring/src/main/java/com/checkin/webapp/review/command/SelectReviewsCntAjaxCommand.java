package com.checkin.webapp.review.command;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectReviewsCntAjaxCommand implements ReviewCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo) {
		
		return null;
	}
	
	
	public int executeAjax(HttpServletRequest request, int r) {
		System.out.println("SelectReviewCnt...executeAjax.. r="+r);
		int result = 0;
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		ReviewVO vo = new ReviewVO();
		vo.setR(r);
		result = dao.getReviewListCnt(vo);
		
		return result;
	}
	

}
