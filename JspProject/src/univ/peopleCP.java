package univ;


import java.sql.*; 

import javax.sql.DataSource; 


import java.util.ArrayList; 
import javax.naming.InitialContext; 

//DBCP�� �̿��� ���̺� student ó�� �����ͺ��̽� ���� �ڹٺ��� ���α׷�
public class peopleCP {
	private String SQL;
	private String Ord;
	private int result;
	private String tableName;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getOrd() {
		return Ord;
	}
	public void setOrd(String ord) {
		Ord = ord;
	}
	public String getSQL() {
		return SQL;
	}
	public void setSQL(String sql) {
		SQL = sql;
	}
	// �����ͺ��̽� ������ ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	// ����� DBCP �����ͼҽ� ã�� �����ϴ� ����
	public peopleCP() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	// �����ͼҽ��� ���� �����ͺ��̽��� ����, Connection ��ü�� �����ϴ� �޼ҵ� 
	void connect() {
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// �����ͺ��̽� ���� ���� �޼ҵ� 
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public ArrayList<peopleEntity> getPeopleList() {	
		connect();
		ArrayList<peopleEntity> list = new ArrayList<peopleEntity>();

		try {
			if(this.getOrd().equals("select")) {
				
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	
				while (rs.next()) {
					peopleEntity p = new peopleEntity();			
					p.setId ( rs.getString("people_id") );
					p.setPasswd ( rs.getString("password") );
					p.setName ( rs.getString("name") );
					p.setSocial_num (rs.getString("social_num") );
					p.setPhone ( rs.getString("phone") );
					p.setGender( rs.getString("gender") );
					p.setMileage ( rs.getInt("mileage") );
					//����Ʈ�� �߰�
					list.add(p);
					result++;
				}
				this.setResult(result); 
				rs.close();	
			}
			else {
				
				pstmt = con.prepareStatement(SQL);
				result=pstmt.executeUpdate();
				this.setResult(result); 
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public String isPasswd(String id, String passwd) {
		String success = "false";
		String orgPasswd="";
		connect();		
		String sql ="select password from people where people_id='"+ id+"'";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				orgPasswd = rs.getString(1);
			}
			
			if ( passwd.equals(orgPasswd) ) success = "true"; 
			System.out.println(success);
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	public ArrayList<nationEntity> getNationList() {	
		connect();
		ArrayList<nationEntity> list = new ArrayList<nationEntity>();

		
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				if(this.getTableName().equals("nation")) {
					while (rs.next()) {
						nationEntity n = new nationEntity();			
						n.setName( rs.getString("name"));
						n.setId(rs.getInt("nation_id"));
						//����Ʈ�� �߰�
						list.add(n);
						result++;
					}
				}
				else if(this.getTableName().equals("city")) {
					while (rs.next()) {
						nationEntity n = new nationEntity();			
						n.setName( rs.getString("name"));
						n.setId(rs.getInt("city_id"));
						//����Ʈ�� �߰�
						list.add(n);
						result++;
					}
					
				}
				
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<productEntity> getProductList() {	
		connect();
		ArrayList<productEntity> list = new ArrayList<productEntity>();
		
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					productEntity p = new productEntity();	
					p.setId( rs.getInt("product_id"));
					p.setName(rs.getString("name"));
					p.setCost( rs.getInt("cost"));
					p.setPicture(rs.getString("picture"));
					p.setStaff(rs.getInt("staff_id"));
					p.setProduct_id(rs.getInt("product_id"));
					list.add(p);
					result++;
				}
			
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<psEntity> getPsList() {	
		connect();
		ArrayList<psEntity> list = new ArrayList<psEntity>();
		
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					psEntity ps = new psEntity();	
					ps.setName(rs.getString("name"));
					ps.setDay(rs.getInt("day"));
					ps.setContents( rs.getString("contents"));
					ps.setPicture(rs.getString("picture"));
					list.add(ps);
					result++;
				}
			
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<staffEntity> getStaffList() {	
		connect();
		ArrayList<staffEntity> list = new ArrayList<staffEntity>();
		
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					staffEntity s = new staffEntity();
					s.setName(rs.getString("name"));
					s.setCareer(rs.getInt("career"));
					s.setGender(rs.getString("gender"));
					s.setPhone(rs.getString("phone"));
					s.setAge(rs.getInt("age"));
					result++;
					list.add(s);
				}
			
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}

	public ArrayList<airschedule> getAirschedule() {	
		connect();
		ArrayList<airschedule> list = new ArrayList<airschedule>();
		
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					airschedule s = new airschedule();
					s.setSchedule_id(rs.getInt("schedule_id"));
					s.setDeparture_date(rs.getDate("departure_date"));
					s.setArrival_date(rs.getDate("arrival_date"));
					s.setDeparture_time(rs.getTime("departure_time"));
					s.setArrival_time(rs.getTime("arrival_time"));
					s.setAirline_name(rs.getString("airline_name"));
					result++;
					list.add(s);
				}
			
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	public ArrayList<passport> getPassport() {	
		connect();
		ArrayList<passport> list = new ArrayList<passport>();
		
		try {	
			
			if(this.getOrd().equals("select")) {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					passport p = new passport();
					p.setName(rs.getString("name"));
					p.setEng_name(rs.getString("eng_name"));
					p.setBirth(rs.getString("birth"));
					p.setExdate(rs.getString("exdate"));
					list.add(p);
					result++;
				}
				this.setResult(result); 
				rs.close();	
			}
			else {
				
				pstmt = con.prepareStatement(SQL);
				result=pstmt.executeUpdate();
				this.setResult(result); 
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<reservation> getReservation() {	
		connect();
		ArrayList<reservation> list = new ArrayList<reservation>();
		
		try {	
			
			if(this.getOrd().equals("select")) {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
	 
				while (rs.next()) {
					reservation r = new reservation();
					r.setReserve_id(rs.getInt("reserve_id"));
					r.setReserve_date(rs.getString("reserve_date"));
					r.setPeople_num(rs.getInt("people_num"));
					r.setPeople_id(rs.getString("people_id"));
					r.setProduct_id(rs.getInt("product_id"));
					r.setSeat(rs.getInt("seat"));
					r.setPassport_num(rs.getString("passport_num"));
			
					list.add(r);
					result++;
				}
				this.setResult(result); 
				rs.close();	
			}
			else {
				pstmt = con.prepareStatement(SQL);
				result=pstmt.executeUpdate();
				this.setResult(result); 
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public int getReservationCnt(int product_id) {	
		connect();
		ArrayList<reservation> list = new ArrayList<reservation>();
		int cnt=0;
		try {	
			
		
				pstmt = con.prepareStatement("select * from reservation where product_id = "+ product_id);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					reservation r = new reservation();
					r.setReserve_id(rs.getInt("reserve_id"));
					r.setReserve_date(rs.getString("reserve_date"));
					r.setPeople_num(rs.getInt("people_num"));
					r.setPeople_id(rs.getString("people_id"));
					r.setProduct_id(rs.getInt("product_id"));
					r.setSeat(rs.getInt("seat"));
					r.setPassport_num(rs.getString("passport_num"));
					cnt++;
					list.add(r);
					result++;
				}
				this.setResult(result); 
				rs.close();	
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return cnt;
	}
	
	public ArrayList<rev> getRev() {	
		connect();
		ArrayList<rev> list = new ArrayList<rev>();
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					rev r = new rev();
					r.setCost(rs.getInt("cost"));
					r.setPassport_num(rs.getString("passport_num"));
					r.setPeople_num(rs.getInt("people_num"));
					r.setProduct_id(rs.getInt("product_id"));
					r.setProduct_name(rs.getString("product_name"));
					r.setReserve_date(rs.getString("reserve_date"));
					r.setReserve_id(rs.getInt("reserve_id"));
					r.setSeat(rs.getInt("seat"));
					list.add(r);
					result++;
				}
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<rev> getRevId() {	
		connect();
		ArrayList<rev> list = new ArrayList<rev>();
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					rev r = new rev();
					r.setCost(rs.getInt("cost"));
					r.setPassport_num(rs.getString("passport_num"));
					r.setPeople_num(rs.getInt("people_num"));
					r.setProduct_id(rs.getInt("product_id"));
					r.setProduct_name(rs.getString("product_name"));
					r.setReserve_date(rs.getString("reserve_date"));
					r.setReserve_id(rs.getInt("reserve_id"));
					r.setSeat(rs.getInt("seat"));
					list.add(r);
					result++;
				}
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	
	public ArrayList<reservationInfo> getInfo() {	
		connect();
		ArrayList<reservationInfo> list = new ArrayList<reservationInfo>();
		try {	
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					reservationInfo r = new reservationInfo();
					r.setPassport_num(rs.getString("passport_num"));
					r.setPeople_num(rs.getInt("people_num"));
					r.setProduct_id(rs.getInt("product_id"));
					r.setReserve_date(rs.getString("reserve_date"));
					r.setReserve_id(rs.getInt("reserve_id"));
					r.setSeat(rs.getInt("seat"));
					r.setAirline_name(rs.getString("airline_name"));
					r.setName(rs.getString("name"));
					r.setArrival_time(rs.getString("arrival_time"));
					r.setArrival_date(rs.getString("arrival_date"));
					r.setDeparture_time(rs.getString("departure_time"));
					r.setDeparture_date(rs.getString("departure_date"));
					r.setSeat(rs.getInt("seat"));
					r.setSchedule_id(rs.getInt("schedule_id"));
					r.setPeople_id(rs.getString("people_id"));
					result++;
					list.add(r);
				}
				this.setResult(result); 
				rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	
}
