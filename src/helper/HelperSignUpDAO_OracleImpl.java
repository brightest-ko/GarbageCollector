package helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

            String sql = "insert into helper values (?, ?, ?, ?, ?" +
                    ", ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, vo.getHelperId());
            stmt.setString(2, vo.getHelper_Phone());
            stmt.setString(3, vo.getHelper_Name());
            stmt.setString(4, vo.getSex());
            stmt.setString(5,vo.getBank_Name());
            stmt.setString(6, vo.getAccount());
            stmt.setString(7, vo.getAccount_Holder());
            stmt.setString(8, vo.getWish_Addr_Front1());
            stmt.setString(9, vo.getWish_Addr_Detail1());
            stmt.setString(10, vo.getWish_Addr_Front2());
            stmt.setString(11, vo.getWish_Addr_Detail2());
            stmt.setString(12, vo.getWish_Addr_Front3());
            stmt.setString(13, vo.getWish_Addr_Detail3());
            stmt.setString(14, vo.getWant_to_say());

            stmt.executeUpdate();
            System.out.println(vo.getHelperId());

            /*
            String sql = "insert into helper_t values (vo.getHelperId(), helper_Phone, helper_name, sex" +
                    "bank_Name, account_Holder, wish_Addr_Front1, wish_Addr_Detail1," +
                    "wish_Addr_Front2, wish_Addr_Detail2, wish_Addr_Front3, wish_Addr_Detail3," +
                    "want_to_say)";

            String sql = "insert into helper_t values (email, pw, helper_name,phoneNum, sex" +
                    "bank, account, accountname, null," +
                    "null, null, null, null," +
                    "message)";*/

            stmt.executeUpdate(sql);

        } catch (Exception e) {
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    @Override
    public List<HelperVO> findAll() throws Exception {
        return null;
    }
}


/*
    @Override
    public List<HelperVO> findAll() throws Exception {
        List<HelperVO> ls = new ArrayList<HelperVO>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR", "hr");
            stmt = conn.createStatement();

            String sql = "From bangmyung_t order by no desc";

            rs = stmt.executeQuery(sql);

            while( rs.next() ){
                HelperVO vo  = new HelperVO();
                vo.setHelperId();
                vo.setHelper_Phone();
                vo.setHelper_Name();
                vo.setSex();
                vo.setBank_Name();
                vo.setAccount();
                vo.setAccount_Holder();
                vo.setWish_Addr_Front1();
                vo.setWish_Addr_Detail1();
                vo.setWish_Addr_Front2();
                vo.setWish_Addr_Detail2();
                vo.setWish_Addr_Front3();
                vo.setWish_Addr_Detail3();
                vo.setWant_to_say();

                vo.setNo(rs.getInt("no"));
                vo.setGul(rs.getString("gul"));
                vo.setTheTime(rs.getString("theTime"));

                ls.add(vo);
            }
        }catch(Exception e){

        }
        finally {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }
        return ls;
    }
}

*/
/* 이전 코드
public class BangMyungDAO_OracleImpl implements BangMyungDAO {
    @Override
    public void add(BangMyungVO vo) throws Exception {

        Connection conn = null;
        Statement stmt = null;

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","hr");
            System.out.println(conn);

            stmt = conn.createStatement();

            String sql="insert into bangmyung_t values (seq_bangmyung.nextval,'"+ vo.getGul() +"',sysdate)";
            stmt.executeUpdate(sql);
        }
        catch(Exception e){
            throw e;
        }
        finally{
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }catch(SQLException e){ e.printStackTrace(); }
        }

        //response.sendRedirect("/study10/bangmyung_list");
    }

    @Override
    public List<BangMyungVO> findAll() throws Exception{
        List<BangMyungVO> ls = null;
        try{
            //WebContent/WEB-INF/lib에 ojdbc.jar넣고
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE","HR","hr");

            Statement stmt = conn.createStatement();
//          String sql = "select sysdate from dual";
            String sql = "select no, gul, theTime from bangmyung_t order by no desc";
            ResultSet rs = stmt.executeQuery(sql);

            ls = new ArrayList<BangMyungVO>();
            while(rs.next()){
//            theTime = rs.getString(1);
                BangMyungVO vo = new BangMyungVO();
                vo.setNo(rs.getInt(1));
                vo.setGul(rs.getString(2));
                vo.setTheTime(rs.getString(3));

                ls.add(vo);
            }



            rs.close();
            stmt.close();
            conn.close();

        }catch(Exception e){
            //에러가 난 정보를 역추적해서 출력해 준다.
            e.printStackTrace();
        }
        return ls;
    }

}
*/