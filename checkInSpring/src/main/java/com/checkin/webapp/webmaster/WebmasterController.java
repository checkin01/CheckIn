package com.checkin.webapp.webmaster;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.checkin.webapp.accomodation.model.AccomodationVO;
import com.checkin.webapp.master.model.MasterVO;
import com.checkin.webapp.member.model.MemberVO;
import com.checkin.webapp.webmaster.command.AccoListCommand;
import com.checkin.webapp.webmaster.command.DeleteNoticeCommand;
import com.checkin.webapp.webmaster.command.EditNoticeFormCommand;
import com.checkin.webapp.webmaster.command.EditNoticeOkCommand;
import com.checkin.webapp.webmaster.command.GetMasterNoticeCommand;
import com.checkin.webapp.webmaster.command.GetMemberNoticeCommand;
import com.checkin.webapp.webmaster.command.InsertNoticeFormCommand;
import com.checkin.webapp.webmaster.command.InsertNoticeOkCommand;
import com.checkin.webapp.webmaster.command.LoginWebmasterCommand;
import com.checkin.webapp.webmaster.command.MasterListCommand;
import com.checkin.webapp.webmaster.command.ShowAllNoticeListCommand;
import com.checkin.webapp.webmaster.command.UserListCommand;
import com.checkin.webapp.webmaster.command.ViewOneNoticeCommand;
import com.checkin.webapp.webmaster.command.WebmasterCommandInterface;
import com.checkin.webapp.webmaster.model.NoticeVO;
import com.checkin.webapp.webmaster.model.WebmasterVO;

@Controller
public class WebmasterController {
	// 웹마스터 로그인
	// 매핑 경로 : /webmaster/webmasterLogin
	@RequestMapping(value = "/trywebmasterlogin", method = RequestMethod.POST)
	public ModelAndView loginWebmaster(HttpServletRequest request, WebmasterVO vo) {
		LoginWebmasterCommand command = new LoginWebmasterCommand();
		return command.execute(request, vo);
	}

	/*
	 * //웹마스터 로그아웃 // 매핑 경로 : /webmaster/webmasterLogout public ModelAndView
	 * logoutWebmaster(HttpServletRequest request);
	 */

	// 공지사항게시판 이동
	// 매핑 경로 : /webmaster/notices
	@RequestMapping("/webmaster/notices")
	public ModelAndView showAllNoticeList(HttpServletRequest request, NoticeVO vo) {
		HttpSession session = request.getSession();
		ShowAllNoticeListCommand command = new ShowAllNoticeListCommand();
		return command.execute(request, vo);
	}

	// 공지사항 글보기 페이지로 이동
	// 매핑 경로 : /webmaster/notice
	@RequestMapping("/webmaster/notice")
	public ModelAndView viewOneNotice(HttpServletRequest request, @RequestParam("no") int no) {
		ViewOneNoticeCommand command = new ViewOneNoticeCommand();
		return command.execute(no);
	}

	// 공지사항 수정폼으로 이동
	// 매핑 경로 : /webmaster/modifyNotice
	@RequestMapping("/webmaster/modifyNotice")
	public ModelAndView editNoticeForm(@RequestParam("no") int no) {
		EditNoticeFormCommand command = new EditNoticeFormCommand();
		return command.execute(no);
	}

	// 공지사항 수정 완료/실패했을 때 이동할 페이지
	// 매핑 경로 : /webmaster/tryModifyNotice
	@RequestMapping(value = "/webmaster/tryModifyNotice", method = RequestMethod.POST)
	public ModelAndView editNoticeOk(HttpServletRequest request, NoticeVO vo) {
		System.out.println("editOK Controller vo = " + vo.toString());
		EditNoticeOkCommand command = new EditNoticeOkCommand();
		return command.execute(request, vo);
	}

	// 공지사항 글 삭제
	// 매핑 경로 : /webmaster/deleteNotice
	@RequestMapping("/webmaster/deleteNotice")
	public ModelAndView deleteNotice(@RequestParam int no) {
		DeleteNoticeCommand command = new DeleteNoticeCommand();
		return command.execute(no);
	}

	// 공지사항 글 추가폼으로 이동
	// 매핑 경로 : /webmaster/addNotice
	@RequestMapping("/webmaster/addNotice")
	public ModelAndView insertNoticeForm(HttpServletRequest request) {
		InsertNoticeFormCommand command = new InsertNoticeFormCommand();
		return command.execute(request);
	}

	// 공지사항 글 추가 완료/실패했을 때 이동할 페이지
	// 매핑 경로 : /webmaster/tryAddNotice
	@RequestMapping(value = "/webmaster/tryAddNotice", method = RequestMethod.POST)
	public ModelAndView insertNoticeOk(HttpServletRequest request, NoticeVO vo) {
		System.out.println("글 추가 vo = " + vo.toString());
		InsertNoticeOkCommand command = new InsertNoticeOkCommand();
		return command.execute(request, vo);
	}

	// 멤버리스트 이동
	// 매핑 경로 : /webmaster/userList
	@RequestMapping(value = "/webmaster/userList", method = RequestMethod.GET)
	public ModelAndView showAllMember(HttpServletRequest request, WebmasterVO vo) {
		System.out.println("Controller..showMember..");
		return new UserListCommand().execute(request, vo);
	};

	// 숙박업소관리자리스트 이동
	@RequestMapping(value = "/webmaster/masterList", method = RequestMethod.GET)
	public ModelAndView showAllMaster(HttpServletRequest request, WebmasterVO vo) {
		System.out.println("Controller..showMaster..");
		return new MasterListCommand().execute(request, vo);
	}

	// 숙박업소리스트 이동
	// 매핑 경로 : /webmaster/accoList
	@RequestMapping(value = "/webmaster/accoList", method = RequestMethod.GET)
	public ModelAndView showAllAccomodation(HttpServletRequest request, WebmasterVO vo) {
		System.out.println("Controller.. AccoList..");
		return new AccoListCommand().execute(request, vo);
	};

	// 로그아웃
	// 매핑 경로 : /webmaster/accoList
	@RequestMapping(value = "/webmaster/logout", method = RequestMethod.GET)
	public String logoutWebmaster(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/webmaster";
	};
	
	@RequestMapping("/main/getpagenotice")
	@ResponseBody
	public List<NoticeVO> getNoticeForMaster(HttpServletRequest request,NoticeVO vo){
		return new GetMemberNoticeCommand().executeAjax( request, vo);
	}
	

	@RequestMapping("/main/getmasternotice")
	@ResponseBody
	public List<NoticeVO> getNoticeForMember(HttpServletRequest request,NoticeVO vo){
		return new GetMasterNoticeCommand().executeAjax( request, vo);
	}

}
