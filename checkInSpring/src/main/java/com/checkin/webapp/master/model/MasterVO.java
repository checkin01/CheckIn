package com.checkin.webapp.master.model;


public class MasterVO {
	private int m; //시퀀스
	private String mid; //가맹점아이디
	private	String mpwd; //가맹점비밀번호
	private String mname; //가맹점이름
	private String mtel; //가맹점전화번호
	private String memail; //가맹점이메일
	private	String writedate; //가입날짜
	
	private int a;
	private String aname;

	private int mcurpage; //현재 페이지
	private int monepage; //한 페이지에 보여질 리스트 개수
	private String msearchkey;//검색조건
	private String msearchvalue; //검색값
	
	
	
	
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getMcurpage() {
		return mcurpage;
	}
	public void setMcurpage(int mcurpage) {
		this.mcurpage = mcurpage;
	}
	public int getMonepage() {
		return monepage;
	}
	public void setMonepage(int monepage) {
		this.monepage = monepage;
	}
	public String getMsearchkey() {
		return msearchkey;
	}
	public void setMsearchkey(String msearchkey) {
		this.msearchkey = msearchkey;
	}
	public String getMsearchvalue() {
		return msearchvalue;
	}
	public void setMsearchvalue(String msearchvalue) {
		this.msearchvalue = msearchvalue;
	}
	public int getM() {
		return m;
	}
	public void setM(int m) {
		this.m = m;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
