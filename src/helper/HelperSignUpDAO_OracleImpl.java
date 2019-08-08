package helper;

import javax.servlet.ServletException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HelperSignUpDAO_OracleImpl implements HelperSignUpDAO {
    @Override
    public void add(HelperVO vo) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "hr");

            System.out.println("oracle Impl 왔따");

            String sql = "insert into helper values (?, ?, ?, ?, ?, ?" +
                    ", ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, vo.getHelperId());
            stmt.setString(2, vo.getHelperPw());
            stmt.setString(3, vo.getHelperPhotoOfn());
            stmt.setString(4, vo.getHelperPhotoFsn());
            stmt.setString(5, vo.getHelper_Phone());
            stmt.setString(6, vo.getHelper_Name());
            stmt.setString(7, vo.getSex());
            stmt.setString(8, vo.getBank_Name());
            stmt.setString(9, vo.getAccount());
            stmt.setString(10, vo.getAccount_Holder());
            stmt.setString(11, vo.getWish_Addr_Front1());
            stmt.setString(12, vo.getWish_Addr_Detail1());
            stmt.setString(13, vo.getWish_Addr_Front2());
            stmt.setString(14, vo.getWish_Addr_Detail2());
            stmt.setString(15, vo.getWish_Addr_Front3());
            stmt.setString(16, vo.getWish_Addr_Detail3());
            stmt.setString(17, vo.getWant_to_say());

            stmt.executeUpdate();
            //stmt.executeUpdate(sql);

        } catch (Exception e) {
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }


    public boolean checkLoginInfo(String id, String password) throws ServletException, SQLException {   // �α��� üũ �޼���
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "hr");
            if (conn == null)
                throw new Exception();

            String sql = "select helperpw from helper where helperid = ? ";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            System.out.println(id);

            rs = stmt.executeQuery();

            if (!rs.next())
                return false;

            String correctPassword = rs.getString("helperpw");
            if (password.equals(correctPassword)) {
                System.out.println("correct : " + password.equals(correctPassword));
                return true;
            }
            else
                return false;
        } catch (Exception e) {
            throw new ServletException(e);
        } finally {
            if ( rs != null ) stmt.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
}
