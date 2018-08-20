package com.checkin.webapp.accomodation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class RecommendCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		
		
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<AccomodationVO> execute2(HttpServletRequest req, AccomodationVO vo){
		System.out.println("AccomodationController...execute2()");
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		List<AccomodationVO> list = dao.get3TopGradeAccomodation(vo);
		System.out.println("AccomodationController..."+list.size()+ list.toString());
		
		return list;
	}

}
