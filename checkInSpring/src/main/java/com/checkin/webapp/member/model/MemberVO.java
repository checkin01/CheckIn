package com.checkin.webapp.member.model;

public class MemberVO {
	private int u; //시퀀스
	private String uuid;//유저아이디
	private String upwd;//유저비밀번호
	private String uname;//유저이름
	private String uaddr;//유저 주소(시만 작성)
	private String utel;//전화번호
	private String birth; //생년월일(8자리+성별(1 or 2))
	private String uemail; //이메일
	private int upoint;// 포인트 (default 0)
	private String utheme; //선호하는 테마
	private String writedate; //가입날짜
	
	private String logStatus;
	
	@Override
	public String toString() {
		return "MemberVO [u=" + u + ", uuid=" + uuid + ", upwd=" + upwd + ", uname=" + uname + ", uaddr=" + uaddr
				+ ", utel=" + utel + ", birth=" + birth + ", uemail=" + uemail + ", upoint=" + upoint + ", utheme="
				+ utheme + ", writedate=" + writedate + ", logStatus=" + logStatus + ", ucurpage=" + ucurpage
				+ ", uonepage=" + uonepage + ", usearchkey=" + usearchkey + ", usearchvalue=" + usearchvalue + "]";
	}
	private int ucurpage; //현재 페이지
	private int uonepage; //한 페이지에 보여질 리스트 개수
	private String usearchkey;//검색조건
	private String usearchvalue; //검색값
	
	public int getU() {
		return u;
	}
	public void setU(int u) {
		this.u = u;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUaddr() {
		return uaddr;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	public String getUtheme() {
		return utheme;
	}
	public void setUtheme(String utheme) {
		this.utheme = utheme;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getLogStatus() {
		return logStatus;
	}
	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
	public int getUcurpage() {
		return ucurpage;
	}
	public void setUcurpage(int ucurpage) {
		this.ucurpage = ucurpage;
	}
	public int getUonepage() {
		return uonepage;
	}
	public void setUonepage(int uonepage) {
		this.uonepage = uonepage;
	}
	public String getUsearchkey() {
		return usearchkey;
	}
	public void setUsearchkey(String usearchkey) {
		this.usearchkey = usearchkey;
	}
	public String getUsearchvalue() {
		return usearchvalue;
	}
	public void setUsearchvalue(String usearchvalue) {
		this.usearchvalue = usearchvalue;
	}
	
	
	
}
