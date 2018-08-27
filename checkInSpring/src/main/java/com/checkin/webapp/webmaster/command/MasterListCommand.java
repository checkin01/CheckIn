package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.master.model.MasterVO;
import com.checkin.webapp.member.model.MemberVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class MasterListCommand {
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		ModelAndView mav = new ModelAndView();
		
		//===================== paging =============================//
		WebmasterDAOInterface dao = Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		int masterListTotalCnt = dao.getAllMasterListCnt();
		int totalpage = masterListTotalCnt/vo.getOnepage();
		if(masterListTotalCnt%vo.getOnepage() != 0 )totalpage++;
		vo.setTotalpage(totalpage);
		
		
		List<MasterVO> list = dao.showMasterList(vo);
		mav.addObject("list",list);
		
		mav.addObject("curpage", vo.getCurpage());
		mav.addObject("onepage", vo.getCurpage());
		mav.addObject("totalpage", totalpage);
		
		
		mav.setViewName("/webmaster/member/showMaster");
		return mav;
	}
}
