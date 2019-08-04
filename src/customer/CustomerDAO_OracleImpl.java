package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO_OracleImpl implements CustomerDAO {
	@Override
	public void add(CustomerVO vo) throws Exception {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
	         stmt = conn.createStatement();
	         String sql="insert into customer values ('"+vo.getCustomer_phone()+"','"+vo.getAddr_front()+"')";	        	
	         stmt.executeUpdate(sql);
		}
		catch(Exception e){}
		finally{
			  try {
			         if (stmt != null )stmt.close();
			         if (conn != null )conn.close();
			         } catch (Exception e) {
			         }
			
		}
		
	}

	@Override
	public List<CustomerVO> findAll() throws Exception {
		List<CustomerVO> ls=new ArrayList<CustomerVO>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			 stmt=conn.createStatement();
			 String sql="select * from customer";
			 rs=stmt.executeQuery(sql);
			 while(rs.next()){
				 CustomerVO vo=new CustomerVO();
				 vo.setCustomer_phone(rs.getString(1));
				 vo.setAddr_front(rs.getString(2));
				 ls.add(vo);
			 }
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
	
   
}
