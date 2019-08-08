package matching;

import java.sql.SQLException;
import java.util.List;

import customer.CustomerApplyVO;
import helper.HelperVO;

public interface MatchingDAO {
	List<HelperVO> acceptance_list(int serialNo) throws Exception;

	int suggest(Integer SerialNo, String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list(String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list_deadline(String HelperID) throws Exception;
	
	List<CustomerApplyVO> suggestion_list2_success(String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list2_yet(String HelperID) throws Exception;

	List<CustomerApplyVO> suggestion_list2_fail(String HelperID) throws Exception;

	int accept(Integer serialNo, String helperID) throws SQLException;



}
