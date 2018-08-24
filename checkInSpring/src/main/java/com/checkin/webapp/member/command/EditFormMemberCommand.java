package com.checkin.webapp.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.member.model.MemberDAOInterface;
import com.checkin.webapp.member.model.MemberVO;

public class EditFormMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		ModelAndView mav = new ModelAndView();

		//비밀번호 쿼리작업 위해 u 가져오기
		HttpSession session = request.getSession();
		String uuid = (String)session.getAttribute("uuid");
		vo.setUuid(uuid);
		
		//u에 대응하는 pwd
		MemberDAOInterface dao = Constants.sqlSession.getMapper(MemberDAOInterface.class);
		String pwd = (String)dao.checkMemberPwd(vo);
		System.out.println("pwd:"+pwd);
		
		MemberVO vo2 =new MemberVO();
		vo2 = dao.editInfoMember(vo);
		mav.addObject("vo",vo2);
		System.out.println("vo2:"+vo2.toString());
		
			
		//pwd와 입력한 비밀번호 대조
		if(pwd==null || pwd== "") {		
			//일치하지 않을 경우					
			mav.setViewName("redirect:/main/mypage/preModifyInfo");
		}else{
			mav.setViewName("main/mypage/changeInfo");
			////////////////////////
		}
		return mav;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		return null;
		
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


}
