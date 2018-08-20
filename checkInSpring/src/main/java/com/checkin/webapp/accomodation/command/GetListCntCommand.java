package com.checkin.webapp.accomodation.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;

public class GetListCntCommand implements AccomodationCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, AccomodationVO vo) {
		
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int executeAjax(HttpServletRequest request) {
		
		String agu = request.getParameter("agu");
		String asubway = request.getParameter("asubway");
		String curpage = request.getParameter("acurpage");
		String asortkey = request.getParameter("asortkey");
		
		int acurpage = 1;
		if(curpage!=null && !curpage.equals("")) acurpage = Integer.parseInt(curpage);
		String atype = request.getParameter("atype");
		
		String onepage = request.getParameter("aonepage");
		int aonepage = 10;
		if(curpage!=null && !curpage.equals("")) aonepage = Integer.parseInt(onepage);

		
		List<String> athemeList = null;
		String atheme = request.getParameter("atheme");
		if(atheme != null) {
			athemeList = new ArrayList<String>(Arrays.asList(atheme.trim().split(" ")));
		}
		
		//vo settion
		AccomodationVO vo = getMember(agu, asubway, atype, asortkey, athemeList, aonepage, acurpage);
		
		System.out.println("GetListCnt..."+vo.toString());
		
		AccomodationDAOInterface dao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		return dao.getListCnt(vo);
	}
	
	public AccomodationVO getMember(String agu, String asubway, String atype, String asortkey,List<String> athemeList, int aonepage, int acurpage) {
		AccomodationVO vo = new AccomodationVO();
		if (agu != null) vo.setAgu(agu);
		if (asubway != null) vo.setAsubway(asubway);
		if (atype != null) vo.setAtype(atype);
		vo.setAonepage(aonepage);
		vo.setAcurpage(acurpage);
		if (asortkey != null) vo.setAsortkey(asortkey);
		vo.setAthemeList(athemeList);
		return vo;

	}

}
