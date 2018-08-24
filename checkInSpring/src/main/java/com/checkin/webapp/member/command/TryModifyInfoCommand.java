package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;
import com.checkin.webapp.member.model.MemberVO;

public class TryModifyInfoCommand {
	public ModelAndView execute(HttpServletRequest request,MemberVO vo) {
		System.out.println("TryModifyInfoCommand.."+vo.toString());
		
		MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
		int cnt = dao.editMember(vo);
		
		//mav생성
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:/main/mypage/myInfo");
		}else {
			mav.setViewName("redirect:/main/mypage/modifyInfo");
		}
		return mav;
	}
}
