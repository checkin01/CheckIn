package com.checkin.webapp.webmaster.model;

public class WebmasterVO {
	private int w;
	private String wid;
	private String wpwd;
	private String writedate;
	private String logChk;
	
	@Override
	public String toString() {
		return "WebmasterVO [w=" + w + ", wid=" + wid + ", wpwd=" + wpwd + ", writedate=" + writedate + "]";
	}
	
	
	public String getLogChk() {
		return logChk;
	}


	public void setLogChk(String logChk) {
		this.logChk = logChk;
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
