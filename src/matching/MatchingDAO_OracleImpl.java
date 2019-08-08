package matching;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.Util;
import customer.CustomerApplyVO;

public class MatchingDAO_OracleImpl implements MatchingDAO 
{

	@Override
	public List<CustomerApplyVO> suggestion_list(String HelperID) throws Exception {
		//���� ��û ����Ʈ
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
//			System.out.println("���� ��û ����Ʈ DAO");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			String sql = "select * from customer_apply "
					+ "where serialNo in (select serialNo from matching where helperID = ? and SUGGESTION =0 and ACCEPTANCE =0)"
					+ "and WANTED_TIME > SYSDATE + INTERVAL '1' HOUR";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setCustomer_phone(rs.getString("customer_phone"));
				vo.setCustomer_addr_first(rs.getString("customer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("customer_addr_second"));
				vo.setCustomer_addr_third(rs.getString("customer_addr_third"));
				vo.setBag_num(rs.getInt("bag_num"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setPrice(rs.getInt("price"));
				vo.setCard_num(rs.getString("card_num"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_apply_day(rs.getDate("customer_apply_day"));
				vo.setCertify_status(rs.getInt("certify_status"));
				vo.setReview_status(rs.getInt("review_status"));
				ls.add(vo);
			}		
			System.out.println("suggestion_list "+ls.toString());
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
	
	@Override
	public List<CustomerApplyVO> suggestion_list_deadline(String HelperID) throws Exception {
		//���� ��û ����Ʈ
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			String sql = "select * from customer_apply where serialNo in (select serialNo from matching where helperID = ? and SUGGESTION =0 and ACCEPTANCE =0) "
					+ "and (WANTED_TIME <= SYSDATE + INTERVAL '1' HOUR) and (WANTED_TIME >= SYSDATE)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setCustomer_phone(rs.getString("customer_phone"));
				vo.setCustomer_addr_first(rs.getString("ustomer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("ustomer_addr_second"));
				vo.setCustomer_addr_third(rs.getString("ustomer_addr_third"));
				vo.setBag_num(rs.getInt("bag_num"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setPrice(rs.getInt("price"));
				vo.setCard_num(rs.getString("card_num"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_apply_day(rs.getDate("customer_apply_day"));
				vo.setCertify_status(rs.getInt("certify_status"));
				vo.setReview_status(rs.getInt("review_status"));
				ls.add(vo);
			}			
			System.out.println("suggestion_list_deadline "+ls.toString());
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
	

	@Override
	public int suggest(Integer SerialNo, String HelperID) throws Exception {
		//�����ϱ�
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			System.out.println("�����ϱ� DAO");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			String sql = "update matching set suggestion = 1 where serialNo  = ? and helperID=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, SerialNo);
			stmt.setString(2, HelperID);
			r = stmt.executeUpdate();
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return r;
	}


	@Override
	public List<CustomerApplyVO> suggestion_list2_success(String HelperID) throws Exception {
		//�����ڰ� ������ ����Ʈ
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			String sql = "select * from customer_apply "
					+ "where serialNo in (select serialNo from matching where helperID=? and suggestion = 1 and acceptance = 1)"
					+ "order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setCustomer_phone(rs.getString("customer_phone"));
				vo.setCustomer_addr_first(rs.getString("customer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("customer_addr_second"));
				vo.setCustomer_addr_third(rs.getString("customer_addr_third"));
				vo.setBag_num(rs.getInt("bag_num"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setPrice(rs.getInt("price"));
				vo.setCard_num(rs.getString("card_num"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_apply_day(rs.getDate("customer_apply_day"));
				vo.setCertify_status(rs.getInt("certify_status"));
				vo.setReview_status(rs.getInt("review_status"));
				System.out.println("success vo: "+vo.toString());
				ls.add(vo);
			}			
			System.out.println(ls.toString());
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
	
	@Override
	public List<CustomerApplyVO> suggestion_list2_yet(String HelperID) throws Exception {
		//�����ڰ� ������ ����Ʈ
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			//��Ī���
			String sql = "select * from customer_apply "
					+ " where serialNo in (select serialNo from matching where helperID=? and suggestion = 1 and acceptance = 0)"
					+ " and helperID IS NULL and WANTED_TIME > SYSDATE"
					+ " order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setCustomer_phone(rs.getString("customer_phone"));
				vo.setCustomer_addr_first(rs.getString("customer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("customer_addr_second"));
				vo.setCustomer_addr_third(rs.getString("customer_addr_third"));
				vo.setBag_num(rs.getInt("bag_num"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setPrice(rs.getInt("price"));
				vo.setCard_num(rs.getString("card_num"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_apply_day(rs.getDate("customer_apply_day"));
				vo.setCertify_status(rs.getInt("certify_status"));
				vo.setReview_status(rs.getInt("review_status"));
				System.out.println("success vo: "+vo.toString());
				ls.add(vo);
			}			
			System.out.println(ls.toString());
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
	

	@Override
	public List<CustomerApplyVO> suggestion_list2_fail(String HelperID) throws Exception {
		//�����ڰ� ������ ����Ʈ
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			//��Ī����
			String sql = "select * from customer_apply "+
					"where serialNo in (select serialNo from matching where helperID = ? and suggestion = 1 and acceptance = 0) "+
					"and ((helperID IS NULL and WANTED_TIME > SYSDATE) or (helperID <> ?)) "+
					"order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			stmt.setString(2, HelperID);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				CustomerApplyVO vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setCustomer_phone(rs.getString("customer_phone"));
				vo.setCustomer_addr_first(rs.getString("customer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("customer_addr_second"));
				vo.setCustomer_addr_third(rs.getString("customer_addr_third"));
				vo.setBag_num(rs.getInt("bag_num"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setPrice(rs.getInt("price"));
				vo.setCard_num(rs.getString("card_num"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_apply_day(rs.getDate("customer_apply_day"));
				vo.setCertify_status(rs.getInt("certify_status"));
				vo.setReview_status(rs.getInt("review_status"));
				System.out.println("success vo: "+vo.toString());
				ls.add(vo);
			}			
			System.out.println(ls.toString());
		}
		catch( Exception e ){e.printStackTrace();}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
}












