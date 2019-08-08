package helper;

import javax.servlet.ServletException;
import java.sql.SQLException;
import java.util.List;

public interface HelperSignUpDAO {
    public void add(HelperVO vo) throws Exception;
    public boolean checkLoginInfo(String id, String password) throws ServletException, SQLException;
    //public String findHelper(HelperVO vo) throws Exception;
}

