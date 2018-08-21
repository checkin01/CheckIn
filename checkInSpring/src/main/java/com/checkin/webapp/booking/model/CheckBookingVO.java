package com.checkin.webapp.booking.model;

public class CheckBookingVO {
	private int a;
	private int r;
	private String checkin;
	private String checkout;
	
	
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

	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	@Override
	public String toString() {
		return "CheckBookingVO [a=" + a + ", r=" + r +", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
}
