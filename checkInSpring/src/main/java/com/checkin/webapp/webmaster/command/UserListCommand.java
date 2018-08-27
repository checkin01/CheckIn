package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class UserListCommand {
	public ModelAndView execute(HttpServletRequest request,WebmasterVO vo) {
		ModelAndView mav = new ModelAndView();
		
		WebmasterDAOInterface dao = Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		int memberListTotalCnt = dao.getAllMemberListCnt();
		int totalpage = memberListTotalCnt/vo.getOnepage();
		if(memberListTotalCnt%vo.getOnepage() != 0 )totalpage++;
		vo.setTotalpage(totalpage);
	
		List<MemberVO> list = dao.showMemberList(vo);
		
		//===================== paging =============================//
		
		
		mav.addObject("curpage", vo.getCurpage());
		mav.addObject("onepage", vo.getCurpage());
		mav.addObject("totalpage", totalpage);

		//mav 생성
		
		mav.addObject("list",list);
		mav.setViewName("/webmaster/member/showMember");
		return mav;
	}
}
