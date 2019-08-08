package map;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MapDAO_OracleImpl implements MapDAO 
{
	@Override
	public List<MapVO> findAll() throws Exception {
		List<MapVO> ls = new ArrayList<MapVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM map order by mapNo desc";
			rs = stmt.executeQuery( sql );
			while( rs.next() ) {
				MapVO vo = new MapVO();
				
				vo.setMapNo( rs.getInt("mapNo") );
				vo.setMap_addr_front( rs.getString("map_addr_front") );
				vo.setMap_addr_detail(rs.getString("map_addr_detail") );
				
				ls.add( vo );
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












