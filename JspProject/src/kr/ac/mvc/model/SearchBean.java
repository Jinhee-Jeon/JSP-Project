package kr.ac.mvc.model;



import univ.reservationInfo;

public class SearchBean{
	
	private reservationInfo r;
	private String chk;
	
	// 로그인한 유저가 존재하는지 여부를 판단
	public SearchBean(String s) {
		System.out.println("s : " + s);
		if(s==null) this.setChk("noUser");
		else this.setChk("userLogin");
	}
	public String getCheckUser() {
		System.out.println("chk : " + this.getChk());
		return this.getChk();
	}

	public String getChk() {
		return chk;
	}
	public void setChk(String chk) {
		this.chk = chk;
	}

}
