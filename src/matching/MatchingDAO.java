package matching;

import java.util.List;

import customer.CustomerApplyVO;

public interface MatchingDAO {
	List<CustomerApplyVO> suggestion_list(String helperID) throws Exception;

}
