package com.checkin.webapp.master;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.master.command.RegisterOkMasterCommand;
import com.checkin.webapp.master.command.ShowMasterChart;
import com.checkin.webapp.master.command.LoginOkMasterCommand;
import com.checkin.webapp.master.command.MidCheckCommand;
import com.checkin.webapp.master.model.MasterVO;

@Controller
public class MasterController {
	
	//로그인 성공/실패
	// 매핑 경로 : /main/tryLoginManager
	@RequestMapping(value="/main/tryLoginManager", method=RequestMethod.POST)
	@ResponseBody
	public MasterVO loginOkMaster(HttpServletRequest request, MasterVO vo) {
		return new LoginOkMasterCommand().executeVo(request, vo);
	}
	/*
	//로그인폼으로 이동 - 구현 X
	// 매핑 경로 : /main/login
	public ModelAndView loginFormMaster(HttpServletRequest request) {
		
	}
	
	//로그아웃 - 구현 X
	// 매핑 경로 : /main/logout
	public ModelAndView logoutMaster(HttpServletRequest request) {
		
	}
	*/
	//회원가입폼으로 이동
	// 매핑 경로 : /main/registerManager
	@RequestMapping(value="/main/registerManager",method = RequestMethod.GET)
	public ModelAndView registerFormMaster(HttpServletRequest request) {
		System.out.println("MasterController...registerFormMaster");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/register/registerMaster");
		return mav;
	}
	
	//아이디 중복 확인
	@RequestMapping(value="/main/midCheckAjax",method = RequestMethod.GET)
	@ResponseBody
	public int registerMidChk(HttpServletRequest request, @RequestParam("mid") String mid) {
		return new MidCheckCommand().execute(request,mid);
	}
	
	//회원가입 성공/실패
	// 매핑 경로 : /main/tryRegisterManager
	@RequestMapping(value="/main/tryRegisterManager",method=RequestMethod.POST)
	public ModelAndView registerOkMaster(HttpServletRequest request,MasterVO vo) {
		return new RegisterOkMasterCommand().execute(request,vo);
	}
	@RequestMapping(value="/master/showChart", method = RequestMethod.GET)
	public ModelAndView masterMain(HttpServletRequest request) {
		return new ShowMasterChart().execute(request);
	}
	
	/*
	//수정하기폼으로 이동
	// 매핑 경로 : /main/modifyManagerInfo
	public ModelAndView editFormMaster(HttpServletRequest request) {
		
	}
	
	//수정 성공/실패
	// 매핑 경로 : /main/tryModifyManagerInfo
	public ModelAndView editOkMaster(HttpServletRequest request) {
		
	}
	
	//마이페이지로 이동 -> 가맹점 주인 정보 수정 페이지 없음
	// 매핑 경로 : /main/tryModifyManagerInfo
	public ModelAndView showMaster(HttpServletRequest request, MasterVO vo) {
		
	}

	}
	
	*/
}
