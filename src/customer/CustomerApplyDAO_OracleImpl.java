package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerApplyDAO_OracleImpl implements CustomerApplyDAO{
	
	@Override
	public void add(CustomerApplyVO vo) throws Exception {
		
		List<CustomerApplyVO> ls=new ArrayList<CustomerApplyVO>();
		Connection conn=null;
		
		PreparedStatement stmt=null;

		
		/*
		 * 
		 * create table customer_apply(
	serialNo varchar2(8) not null, 
	customer_phone varchar2(11) not null,
	customer_addr_front varchar2(40) not null , 
	customer_addr_detail varchar2(45) not null,
	bag_num number not null, 
	trash_type number not null,
	wanted_time varchar2(50) not null, 
	last_time number not null, 
	card_num varchar2(20), 
	helperID varchar2(25),
	price number,
	customer_apply_day date not null 
); 

		 * */
		try{
		
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");		
			 String sql="insert into customer_apply values(?,?,?,?,?,?,?,?,?,?,?)";
			 stmt=conn.prepareStatement(sql);
			 stmt.setString(1,vo.getSerialNo());
			 stmt.setString(2,vo.getCustomer_phone());
			 stmt.setString(3,vo.getAddr_front());
			 stmt.setString(4,vo.getHelperID());
			 stmt.setString(5,vo.getAddr_detail());
			 stmt.setInt(6,vo.getBag_num());
			 stmt.setInt(7,vo.getTrash_type());
			 stmt.setString(8,vo.getTime_wanted());
			 stmt.setInt(9,vo.getLast_time());
			 stmt.setInt(10,vo.getPrice());
			 stmt.setString(11,vo.getCard_num());
			 int a=stmt.executeUpdate();
			 System.out.println(a+"d");
			 conn.commit();
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
	public void update(String phone,String price,String card_num) throws Exception
	{
		
		Connection conn=null;
		
		PreparedStatement stmt=null;
		
		try{

			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 String sql="update customer_apply set price=?,card_num=? where customer_phone=?";
			 
			 stmt=conn.prepareStatement(sql);			
			 stmt.setString(1, price);
			 stmt.setString(2,card_num);
			 stmt.setString(3,phone);
			 int a=stmt.executeUpdate();
			 System.out.println(a+"d");
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

