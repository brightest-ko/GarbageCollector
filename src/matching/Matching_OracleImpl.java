package matching;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import study3.TalkRoomVO;

public class Matching_OracleImpl implements MatchingDAO 
{
	@Override
	public List<MatchingVO> findAll() throws Exception {
		List<MatchingVO> ls = new ArrayList<MatchingVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM map order by mapNo desc";

			String sql = "select * from talk_room_t where room_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, roomNo);
			rs = stmt.executeQuery();

//			System.out.println(rs.toString());
			if(rs.next()){
//				System.out.println(rs.getInt("room_no"));
				vo = new TalkRoomVO();
				vo.setRoomNo(rs.getInt("room_no"));
				vo.setApple(rs.getString("apple"));
				vo.setBanana(rs.getString("banana"));
				vo.setOrange(rs.getString("orange"));
			}			
		}
		catch( Exception e ){}
		finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( conn != null ) conn.close();
		}
		return ls;
	}
}












