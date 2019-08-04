package customer;

import java.util.List;
public interface CustomerDAO {
	public void add(CustomerVO vo) throws Exception;
	public List<CustomerVO> findAll() throws Exception;
}
