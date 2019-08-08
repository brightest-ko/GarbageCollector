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
				System.out.println("�ű�ȸ�� �߰� "+r);
			}
			PreparedStatement stmt2=null;
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

			java.sql.Date date=new java.sql.Date(vo.getWanted_time().getTime());
			stmt.setDate(7, date); //date�� ó���ϴ� ���
			//stmt.setDate(7,null);

			stmt.setInt(8, vo.getPrice());
			stmt.setString(9, vo.getCard_num());
			System.out.println(vo.getCustomer_addr_third());
			r = stmt.executeUpdate();
			System.out.println("insert customer_apply "+r);
			sql = "select serialNo from customer_apply where customer_phone = ?"
					+ " order by customer_apply_day desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustomer_phone());
			rs = stmt.executeQuery();
			int serialNo = rs.getInt("serialNo");
			System.out.println("�߰��� ��û serialNo "+serialNo);

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
			System.out.println("��û���� ���� ������ �°� ��õ�� ��� ���� "+ rs.toString());

			while( rs.next() ) {
				sql = "insert into matching(serialNo,helperID,suggestion,acceptance) values"
						+ "(?,?,0,0)";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, serialNo);
				stmt.setString(2, rs.getString("HelperID"));
				r = stmt.executeUpdate();
			}
			System.out.println("�����ڵ鿡�� ��õ�� "+ rs.toString());
			conn.commit();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<CustomerApplyVO> findAll_nohelper() throws Exception {

		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt=conn.createStatement();
			String sql="select * from customer_apply where review_status =0 order by SerialNo, customer_apply_day desc";
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				CustomerApplyVO vo=new CustomerApplyVO();
				vo.setSerialNo(rs.getInt(1));
				vo.setCustomer_phone(rs.getString(2));
				vo.setCustomer_addr_first(rs.getString(3));
				vo.setCustomer_addr_second(rs.getString(4));
				vo.setCustomer_addr_third(rs.getString(5));
				vo.setBag_num(rs.getInt(6));
				vo.setTrash_type(rs.getInt(7));
				vo.setWanted_time(rs.getDate(8));
				vo.setPrice(rs.getInt(9));
				vo.setCard_num(rs.getString(10));
				vo.setHelperID(rs.getString(11));
				vo.setCustomer_apply_day(rs.getDate(12));
				ls.add(vo);
			}
			rs.close();
		}catch(Exception e){
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
	public List<CustomerApplyVO> findAll_helper() throws Exception {

		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt=conn.createStatement();
			String sql="select * from customer_apply where helperID is not null";
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				CustomerApplyVO vo=new CustomerApplyVO();
				vo.setSerialNo(rs.getInt(1));
				vo.setCustomer_phone(rs.getString(2));
				vo.setCustomer_addr_first(rs.getString(3));
				vo.setCustomer_addr_second(rs.getString(4));
				vo.setCustomer_addr_third(rs.getString(5));
				vo.setBag_num(rs.getInt(6));
				vo.setTrash_type(rs.getInt(7));
				vo.setWanted_time(rs.getDate(8));
				vo.setPrice(rs.getInt(9));
				vo.setCard_num(rs.getString(10));
				vo.setHelperID(rs.getString(11));
				vo.setCustomer_apply_day(rs.getDate(12));
				ls.add(vo);
			}
			rs.close();
		}catch(Exception e){
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
	public void update(String phone,int price,String card_num) throws Exception
	{

		Connection conn=null;

		PreparedStatement stmt=null;
		PreparedStatement stmt1=null;

		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 String sql="update customer_apply set price=?,card_num=? where customer_phone=?";
			 String sql1="select count(*) from customer where customer_phone = ?";
			 stmt1=conn.prepareStatement(sql1);
			 ResultSet rs1=stmt1.executeQuery();
			 //업데이트
			 if(rs1.next()){
				 String s="update customer set customer_addr_first=?, customer_addr_second=?, customer_addr_third=? where customer_phone = ?";
				 PreparedStatement imsi=null;
				 imsi.setString(1,rs1.getString(3));
				 imsi.setString(2,rs1.getString(4));
				 imsi.setString(3,rs1.getString(5));
				 int a=imsi.executeUpdate();
				 System.out.println(a);
				 imsi.close();
			 }
			 //추가
			 else{
				 String s="insert into customer values(?,?,?,?)";
				 PreparedStatement imsi1=null;
				 imsi1=conn.prepareStatement(sql);			
				 imsi1.setInt(1, price);
				 imsi1.setString(2,card_num);
				 imsi1.setString(3,phone);
				 int a=imsi1.executeUpdate();
				 System.out.println(a+"d");
				 imsi1.close();
			 }
			 stmt.setInt(1,price);
			 stmt.setString(2,card_num);
			 stmt.setString(3,phone);
			 
		}catch(Exception e){
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
