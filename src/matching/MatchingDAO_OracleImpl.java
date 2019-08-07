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
		//서비스 요청 리스트
		List<CustomerApplyVO> ls = new ArrayList<CustomerApplyVO>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			System.out.println("서비스 요청 리스트 DAO");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","HR");

			String sql = "select * from customer_apply where serialNo in (select serialNo from matching where helperID = ? and SUGGESTION =0 and ACCEPTANCE =0)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, HelperID);
			rs = stmt.executeQuery();

			System.out.println("rs: "+rs.toString());
			
			CustomerApplyVO vo = null;
			if(rs.next()){
				vo = new CustomerApplyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setCustomer_addr_first(rs.getString("customer_addr_first"));
				vo.setCustomer_addr_second(rs.getString("customer_addr_second"));
				vo.setWanted_time(rs.getDate("wanted_time"));
				vo.setTrash_type(rs.getInt("trash_type"));
				vo.setPrice(rs.getInt("price"));
				System.out.println("vo: "+vo.toString());
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












