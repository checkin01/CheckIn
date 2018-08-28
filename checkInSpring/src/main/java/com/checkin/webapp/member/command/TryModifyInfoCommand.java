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
		
		if(vo.getUpwd() == null || vo.getUpwd() == "") {
			System.out.println("upwd is null");
			System.out.println("vo.uuid확인:"+vo.getUuid());
			String pwd = (String)dao.selectMemberPwd(vo);			
			System.out.println("함수로 "+pwd+" 가져와서 upwd세팅");
			vo.setUpwd(pwd);
			System.out.println("vo.upwd확인:"+vo.getUpwd());
		}
		
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
