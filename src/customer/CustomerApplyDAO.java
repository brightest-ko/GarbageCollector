package customer;

import java.util.List;

// git commit test
public interface CustomerApplyDAO {
	public void add(CustomerApplyVO vo) throws Exception;
	void update(String phone, int price, String card_num) throws Exception;
	List<CustomerApplyVO> findAll_nohelper() throws Exception;
	List<CustomerApplyVO> findAll_helper() throws Exception;
}