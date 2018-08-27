package com.checkin.webapp.webmaster.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.Constants;
import com.checkin.webapp.webmaster.model.NoticeDAOInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

public class ShowAllNoticeListCommand implements WebmasterCommandInterface {

	@Override
	public ModelAndView execute(HttpServletRequest request,NoticeVO vo) {
		System.out.println("ShowAllNoticeListCommand.."+vo.toString());
		//Session에 있는 wid를 noticeVO wid에 입력
	
		//DAO 작업
		NoticeDAOInterface dao = Constants.sqlSession.getMapper(NoticeDAOInterface.class);
		
		//===================== paging =============================//
		/*
		 * 1. 페이징을 위해서 리스트의 총 개수를 구한다. - 쿼리 작성 필요
		 * 2. dao에 넘겨줄 vo에 totalpage를 set한다.
		 * 3. paging, onepage,curpage를 ModelAndView에 넣는다.
		 */
		int noticeListTotalCnt = dao.getNoticeListCnt();
		int totalpage = noticeListTotalCnt/vo.getNonepage();
		if(noticeListTotalCnt%vo.getNonepage() != 0 )totalpage++;
		vo.setTotalpage(totalpage);
		
		List<NoticeVO> list = dao.selectAllNoticeList(vo);
		System.out.println("ShowAllNoticeListCommand.."+list.toString());
		System.out.println("ShowAllNoticeListCommand.."+vo.getTotalpage());
		

		//mav 작업
		ModelAndView mav = new ModelAndView();
		mav.addObject("curpage", vo.getNcurpage());
		mav.addObject("onepage", vo.getNcurpage());
		mav.addObject("totalpage", totalpage);
		mav.addObject("list", list);
		mav.setViewName("webmaster/notice/showNoticeList");
		return mav;
	}
	

	@Override
	public ModelAndView execute(HttpServletRequest request, WebmasterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
