package review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO_Impl implements ReviewDAO {
	
	@Override
	public List<ReviewVO> viewDetail(String customerPhone) throws Exception {
		System.out.println(customerPhone);
		  List<ReviewVO> ls = new ArrayList<ReviewVO>();
	      Connection conn=null;
	      PreparedStatement stmt=null;
	      ResultSet rs=null;

	      try{
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
	         String sql="select * from review where serialNo in ( " +
	         "select serialNo from customer_apply where customer_phone = ? and review_status =1 );";
	         // 고객번호가 있는 사람(로그인 한사람)중에 1이 후기 쓴사람. 
	         stmt = conn.prepareStatement(sql);
	         stmt.setString(1, customerPhone);  
	         rs=stmt.executeQuery();
	         System.out.println("rs "+rs.toString());
	         while( rs.next() ) {
	        	ReviewVO vo = new ReviewVO();
					
				vo.setSerialNo( rs.getInt("serialno") );
				vo.setHelperID( rs.getString("helperid") );
				vo.setReviewTitle( rs.getString("review_title") );
				vo.setReviewDay( rs.getDate("review_day") );
				vo.setRating( rs.getDouble("rating") );
				
	            ls.add(vo);
	         }
	      }
	      catch(Exception e){}
	      finally{
	        if( rs != null ) rs.close();
	 		if( stmt != null ) stmt.close();
	 		if( conn != null ) conn.close();
	      }
	      return ls;
	}
	
	@Override
	public List<ReviewVO> findAll() throws Exception {
		
		List<ReviewVO> ls = new ArrayList<ReviewVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt = conn.createStatement();
			
			String sql = "select serialno, helperid, review_title, review_day, rating from review order by serialno desc";
			rs = stmt.executeQuery( sql );
			while( rs.next() ) {
				ReviewVO vo = new ReviewVO();
				
				vo.setSerialNo( rs.getInt("serialno") );
				vo.setHelperID( rs.getString("helperid") );
				vo.setReviewTitle( rs.getString("review_title") );
				vo.setReviewDay( rs.getDate("review_day") );
				vo.setRating( rs.getDouble("rating") );
				
				ls.add(vo);
				System.out.println("test2");
			}
		}
		catch ( Exception e ) { System.out.println("error!");}
		finally{
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		System.out.println(ls.toString());
		return ls;
	}

	@Override
	public List<ReviewVO> find(ReviewVO vo) throws Exception { // 아직 미구현. 준비중
		/*Connection conn = null;
		PreparedStatement stmt = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql = "";
			
			stmt = conn.prepareStatement( sql );
		
		}
		catch ( Exception e ) {
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}*/
		System.out.println("미등록 불가능..");
		return null;
	}

	@Override
	public int insert(ReviewVO vo) throws Exception { // ok
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		System.out.println("insert start");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql = "insert into review " +
					"( serialno, helperid, review_title, review_pwd, rating, " + 
					"clean_place_add_front, review_content, review_day )" + 
					"values ( ?, ?, ?, ?, ?, ?, ?, ? )";
			stmt = conn.prepareStatement( sql );
			stmt.setInt( 1, vo.getSerialNo() );
			stmt.setString( 2, vo.getHelperID() );
			stmt.setString( 3, vo.getReviewTitle() );
			stmt.setString( 4, vo.getReviewPwd() );
			stmt.setDouble( 5, vo.getRating() );
			stmt.setString( 6, vo.getCleanPlaceAddFront() );
			stmt.setString( 7, vo.getReviewContent() );
			stmt.setDate( 8, vo.getReviewDay() ); //(Date)vo.getReviewDay()
			r = stmt.executeUpdate();
		}
		catch ( Exception e ) { System.out.println("error!");}
		finally{
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return r;
	}

	@Override
	public int modify(ReviewVO vo) throws Exception {
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql = "update review set (review_title,rating,clean_place_add_front,review_content) =" + 
					"( select ?, ?, ?, ? from dual) where serialno = ?";
			stmt = conn.prepareStatement( sql );
			stmt.setString( 1, vo.getReviewTitle() );
			stmt.setDouble( 2, vo.getRating() );
			stmt.setString( 3, vo.getCleanPlaceAddFront() );
			stmt.setString( 4, vo.getReviewContent() );
			stmt.setInt( 5, vo.getSerialNo() );
			
			r = stmt.executeUpdate();
		}
		catch ( Exception e ) { System.out.println("error!"); }
		finally{
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return r;
	}

	@Override
	public int delete(ReviewVO vo) throws Exception {
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			String sql = "delete from review where serialno = ?";
			
			stmt = conn.prepareStatement( sql );
			stmt.setInt( 1, vo.getSerialNo() );
			r = stmt.executeUpdate();
		}
		catch ( Exception e ) { System.out.println("error!");}
		finally{
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return r;
	}
	
}