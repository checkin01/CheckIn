package com.checkin.webapp.accomodation.model;

public class AccomodationVO {
	private int a; //가맹점 시퀀스
	private String mid; //가맹점 주인 아이디
	private String aname; // 숙박업소 이름
	private String atel; //숙박업소 전화번호
	private String aaddr; //숙박업소 전체주소
	private String atype; // 업태
	private String acheckin; //입실시간
	private String acheckout; //퇴실시간
	private String asi; //서울시
	private String agu; //금천구
	private String agunmul; //시흥대로101
	private String adong; //장충동
	private String aimg1; //이미지1 경로
	private String aimg2; //이미지2 경로
	private String aimg3; //이미지3 경로
	private int amaxreservedate; //최대 예약 가능한 날
	private int amaxsleepdate; //최대 머무를 수 있는 날
	private String atheme; //테마
	private String anotice; //주의사항
	private String writedate; //등록 날짜
	private String asubway; //주변 지하철역
	private int agrade; //숙박업소 평균 평점
	
	//페이징
	private int acurpage; //현재 페이지
	private int aonepage; //한 페이지에 보여질 리스트 개수
	private String asearchkey;//검색조건
	private String asearchvalue; //검색값
	
	
	
	public double getAgrade() {
		return agrade;
	}
	public void setAgrade(int agrade) {
		this.agrade = agrade;
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
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getAaddr() {
		return aaddr;
	}
	public void setAaddr(String aaddr) {
		this.aaddr = aaddr;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getAcheckin() {
		return acheckin;
	}
	public void setAcheckin(String acheckin) {
		this.acheckin = acheckin;
	}
	public String getAcheckout() {
		return acheckout;
	}
	public void setAcheckout(String acheckout) {
		this.acheckout = acheckout;
	}
	public String getAsi() {
		return asi;
	}
	public void setAsi(String asi) {
		this.asi = asi;
	}
	public String getAgu() {
		return agu;
	}
	public void setAgu(String agu) {
		this.agu = agu;
	}
	public String getAgunmul() {
		return agunmul;
	}
	public void setAgunmul(String agunmul) {
		this.agunmul = agunmul;
	}
	public String getAdong() {
		return adong;
	}
	public void setAdong(String adong) {
		this.adong = adong;
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
	public int getAmaxreservedate() {
		return amaxreservedate;
	}
	public void setAmaxreservedate(int amaxreservedate) {
		this.amaxreservedate = amaxreservedate;
	}
	public int getAmaxsleepdate() {
		return amaxsleepdate;
	}
	public void setAmaxsleepdate(int amaxsleepdate) {
		this.amaxsleepdate = amaxsleepdate;
	}
	public String getAtheme() {
		return atheme;
	}
	public void setAtheme(String atheme) {
		this.atheme = atheme;
	}
	public String getAnotice() {
		return anotice;
	}
	public void setAnotice(String anotice) {
		this.anotice = anotice;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getAsubway() {
		return asubway;
	}
	public void setAsubway(String asubway) {
		this.asubway = asubway;
	}
	public int getAcurpage() {
		return acurpage;
	}
	public void setAcurpage(int acurpage) {
		this.acurpage = acurpage;
	}
	public int getAonepage() {
		return aonepage;
	}
	public void setAonepage(int aonepage) {
		this.aonepage = aonepage;
	}
	public String getAsearchkey() {
		return asearchkey;
	}
	public void setAsearchkey(String asearchkey) {
		this.asearchkey = asearchkey;
	}
	public String getAsearchvalue() {
		return asearchvalue;
	}
	public void setAsearchvalue(String asearchvalue) {
		this.asearchvalue = asearchvalue;
	}
	
	
}
