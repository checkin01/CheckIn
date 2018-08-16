package com.checkin.webapp.webmaster.model;

public class NoticeVO {
	private int no; //공지사항 시퀀스
	private String wid; //웹관리자 아이디
	private String notitle; //공지사항 제목
	private String nostartdate; //공지를 시작한 날짜
	private String noenddate; //공지가 끝난날짜
	private int target; //적용대상(0:일반회원-main/index.jsp, 1:가맹회원-/master/home.jsp)
	private String writedate; //공지 작성날짜
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWid() {
		return wid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public String getNotitle() {
		return notitle;
	}
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}
	public String getNostartdate() {
		return nostartdate;
	}
	public void setNostartdate(String nostartdate) {
		this.nostartdate = nostartdate;
	}
	public String getNoenddate() {
		return noenddate;
	}
	public void setNoenddate(String noenddate) {
		this.noenddate = noenddate;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

}
