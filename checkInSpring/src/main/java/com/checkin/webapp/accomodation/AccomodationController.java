package com.checkin.webapp.accomodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.accomodation.command.GetListCntCommand;
import com.checkin.webapp.accomodation.command.RecommendCommand;
import com.checkin.webapp.accomodation.command.ShowAccoListCommand;
import com.checkin.webapp.accomodation.model.AccomodationVO;

@Controller
public class AccomodationController {
	/*
	//숙박업소 리스트 
	// 매핑 경로 : /main/showAccoList
	public ModelAndView showList(HttpServletRequest request, AccomodationVO vo) {
		
	}
	
	//가맹점 주인 : 숙박 업소 정보 보기
	// 매핑 경로 : /master/viewAcco
	public ModelAndView viewAccomodation(HttpServletRequest request, AccomodationVO vo) {
		
	}
	//가맹점 주인
	// 매핑 경로 : /master/editAcco
	public ModelAndView editAccomodationForm(HttpServletRequest request, AccomodationVO vo) {}
	
	//가맹점 주인
	// 매핑 경로 : /master/editOkAcco
	public ModelAndView editOkAccomodation(HttpServletRequest request, AccomodationVO vo) {}
	
	//가맹점 주인
	// 매핑 경로 : /master/deleteAcco
	public ModelAndView deleteAccomodation(HttpServletRequest request, AccomodationVO vo) {}
	
	//가맹점 주인
	// 매핑 경로 : /master/insertAcco
	public ModelAndView insertAccomodationForm(HttpServletRequest request) {}
	
	//가맹점 주인
	// 매핑 경로 : /master/insertOkAcco
	public ModelAndView insertOkAccomodation(HttpServletRequest request, AccomodationVO vo) {}
	
	*/
	@RequestMapping("/main/recommend")
	@ResponseBody
	public List<AccomodationVO> recommendAjax(HttpServletRequest request, AccomodationVO vo) {
		System.out.println("AccomodationController...recommendAjax" + vo.toString());
		return new RecommendCommand().execute2(request, vo);
	}
	

	// 매핑 경로 : /main/showAccoList
	@RequestMapping("/main/showAccoList")
	public ModelAndView showList(HttpServletRequest request, AccomodationVO vo) {
		System.out.println("AccomodationController...showList()..."+ vo.toString());
		return new ShowAccoListCommand().execute(request);
	}
	
	@RequestMapping("/main/getListCnt")
	@ResponseBody
	public int getListCnt(HttpServletRequest request, AccomodationVO vo) {
		System.out.println("AccomdoationController.. getListCnt()..."+vo.toString());
		return new GetListCntCommand().executeAjax(request);
		
	}
	
	
}
