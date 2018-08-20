package com.checkin.webapp.accomodation.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class ShowAccoListCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
	
		
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		String checkinout =  request.getParameter("checkinout");
		String agu = request.getParameter("agu");
		String asubway = request.getParameter("asubway");
		
		String acurpage = request.getParameter("acurpage");
		int curpage = 1;
		if(acurpage!=null && !acurpage.equals("")) curpage = Integer.parseInt(acurpage);
		
		String aonepage = request.getParameter("aonepage");
		int onepage = 10;
		if(aonepage!=null && !aonepage.equals("")) onepage = Integer.parseInt(aonepage);
		
		
		String atype = request.getParameter("atype");
		String asorttype = request.getParameter("asortkey");
		List<String> athemeList = null;
		System.out.println("ShowAccoListCommand..execute().."+checkinout+" "+agu+" "+asubway+" "+atype+" "+asorttype);
	
		
		//theme 처리
		String atheme = request.getParameter("atheme");
		if(atheme != null) {
			athemeList = new ArrayList<String>(Arrays.asList(atheme.trim().split(" ")));
			
		}
		
		//dao 작업
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		AccomodationVO vo = getMember(agu, asubway, atype, asorttype, athemeList, curpage,onepage);
		
	
		//쿼리 질의
		List<AccomodationVO> list = dao.selectAllList(vo);
		//List<AccomodationVO> list = dao.selectAllList(map);
		//결과 출력
		System.out.println("ShowAccoListCommand..execute().."+list.size()+" "+ list.toString());
		
		ModelAndView mav = new ModelAndView();
		//model과 view setting
		mav.addObject("list",list);
		mav.setViewName("main/accomodation/showAccomodationList");
		setSession(request.getSession(),checkinout,agu,asubway,atype,asorttype, atheme, curpage);
		
		
		return mav;
	}
	
	public AccomodationVO getMember(String agu, String asubway, String atype, String asorttype, List<String> athemeList,int acurpage,int aonepage) {
		AccomodationVO vo = new AccomodationVO();
		if (agu != null) vo.setAgu(agu);
		if (asubway != null) vo.setAsubway(asubway);
		if (atype != null) vo.setAtype(atype);
		vo.setAonepage(aonepage);
		vo.setAcurpage(acurpage);
		if (asorttype != null) vo.setAsortkey(asorttype);
		System.out.println(vo.toString());
		vo.setAthemeList(athemeList);
		return vo;
	}
	
	public void setSession(HttpSession session,String checkinout,String agu,String asubway, String atype, String asorttype, String atheme,int curpage) {
		//session 작업 - session에 checkinout 시간, 유형, 구, 인근 지하철 정보를 세팅한다.
		session.setAttribute("curpage", curpage);
		session.setAttribute("checkinout", checkinout);
		session.setAttribute("gu", agu);
		session.setAttribute("subway", asubway);
		session.setAttribute("type", atype);
		session.setAttribute("atheme", atheme);
		if (asorttype== null || asorttype == "") session.setAttribute("asorttype", "writedate");
		else session.setAttribute("asorttype", asorttype);
		
	}

}

