package com.checkin.webapp.review.model;

public class ReviewVO {
	private int v; //리뷰시퀀스
	private int r; //룸시퀀스
	private String uid; //사용자아이디
	private int a; //숙박업소 시퀀스
	private String mid; //가맹점주인 아이디
	private int vgrade; //룸의 평점
	private String vimg1; //사용자가 올린 이미지
	private String vimg2; 
	private String vimg3;
	private String vcontent;//리뷰내용
	private String writedate;//작성날짜
	
	private int vcurpage; //현재 페이지
	private int vonepage; //한 페이지에 보여질 리스트 개수
	
	
	
	public int getVcurpage() {
		return vcurpage;
	}
	public void setVcurpage(int vcurpage) {
		this.vcurpage = vcurpage;
	}
	public int getVonepage() {
		return vonepage;
	}
	public void setVonepage(int vonepage) {
		this.vonepage = vonepage;
	}
	public int getV() {
		return v;
	}
	public void setV(int v) {
		this.v = v;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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
	public int getVgrade() {
		return vgrade;
	}
	public void setVgrade(int vgrade) {
		this.vgrade = vgrade;
	}
	public String getVimg1() {
		return vimg1;
	}
	public void setVimg1(String vimg1) {
		this.vimg1 = vimg1;
	}
	public String getVimg2() {
		return vimg2;
	}
	public void setVimg2(String vimg2) {
		this.vimg2 = vimg2;
	}
	public String getVimg3() {
		return vimg3;
	}
	public void setVimg3(String vimg3) {
		this.vimg3 = vimg3;
	}
	public String getVcontent() {
		return vcontent;
	}
	public void setVcontent(String vcontent) {
		this.vcontent = vcontent;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
