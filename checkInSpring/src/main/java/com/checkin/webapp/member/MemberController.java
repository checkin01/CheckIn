package com.checkin.webapp.member;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.checkin.webapp.member.command.LoginOkMemberCommand;
import com.checkin.webapp.member.model.MemberVO;

@Controller
public class MemberController{
		
	//로그인폼으로 이동
	// 매핑 경로 : /main/login
	@RequestMapping("/main/login")
	public ModelAndView loginFormMember(HttpServletRequest request) {		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/login/login");
		return mav;
	}
		
	//로그인 성공/실패
	// 매핑 경로 : /main/tryLoginUser
	@RequestMapping(value="/main/tryLoginUser", method=RequestMethod.POST)
	@ResponseBody
	public MemberVO loginOkMember(HttpServletRequest request, MemberVO vo) {
		System.out.println(3+vo.toString());
		LoginOkMemberCommand command = new LoginOkMemberCommand();
		return command.executeVo(request, vo);
	}
	/*
	//로그아웃
	// 매핑 경로 : /main/logout
	public ModelAndView logoutMember(HttpServletRequest request) {
		
	}
	
	//회원가입폼으로 이동
	// 매핑 경로 : /main/registerUser
	public ModelAndView registerFormMember(HttpServletRequest request) {
		
	}
	
	//회원가입 성공/실패
	// 매핑 경로 : /main/tryRegisterUser
	public ModelAndView registerOkMember(HttpServletRequest request) {
		
	}
	
	//수정하기폼으로 이동
	// 매핑 경로 : /main/modifyInfo
	public ModelAndView editFormMember(HttpServletRequest request, MemberVO vo) {
		
	}
	
	//수정 성공/실패
	// 매핑 경로 : /main/tryModifyInfo
	public ModelAndView editOkMember(HttpServletRequest request) {
		
	}
	
	//마이페이지로 이동
	// 매핑 경로 : /main/mypage/myInfo
	public ModelAndView showMember(HttpServletRequest request, MemberVO vo) {
		
	}
*/


}
