package matching;

import java.util.List;

import customer.CustomerApplyVO;

public interface MatchingDAO {
	List<CustomerApplyVO> suggestion_list(String helperID) throws Exception;

	int suggest(Integer SerialNo, String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list2_success(String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list2_yet(String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list2_fail(String HelperID) throws Exception;

}
