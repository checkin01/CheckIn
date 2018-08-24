package com.checkin.webapp.accomodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.accomodation.command.DeleteAccoCommand;
import com.checkin.webapp.accomodation.command.EditAccoCommand;
import com.checkin.webapp.accomodation.command.EditFormAccoCommand;
import com.checkin.webapp.accomodation.command.GetListCntCommand;
import com.checkin.webapp.accomodation.command.InsertCommand;
import com.checkin.webapp.accomodation.command.InsertFormCommand;
import com.checkin.webapp.accomodation.command.RecommendCommand;
import com.checkin.webapp.accomodation.command.ShowAccoListCommand;
import com.checkin.webapp.accomodation.command.ViewAccoCommand;
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
	
	
	 // 매핑 경로 : /master/viewAcco public ModelAndView
	@RequestMapping("/master/viewAcco")
	public ModelAndView viewAccomodation(HttpServletRequest request, AccomodationVO vo) {
		return new ViewAccoCommand().execute(request);
	}
	
	// 매핑 경로 : /master/editAcco public ModelAndView
	@RequestMapping("/master/editAcco")
	public ModelAndView editAccomodationForm(HttpServletRequest request, AccomodationVO vo) {
		return new EditFormAccoCommand().execute(request);
	}

	// 매핑 경로 : /master/editOkAcco public ModelAndView
	@RequestMapping(value="/master/editOkAcco",method=RequestMethod.POST)
	public ModelAndView editOkAccomodation(HttpServletRequest request, AccomodationVO vo,
			@RequestParam("filename1") MultipartFile file1, @RequestParam("filename2") MultipartFile file2,
			@RequestParam("filename3") MultipartFile file3
			) {
		System.out.println("AccomdoationController.. editOkAccomodation()"+vo.toString());
		System.out.println("AccomdoationController.. editOkAccomodation()"+file1.toString() + file2.toString() + file3.toString());
		return new EditAccoCommand().execute(request,vo,file1,file2,file3);
	}
	
	// 매핑 경로 : /master/insertAcco public ModelAndView
	@RequestMapping("/master/insertAcco")
	public ModelAndView insertAccomodationForm(HttpServletRequest request,AccomodationVO vo) {
		return new InsertFormCommand().execute(request,vo);
	}
	 //가맹점 주인 // 매핑 경로 : /master/insertOkAcco public ModelAndView
	@RequestMapping(value="/master/insertOkAcco",method=RequestMethod.POST)
	public ModelAndView insertOkAccomodationForm(HttpServletRequest request, AccomodationVO vo,@RequestParam("filename1") MultipartFile file1, @RequestParam("filename2") MultipartFile file2,
			@RequestParam("filename3") MultipartFile file3) {
		return new InsertCommand().execute(request,vo,file1,file2,file3);
	}
	
	@RequestMapping("/master/searchAddr")
	@ResponseBody
	public List<AccomodationVO> searchAddr(HttpServletRequest request, AccomodationVO vo){
		return null;
	}
	
	@RequestMapping("/master/jusoPopup")
	public String searchAddr(HttpServletRequest request){
		return "master/accomodation/jusoPopup";
	}
	
	 //매핑 경로 : /master/deleteAcco public ModelAndView
	@RequestMapping("/master/deleteAcco")
	 public ModelAndView deleteAccomodation(HttpServletRequest request, AccomodationVO vo) {
		 return new DeleteAccoCommand().execute(request,vo);
	 }
	
	
	
}
