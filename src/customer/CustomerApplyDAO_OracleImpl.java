package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CustomerApplyDAO_OracleImpl implements CustomerApplyDAO {

	@Override
	public void add(CustomerApplyVO vo) throws Exception {
		Connection conn = null;

		PreparedStatement stmt = null;
		ResultSet rs = null;
		int r = -1;

		/*
	private Integer serialNo;
	private String customer_phone;
	private String customer_addr_first;
	private String customer_addr_second;
	private String customer_addr_third;
	private Integer bag_num;
	private Integer trash_type;
	private Date wanted_time;
	private Integer price;
	private String card_num;
	private String helperID;
	private Date customer_apply_day;
	private Integer certify_status;
	private Integer review_status;
		 */

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			String sql = "select count(*) from customer where customer_phone = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			rs = stmt.executeQuery();

			if (rs.next()) { // null이 아닌경우, 즉 1번 이상 신청한 적이 있는 경우
				sql = "update customer set customer_addr_first=?, customer_addr_second=?, customer_addr_third=? where customer_phone = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, vo.getCustomer_addr_first());
				stmt.setString(1, vo.getCustomer_addr_second());
				stmt.setString(1, vo.getCustomer_addr_third());
				r = stmt.executeUpdate();
				System.out.println("기존회원 주소지 update"+r);
			}else {
				sql = "insert into customer(customer_addr_first, customer_addr_second, customer_addr_third, customer_phone) values"
						+ "(?,?,?,?);";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, vo.getCustomer_addr_first());
				stmt.setString(2, vo.getCustomer_addr_second());
				stmt.setString(3, vo.getCustomer_addr_third());
				stmt.setString(4, vo.getCustomer_phone());
				r = stmt.executeUpdate();
				System.out.println("신규회원 추가 "+r);
			}

			sql = "insert into customer_apply(serialNo, customer_phone, customer_addr_first,customer_addr_second,customer_addr_third,"
					+ "bag_num,trash_type,wanted_time,price,card_num,helperID,customer_apply_day,certify_status,review_status"
					+ " values(customer_apply_seq.NEXTVAL,?,?,?,?,?,?,null,sysdate,0,0)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			stmt.setString(2, vo.getCustomer_addr_first());
			stmt.setString(3, vo.getCustomer_addr_second());
			stmt.setString(4, vo.getCustomer_addr_third());
			stmt.setInt(5, vo.getBag_num());
			stmt.setInt(6, vo.getTrash_type());
			stmt.setDate(7, new java.sql.Date(vo.getWanted_time().getTime())); //date형 처리하는 방법
			stmt.setInt(8, vo.getPrice());
			stmt.setString(9, vo.getCard_num());
			r = stmt.executeUpdate();
			System.out.println("insert customer_apply "+r);
			
			
			sql = "select serialNo from customer_apply where customer_phone = ?"
					+ "order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			rs = stmt.executeQuery();
			int serialNo = rs.getInt("serialNo");
			System.out.println("추가된 신청 serialNo "+serialNo);
			

			sql = "select helperID from helper where (wish_addr_first1 = ? and wish_addr_second1 =?)"
					+ " or (wish_addr_first2 = ? and wish_addr_second2 =?)"
					+ " or (wish_addr_first3 = ? and wish_addr_second3 =?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_addr_first());
			stmt.setString(2, vo.getCustomer_addr_second());
			stmt.setString(3, vo.getCustomer_addr_first());
			stmt.setString(4, vo.getCustomer_addr_second());
			stmt.setString(5, vo.getCustomer_addr_first());
			stmt.setString(6, vo.getCustomer_addr_second());
			rs = stmt.executeQuery();
			System.out.println("신청서를 토대로 지역에 맞게 추천할 사람 선정 "+ rs.toString());

			while( rs.next() ) {
				sql = "insert into matching(serialNo,helperID,suggestion,acceptance) values"
					+ "(?,?,0,0)";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, serialNo);
				stmt.setString(2, rs.getString("HelperID"));
				r = stmt.executeUpdate();
			}
			System.out.println("대행자들에게 추천됨 "+ rs.toString());
			
			conn.commit();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<CustomerApplyVO> findAll() throws Exception {
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			stmt = conn.createStatement();
			String sql = "select * from customer_apply";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getString(1));
				vo.setCustomer_phone(rs.getString(2));
				vo.setAddr_front(rs.getString(3));
				vo.setHelperID((rs.getString(4)));
				vo.setAddr_detail(rs.getString(5));
				vo.setBag_num(rs.getString(6));

				vo.setTrash_type(rs.getString(7).split(","));
				vo.setTime_wanted(rs.getString(8).split(","));
				vo.setLast_time(rs.getString(9));
				vo.setPrice(rs.getString(10));
				vo.setCard_num(rs.getString(11));
				ls.add(vo);
			}
			rs.close();

		} catch (Exception e) {
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}

		}
		return ls;

	}

	@Override
	public void update(String phone, String price, String card_num) throws Exception {

		Connection conn = null;

		PreparedStatement stmt = null;

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			String sql = "update customer_apply set price=?,card_num=? where customer_phone=?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, price);
			stmt.setString(2, card_num);
			stmt.setString(3, phone);
			int a = stmt.executeUpdate();
			System.out.println(a + "d");
		} catch (Exception e) {
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}

		}

	}

}
