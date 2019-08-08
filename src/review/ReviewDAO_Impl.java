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
	public List<ReviewVO> findAll(String customer_phone) throws Exception {
		
		List<ReviewVO> ls = new ArrayList<ReviewVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt = conn.createStatement();
			String sql = "select serialno, helperid, review_title, review_day, rating, clean_place_addr_front, review_content from review order by serialno desc";
			
			rs = stmt.executeQuery( sql );
		
			while( rs.next() ) {
				ReviewVO vo = new ReviewVO();
				
				vo.setSerialNo( rs.getInt("serialno") );
				vo.setHelperID( rs.getString("helperid") );
				vo.setReviewTitle( rs.getString("review_title") );
				vo.setReviewDay( rs.getDate("review_day") );
				vo.setRating( rs.getDouble("rating") );
				vo.setCleanPlaceAddrFront( rs.getString("clean_place_addr_front") );
				vo.setReviewContent( rs.getString("review_content") );
				ls.add(vo);
				System.out.println("test2");
			}
			System.out.println("ds");
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
	public List<ReviewVO> find() throws Exception { // 아직 미구현. 준비중
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
					"( serialno, helperid, review_title, rating, " + 
					"clean_place_addr_front, review_content, review_day )" + 
					"values ( ?, ?, ?, ?, ?, ?, ?, ? )";
			stmt = conn.prepareStatement( sql );
			stmt.setInt( 1, vo.getSerialNo() );
			stmt.setString( 2, vo.getHelperID() );
			stmt.setString( 3, vo.getReviewTitle() );
			stmt.setDouble( 4, vo.getRating() );
			stmt.setString( 5, vo.getCleanPlaceAddrFront() );
			stmt.setString( 6, vo.getReviewContent() );
			stmt.setDate( 7, vo.getReviewDay() ); //(Date)vo.getReviewDay()
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
			String sql = "update review set (review_title,rating,clean_place_addr_front,review_content) =" + 
					"( select ?, ?, ?, ? from dual) where serialno = ?";
			stmt = conn.prepareStatement( sql );
			stmt.setString( 1, vo.getReviewTitle() );
			stmt.setDouble( 2, vo.getRating() );
			stmt.setString( 3, vo.getCleanPlaceAddrFront() );
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