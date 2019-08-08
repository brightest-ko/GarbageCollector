package customer;

import java.util.List;

// git commit test
public interface CustomerApplyDAO {
	public void add(CustomerApplyVO vo) throws Exception;
	public List<CustomerApplyVO> findAll() throws Exception;
	void update(String phone, int price, String card_num) throws Exception;
}