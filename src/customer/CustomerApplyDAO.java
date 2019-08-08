package customer;

import java.util.List;

// git commit test
public interface CustomerApplyDAO {
	public void add(CustomerApplyVO vo) throws Exception;
	void update(String phone, int price, String card_num) throws Exception;
	public List<CustomerApplyVO> findAll1(String customer_phone) throws Exception;
	public List<CustomerApplyVO> findAll2(String customer_phone) throws Exception;
}