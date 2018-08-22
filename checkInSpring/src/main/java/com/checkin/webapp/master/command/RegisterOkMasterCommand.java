package com.checkin.webapp.master.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.master.model.MasterDAOInterface;
import com.checkin.webapp.master.model.MasterVO;


public class RegisterOkMasterCommand implements MasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MasterVO vo) {
		System.out.println("MasterRegisterOkCommand..execute.."+ vo.toString());
		
		MasterDAOInterface dao = Constants.sqlSession.getMapper(MasterDAOInterface.class);
		int cnt = dao.insertMaster(vo);
		
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
	public MasterVO executeVo(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
