package com.checkin.webapp.master.model;

public class MasterChartVO {
	private String mid;	
	private int bcount; // 예약 수
	private int vgrade; // 총 평점
	private int vcount; // 리뷰 개수
	private int rcount; // 룸 개수
	private String bookingdate;
	private int price;
	
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public int getVgrade() {
		return vgrade;
	}

	public void setVgrade(int vgrade) {
		this.vgrade = vgrade;
	}

	public int getVcount() {
		return vcount;
	}

	public void setVcount(int vcount) {
		this.vcount = vcount;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	public String getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}
	public MasterChartVO() {}
	
	public MasterChartVO(String mid, int bcount, int vgrade, int vcount, int rcount, int price) {
		super();
		this.mid = mid;
		this.bcount = bcount;
		this.vgrade = vgrade;
		this.vcount = vcount;
		this.rcount = rcount;
		this.price = price;
	}

	@Override
	public String toString() {
		return "MasterChartVO [mid=" + mid + ", bcount=" + bcount + ", vgrade=" + vgrade + ", vcount=" + vcount
				+ ", rcount=" + rcount + ", bookingdate=" + bookingdate + ", price=" + price + "]";
	}



	
	
	
}
