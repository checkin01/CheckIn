package com.checkin.webapp.webmaster.model;

public class WebmasterVO {
	private int w;
	private String wid;
	private String wpwd;
	private String writedate;
	private String logChk;
	
	private int totalpage; //전체 페이지 수
	private int curpage=1; //공지사항 내용
	private int onepage=10; //공지사항 내용
	

	
	
	@Override
	public String toString() {
		return "WebmasterVO [w=" + w + ", wid=" + wid + ", wpwd=" + wpwd + ", writedate=" + writedate + ", logChk="
				+ logChk + ", totalpage=" + totalpage + ", curpage=" + curpage + ", onepage=" + onepage + "]";
	}


	public String getLogChk() {
		return logChk;
	}


	public void setLogChk(String logChk) {
		this.logChk = logChk;
	}
	

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getCurpage() {
		return curpage;
	}


	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}


	public int getOnepage() {
		return onepage;
	}


	public void setOnepage(int onepage) {
		this.onepage = onepage;
	}


	public int getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}
	public String getWid() {
		return wid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public String getWpwd() {
		return wpwd;
	}
	public void setWpwd(String wpwd) {
		this.wpwd = wpwd;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
