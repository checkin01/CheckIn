package com.checkin.webapp.webmaster.model;

import java.util.List;

public interface NoticeDAOInterface {
	
	// 공지사항 리스트 불러오기
	public List<NoticeVO> selectAllNoticeList(NoticeVO vo);
	
	//공지사항 글 보기
	public NoticeVO selectOneNotice(int no);
	
	//공지사항 글 수정
	public int updateNotice(NoticeVO vo);
	
	//공지사항 글 삭제
	public int deleteNotice(NoticeVO vo);
	
	//공지사항 글 추가
	public int insertNotice(NoticeVO vo);
	
	
	public int selectRecentNoticeMember(NoticeVO vo); //일반회원과 관련된 공지사항이 있으면 - main/index.jsp에서 모달로 보여준다.
	public int selectRecentNoticeMaster(NoticeVO vo); //가맹점회원과 관련된 공지사항이 있으면 - master/home.jsp에서 모달로 보여준다.
	
}
