package univ;

public class reservation {
	private int reserve_id;

	private String reserve_date;
	private int people_num;
	private String people_id;
	private int product_id;
	private int seat;
	private String passport_num;
	private int cnt =0;
	
	
	public String getPassport_num() {
		return passport_num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public void setCnt() {
		this.cnt++;
	}
	public void setPassport_num(String passport_num) {
		this.passport_num = passport_num;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	public String getPeople_id() {
		return people_id;
	}
	public void setPeople_id(String people_id) {
		this.people_id = people_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}

}
