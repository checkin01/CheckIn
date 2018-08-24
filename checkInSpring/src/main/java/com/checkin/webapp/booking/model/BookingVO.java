package com.checkin.webapp.booking.model;

public class BookingVO {
	private int b; //예약시퀀스
	private int r; //룸 시퀀스
	private String u;//예약자 아이디
	private int a; //숙밥업소 시퀀스
	private String mid; //가맹점주인 아이디
	private String bcheckin; //입실시간(날짜YYYY-MM-DD)
	private String bcheckout; //퇴실시간
	private String bcount; //예약자 수
	private int cancel; //취소여부 0:취소안함, 1:취소
	private String canceldate; //취소한 날짜(sysdate)
	private String writedate; //예약한 날짜(sysdate)
	
	private int bcurpage; //현재 페이지
	private int bonepage; //한 페이지에 보여질 리스트 개수
	
	//===============예약내역확인======================
	private String atel;//예약 숙소 연락처
	private String aname;//예약 숙소 이름
	private String rname;//예약 룸 이름
	private String aimg1;//예약 숙소 img1
	private String aimg2;//예약 숙소 img2
	private String aimg3;//예약 숙소 img3
	
	private String uname;
	private String utel;	
	//===============================================
		
	public int getBcurpage() {
		return bcurpage;
	}
	public void setBcurpage(int bcurpage) {
		this.bcurpage = bcurpage;
	}
	public int getBonepage() {
		return bonepage;
	}
	public void setBonepage(int bonepage) {
		this.bonepage = bonepage;
	}	
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public String getU() {
		return u;
	}
	public void setU(String u) {
		this.u = u;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBcheckin() {
		return bcheckin;
	}
	public void setBcheckin(String bcheckin) {
		this.bcheckin = bcheckin;
	}
	public String getBcheckout() {
		return bcheckout;
	}
	public void setBcheckout(String bcheckout) {
		this.bcheckout = bcheckout;
	}
	public String getBcount() {
		return bcount;
	}
	public void setBcount(String bcount) {
		this.bcount = bcount;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	public String getCanceldate() {
		return canceldate;
	}
	public void setCanceldate(String canceldate) {
		this.canceldate = canceldate;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getAimg1() {
		return aimg1;
	}
	public void setAimg1(String aimg1) {
		this.aimg1 = aimg1;
	}
	public String getAimg2() {
		return aimg2;
	}
	public void setAimg2(String aimg2) {
		this.aimg2 = aimg2;
	}
	public String getAimg3() {
		return aimg3;
	}
	public void setAimg3(String aimg3) {
		this.aimg3 = aimg3;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}	
	
}
