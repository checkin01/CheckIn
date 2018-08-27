package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class AccoListCommand {
	public ModelAndView execute(HttpServletRequest request,WebmasterVO vo) {
		ModelAndView mav = new ModelAndView();
		
		WebmasterDAOInterface dao =Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		int accoListTotalCnt = dao.getAllAccoListCnt();
		int totalpage = accoListTotalCnt/vo.getOnepage();
		if(accoListTotalCnt%vo.getOnepage() != 0 )totalpage++;
		vo.setTotalpage(totalpage);
		
		List<AccomodationVO> list = dao.showAccoList(vo);
		
		mav.addObject("list",list);
		mav.addObject("curpage", vo.getCurpage());
		mav.addObject("onepage", vo.getCurpage());
		mav.addObject("totalpage", totalpage);
		
		
		mav.setViewName("/webmaster/accomodation/showAccoList");
		return mav;
		
	}
}
