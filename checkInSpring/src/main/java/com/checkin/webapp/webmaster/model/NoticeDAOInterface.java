package com.checkin.webapp.webmaster.model;

import java.util.List;

public interface NoticeDAOInterface {
	
	public List<NoticeVO> selectAllNoticeList();
	public NoticeVO selectOneNotice(NoticeVO vo);
	public int updateNotice(NoticeVO vo);
	public int deleteNotice(NoticeVO vo);
	public int insertNotice(NoticeVO vo);
	public int selectRecentNoticeMember(NoticeVO vo); //일반회원과 관련된 공지사항이 있으면 - main/index.jsp에서 모달로 보여준다.
	public int selectRecentNoticeMaster(NoticeVO vo); //가맹점회원과 관련된 공지사항이 있으면 - master/home.jsp에서 모달로 보여준다.
	
}
