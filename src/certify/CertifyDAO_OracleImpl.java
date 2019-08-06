package certify;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CertifyDAO_OracleImpl implements CertifyDAO {
	@Override
	public int insert(CertifyVO vo) throws Exception {
		System.out.println("insert");
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			String sql = "insert into certify values( ?,?,?,?,?,?,sysdate)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getSerialNo());
			stmt.setString(2, vo.getHelperID());
			stmt.setString(3, vo.getDetails());
			stmt.setString(4, vo.getHousePlace());
			stmt.setString(5, vo.getCertify_photo_ofn());
			stmt.setString(6, vo.getCertify_photo_fsn());
			stmt.executeUpdate();
			// System.out.println(r);

			conn.close();
		} catch (Exception e) {
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}

		}
		return r;
	}

	@Override
	public int update(CertifyVO vo) throws Exception {
		System.out.println("update");
		int r = -1;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			String sql = "update certify set details=? HOUSEPLACE=? CERTIFY_PHOTO_OFN=? CERTIFY_PHOTO_FSN=? where serialno=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getDetails());
			stmt.setString(2, vo.getHousePlace());
			stmt.setString(3, vo.getCertify_photo_ofn());
			stmt.setString(4, vo.getCertify_photo_fsn());
			stmt.setInt(5, vo.getSerialNo());
			System.out.println(stmt);
			System.out.println("serialNo: "+vo.getSerialNo());
			
			
			System.out.println(stmt.executeUpdate());

			conn.close();
		} catch (Exception e) {
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}

		}
		return r;
	}
	@Override
	public CertifyVO find(Integer serialNo) throws Exception {
		CertifyVO vo =null;
		Exception err =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			String sql = "select * from certify where serialNo = ?";
			stmt= conn.prepareStatement(sql);
			stmt.setInt(1,serialNo);
			rs = stmt.executeQuery();

			while (rs.next()) {
				vo = new CertifyVO();
				vo.setSerialNo(rs.getInt("serialNo"));
				vo.setHelperID(rs.getString("helperID"));
				vo.setDetails(rs.getString("details"));
				vo.setHousePlace(rs.getString("housePlace"));
				vo.setCertify_photo_ofn(rs.getString("certify_photo_ofn"));
				vo.setCertify_photo_fsn(rs.getString("certify_photo_fsn"));
				vo.setCertify_day(rs.getDate("certify_day"));
			}

		} catch (Exception e) {
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}

		}
		return vo;
	}
}
