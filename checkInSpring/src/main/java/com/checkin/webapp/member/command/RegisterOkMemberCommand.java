package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;
import com.checkin.webapp.member.model.MemberVO;

public class RegisterOkMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		System.out.println("MemberRegisterOkCommand..execute.."+ vo.toString());
		
		MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
		int cnt = dao.insertMember(vo);
		
		//mav 생성
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {//성공: 로그인폼
			mav.setViewName("redirect:/main/login");
		}
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
