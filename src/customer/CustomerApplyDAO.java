package customer;

import java.util.List;

// git commit test
public interface CustomerApplyDAO {
	public void add(CustomerApplyVO vo) throws Exception;
	public List<CustomerApplyVO> findAll() throws Exception;
	public void update(String helperID,String card_num,String price) throws Exception;
}