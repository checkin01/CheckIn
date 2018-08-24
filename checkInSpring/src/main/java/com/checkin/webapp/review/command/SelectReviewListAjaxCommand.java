package com.checkin.webapp.review.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;
import com.checkin.webapp.room.model.RoomVO;

public class SelectReviewListAjaxCommand implements ReviewCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, ReviewVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public List<ReviewVO> executeAjax(HttpServletRequest request, ReviewVO vo) {
		System.out.println("SelectReviewListAjaxCommand.. executeAjax.. r="+vo.getR());
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);
		List<ReviewVO> list = dao.selectAllReviewList(vo);
		System.out.println("SelectReviewListAjaxCommand.. executeAjax..list="+list.toString());
		
		return list;
	}

}
