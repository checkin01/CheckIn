package com.checkin.webapp.master.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.accomodation.model.AccomodationDAOInterface;
import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.master.model.MasterChartVO;
import com.checkin.webapp.master.model.MasterDAOInterface;
import com.checkin.webapp.master.model.MasterVO;

public class ShowMasterChart implements MasterCommandInterface{

	@Override
	public ModelAndView execute(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
	
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		System.out.println("ShowMasterMain..execute()"+mid);
		if(mid == null) {
			mav.setViewName("redirect:/main/login");
		}else {
			MasterChartVO vo = new MasterChartVO();
			if(isExistRegisterAccomodation(mid)) {
			
				
				vo.setMid(mid);
				
				MasterDAOInterface dao = Constants.sqlSession.getMapper(MasterDAOInterface.class);
				MasterChartVO vo2 = dao.selectMasterChart(vo); //이번 달 예약 수
				MasterChartVO vo3 = dao.selectMasterChart2(vo); // 전체 평점
				MasterChartVO vo4 = dao.selectMasterChart3(vo); // 전체 평점
				
				//메인 통계
				mav.addObject("vo2", vo2);
				mav.addObject("vo3", vo3);
				mav.addObject("vo4", vo4);
				
				//달력 통계
				ArrayList<MasterChartVO> list = dao.selectBookingDate(vo);
				System.out.println("showMasterMain..."+list.toString());
				mav.addObject("list", list);
				
		
				//매출, 예약자수 통계
				ArrayList<MasterChartVO> list2 = dao.selectSaleBooking(vo);
				System.out.println("showMasterMain..."+list2.toString());
				mav.addObject("list2", list2);
				
				//룸별 예약건수 통계
				////룸 이름 리스트
				ArrayList<MasterChartVO> list3 = dao.selectAllRoomName(vo);
				mav.addObject("list3",list3);
				//매월 룸별 예약 건수 리스트
				ArrayList<MasterChartVO> list4 = dao.getBookingCountEachRoom(vo);
				mav.addObject("list4", list4);
				
				//뷰 페이지
				mav.setViewName("master/accomodation/showAccomodationChart");
				System.out.println("ShowMasterMain...execute..");
			}else {
				mav.setViewName("master/first");
			}
		}
		return mav;
	}

	//등록된 숙박 업소가 있는지 겁사
	public boolean isExistRegisterAccomodation(String mid) {
		AccomodationDAOInterface accoDao = Constants.sqlSession.getMapper(AccomodationDAOInterface.class);
		AccomodationVO accoVO = new AccomodationVO();
		accoVO.setMid(mid);
		AccomodationVO accoResultVO = accoDao.selectOneRecord(accoVO);
		if(accoResultVO != null) {
			return true;
		}else {
			return false;
		}	
	}
	@Override
	public MasterVO executeVo(HttpServletRequest request, MasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


}
