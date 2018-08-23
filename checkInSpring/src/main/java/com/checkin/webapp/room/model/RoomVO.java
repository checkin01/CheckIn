package com.checkin.webapp.room.model;

public class RoomVO {
	private int r; //룸 시퀀스
	private int a; //숙박 시퀀스
	private String mid; //가맹점아이디 
	private String rname; //룸이름 
	private int rmin; //기본인원
	private int rmax; //최대인원
	private int rprice; //가격
	private String rimg1="";
	private String rimg2="";
	private String rimg3="";
	private String rtype;
	private int rbedroom;//침실 수
	private int rrestroom;//화장실 수
	private int rdiningroom;//거실 수
	private int rkitchen;// 주방 수
	private String rtheme=""; //테마(복층, 스파, PC커플, 온돌)
	private String writedate; //입력날짜
	
	
	@Override
	public String toString() {
		return "RoomVO [r=" + r + ", a=" + a + ", mid=" + mid + ", rname=" + rname + ", rmin=" + rmin + ", rmax=" + rmax
				+ ", rprice=" + rprice + ", rimg1=" + rimg1 + ", rimg2=" + rimg2 + ", rimg3=" + rimg3 + ", rtype="
				+ rtype + ", rbedroom=" + rbedroom + ", rrestroom=" + rrestroom + ", rdiningroom=" + rdiningroom
				+ ", rkitchen=" + rkitchen + ", rtheme=" + rtheme + ", writedate=" + writedate + "]";
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
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
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getRmin() {
		return rmin;
	}
	public void setRmin(int rmin) {
		this.rmin = rmin;
	}
	public int getRmax() {
		return rmax;
	}
	public void setRmax(int rmax) {
		this.rmax = rmax;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public String getRimg1() {
		return rimg1;
	}
	public void setRimg1(String rimg1) {
		this.rimg1 = rimg1;
	}
	public String getRimg2() {
		return rimg2;
	}
	public void setRimg2(String rimg2) {
		this.rimg2 = rimg2;
	}
	public String getRimg3() {
		return rimg3;
	}
	public void setRimg3(String rimg3) {
		this.rimg3 = rimg3;
	}
	public int getRbedroom() {
		return rbedroom;
	}
	public void setRbedroom(int rbedroom) {
		this.rbedroom = rbedroom;
	}
	public int getRrestroom() {
		return rrestroom;
	}
	public void setRrestroom(int rrestroom) {
		this.rrestroom = rrestroom;
	}
	public int getRdiningroom() {
		return rdiningroom;
	}
	public void setRdiningroom(int rdiningroom) {
		this.rdiningroom = rdiningroom;
	}
	public int getRkitchen() {
		return rkitchen;
	}
	public void setRkitchen(int rkitchen) {
		this.rkitchen = rkitchen;
	}
	public String getRtheme() {
		return rtheme;
	}
	public void setRtheme(String rtheme) {
		this.rtheme = rtheme;
	}

	
}
