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

public class CustomerApplyDAO_OracleImpl implements CustomerApplyDAO{
	
	@Override
	public void add(CustomerApplyVO vo) throws Exception {
		
		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		
		PreparedStatement stmt=null;
		
		try{
		
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 String sql="insert into customer_apply values(?,?,?,?,?,?,?,?,?,?,sysdate,?,0,0)";
			 stmt=conn.prepareStatement(sql);
			 System.out.println(vo.toString());
			 /*
			  * 
			  * 정보있는지 확인하는 controller
			  *          select count(*) from customer where customer_phone = ?
         if(rs.hasnext())
            update customer set customer_addr_front=?, customer_addr_detail=? where customer_phone = ?
            insert into customer_apply
         else
            insert into customer
            insert into customer_apply
			  * 
			  * */
			 stmt.setInt(1,vo.getSerialNo());
			 stmt.setString(2,vo.getCustomer_phone());
			 stmt.setString(3,vo.getCustomer_addr_first());
			 stmt.setString(4,vo.getCustomer_addr_second());
			 stmt.setString(5,vo.getCustomer_addr_third());
			 stmt.setInt(6,vo.getBag_num());
			 stmt.setInt(7,vo.getTrash_type());
			 //setDate가 먹으려면-->java.sql.Dateimport해야함 util이아니라
			 stmt.setDate(8,vo.getWanted_time());
			 stmt.setInt(9,vo.getPrice());
			 stmt.setString(10,vo.getCard_num());
			 stmt.setString(11,vo.getHelperID());
			 int a=stmt.executeUpdate();
			 System.out.println(a+"d");
			 stmt.close();
			 conn.close();
			 
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	}
	@Override
	public List<CustomerApplyVO> findAll() throws Exception {
		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 stmt=conn.createStatement();
			 String sql="select * from customer_apply";
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
		         if (stmt != null )stmt.close();
		         if (conn != null )conn.close();
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
		finally{
			try {
		         if (stmt != null )stmt.close();
		         if (conn != null )conn.close();
		         } catch (Exception e) {
		         }
			
		}
	
		
	}

}

