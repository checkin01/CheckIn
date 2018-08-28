package com.checkin.webapp.review.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.review.model.ReviewDAOInterface;
import com.checkin.webapp.review.model.ReviewVO;

public class SelectAllReviewMasterCommand implements ReviewCommandInterface{
	public ModelAndView execute(HttpServletRequest request,ReviewVO vo) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		ReviewDAOInterface dao = Constants.sqlSession.getMapper(ReviewDAOInterface.class);		
		vo.setMid(mid);
		
		int reviewTotalPage = dao.getReviewListCnt(vo);
		
		int totalpage = reviewTotalPage/vo.getVonepage();
		if(reviewTotalPage % vo.getVonepage() != 0 )totalpage++;
		System.out.println(reviewTotalPage);
		
		vo.setTotalpage(totalpage);
		List<ReviewVO> list = dao.selectAllAccoReview(vo);
	
		
		mav.addObject("list",list);
		mav.addObject("curpage", vo.getVcurpage());
		mav.addObject("onepage", vo.getVonepage());
		mav.addObject("totalpage", totalpage);
		
		mav.setViewName("/master/review/showReviewList");
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}
