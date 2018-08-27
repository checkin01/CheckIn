package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberVO;
import com.checkin.webapp.webmaster.model.WebmasterDAOInterface;

public class UserListCommand {
	public ModelAndView execute(HttpServletRequest request) {
		
		WebmasterDAOInterface dao = Constants.sqlSession.getMapper(WebmasterDAOInterface.class);
		List<MemberVO> list = dao.showMemberList();
		
		//mav 생성
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("/webmaster/member/showMember");
		return mav;
	}
}
