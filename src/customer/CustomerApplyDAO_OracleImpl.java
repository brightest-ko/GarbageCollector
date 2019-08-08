package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CustomerApplyDAO_OracleImpl implements CustomerApplyDAO {


    @Override
    public void add(CustomerApplyVO vo) throws Exception {

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt1=null;
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
			String sql = "select * from customer where customer_phone = ?";
			stmt1 = conn.prepareStatement(sql);
			stmt1.setString(1, vo.getCustomer_phone());
			rs = stmt1.executeQuery();

			if (rs.next()) { // null�� �ƴѰ��, �� 1�� �̻� ��û�� ���� �ִ� ���

				System.out.println("0ro");
				sql = "update customer set customer_addr_first=?, customer_addr_second=?, customer_addr_third=? where customer_phone = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, vo.getCustomer_addr_first());
				stmt.setString(2, vo.getCustomer_addr_second());
				stmt.setString(3, vo.getCustomer_addr_third());
				stmt.setString(4, vo.getCustomer_phone());
				r = stmt.executeUpdate();
				System.out.println("����ȸ�� �ּ��� update"+r);
			}else {
				System.out.println(vo.toString());
				sql = "insert into customer (customer_addr_first, customer_addr_second, customer_addr_third, customer_phone) values (?,?,?,?)";
		
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, vo.getCustomer_addr_first());
				stmt.setString(2, vo.getCustomer_addr_second());
				stmt.setString(3, vo.getCustomer_addr_third());
				stmt.setString(4, vo.getCustomer_phone());
				r = stmt.executeUpdate();
				System.out.println("�ű�ȸ�� �߰345� "+r);
			}
			PreparedStatement stmt2=null;
			System.out.println(vo.toString());
			
			sql = "insert into customer_apply(serialNo, customer_phone, customer_addr_first,customer_addr_second,customer_addr_third,"
					+ "bag_num,trash_type,wanted_time,price,card_num,helperID,customer_apply_day,certify_status,review_status)"
					+ " values(customer_apply_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,null,sysdate,0,0)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			stmt.setString(2, vo.getCustomer_addr_first());
			stmt.setString(3, vo.getCustomer_addr_second());
			stmt.setString(4, vo.getCustomer_addr_third());
			stmt.setInt(5, vo.getBag_num());
			stmt.setInt(6, vo.getTrash_type());
			
			
			stmt.setDate(7,vo.getWanted_time()); //date�� ó���ϴ� ���
			//stmt.setDate(7,null);

			stmt.setInt(8, vo.getPrice());
			stmt.setString(9, vo.getCard_num());
			System.out.println("!"+vo.getCustomer_addr_third());
			
			
			r = stmt.executeUpdate();
			System.out.println("insert customer_appldsfy "+r);
			
			sql = "select serialNo from customer_apply where customer_phone = ?"
					+ " order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			ResultSet rs1 = stmt.executeQuery();
			int serialNo=0;
			if(rs1.next())
			{
				serialNo = rs1.getInt("serialNo");
				System.out.println("�߰��� ��û serialNo "+serialNo);
			}
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
			while( rs.next() ) {
				System.out.println("��û���� ���� ������ �°� ��õ�� ��� ���� "+ rs.toString());

				sql = "insert into matching(serialNo,helperID,suggestion,acceptance) values"
						+ "(?,?,0,0)";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, serialNo);
				stmt.setString(2, rs.getString("HelperID"));
				r = stmt.executeUpdate();
			}
			System.out.println("�����ڵ鿡�� ��õ��  끝.");
			
			conn.commit();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CustomerApplyVO> findAll1(String customer_phone) throws Exception {
		System.out.println(customer_phone);
		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql="select * from customer_apply where customer_phone = '01094589584' and review_status =0 "
					+ "and (WANTED_TIME >= SYSDATE) "
					+ "order by SerialNo, customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
//			stmt.setString(1, customer_phone);
			rs=stmt.executeQuery();
			System.out.println("rs "+rs.toString());
			while(rs.next()){
				CustomerApplyVO vo=new CustomerApplyVO();
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
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return ls;

	}


	@Override
	public List<CustomerApplyVO> findAll2(String customer_phone) throws Exception {

		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql="select * from customer_apply"
					+ " where customer_phone = ?"
					+ " and (WANTED_TIME < SYSDATE or (serialNo in (select serialNo from matching where suggestion = 1 and acceptance = 1)))";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customer_phone);
			rs=stmt.executeQuery();
			while(rs.next()){
				CustomerApplyVO vo=new CustomerApplyVO();
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
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
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
	public CustomerApplyVO findAll_cus(String serialNo) throws Exception{
		CustomerApplyVO rl=new CustomerApplyVO();
		Connection conn=null;

		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 String sql="select * from customer_apply where serialNo=?";
			 stmt=conn.prepareStatement(sql);
			 stmt.setString(1,serialNo);
			 rs=stmt.executeQuery();
			 //업데이트
			 if(rs.next()){
				 System.out.println("상세있음");
				 rl.setBag_num(rs.getInt("bag_num"));
				 rl.setCard_num(rs.getString("card_num"));
				 rl.setCustomer_addr_first(rs.getString("customer_addr_first"));
				 rl.setCustomer_addr_second(rs.getString("customer_addr_second"));
				 rl.setCustomer_addr_third(rs.getString("customer_addr_third"));
				 rl.setCustomer_phone(rs.getString("customer_phone"));
				 rl.setPrice(rs.getInt("price"));
				 rl.setTrash_type(rs.getInt("trash_type"));
				 rl.setWanted_time(rs.getDate("wanted_time"));
			 }
			 else{
				 System.out.println("상세없음");
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
		}
		return rl;
	}
		
	@Override
	public void update(String phone,String card_num) throws Exception
	{

		Connection conn=null;

		PreparedStatement stmt=null;
		PreparedStatement stmt1=null;

		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 String sql="update customer_apply set card_num=? where customer_phone=?";
			 String sql1="select count(*) from customer where customer_phone = ?";
			 stmt1=conn.prepareStatement(sql1);
			 stmt1.setString(1,phone);
			 ResultSet rs1=stmt1.executeQuery();
			 stmt=conn.prepareStatement(sql);
			 //업데이트
			 if(rs1.next()){
				 System.out.println("있음");
				 
				 stmt.setString(1,card_num);
				 stmt.setString(2,phone);
				 int a=stmt.executeUpdate();
				 System.out.println("업데이트"+a);
			 }
			 else{
				 System.out.println("없음");
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}

	}
	}

}

