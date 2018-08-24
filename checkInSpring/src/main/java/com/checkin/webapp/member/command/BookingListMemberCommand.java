package com.checkin.webapp.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.booking.model.BookingDAOInterface;
import com.checkin.webapp.booking.model.BookingVO;
import com.checkin.webapp.member.model.MemberVO;

public class BookingListMemberCommand implements MemberCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		//sql 조건문에서 사용할 u 세션에서 가져오기
		HttpSession session = request.getSession();
		int u = (Integer)session.getAttribute("u");
		
		//sql 작업으로 예약리스트 가져오기
		BookingDAOInterface dao = Constants.sqlSession.getMapper(BookingDAOInterface.class);
		List<BookingVO> lst = dao.selectAllBookingList(u);
		System.out.println("dao완료");
		
		//mav 생성
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst",lst);
		System.out.println("object 심기 완료");
		mav.setViewName("main/mypage/bookList");
		return mav;
	}

	@Override
	public MemberVO executeVo(HttpServletRequest request, MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
