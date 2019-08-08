package customer;

import javax.servlet.ServletException;
import java.sql.SQLException;
import java.util.List;

// git commit test
public interface CustomerApplyDAO {
	public void add(CustomerApplyVO vo) throws Exception;
	public List<CustomerApplyVO> findAll1(String customer_phone) throws Exception;
	public List<CustomerApplyVO> findAll2(String customer_phone) throws Exception;
	public boolean checkLoginInfo(String customer_phone) throws ServletException, SQLException;
	CustomerApplyVO findAll_cus(String serialNo) throws Exception;
	void update(String card_num) throws Exception;
}