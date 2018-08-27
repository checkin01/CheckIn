package com.checkin.webapp.review.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectReviewAjaxCommand  implements ReviewCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo) {

		return null;
	}
	
	
	public ReviewVO executeAjax(HttpServletRequest request, ReviewVO vo) {
		System.out.println("SelectReviewAjaxCommand..."+vo.toString());
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		ReviewVO resultVO = dao.selectOneReview(vo);
		
		return resultVO;
	}

}
