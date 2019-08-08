package review;

import java.util.List;

public interface ReviewDAO {
	public List<ReviewVO> find() throws Exception; // 색인페이지
	public int insert( ReviewVO vo ) throws Exception; // 테스트용(지울예정)
	public int modify( ReviewVO vo ) throws Exception;
	public int delete( ReviewVO vo ) throws Exception;
	public List<ReviewVO> findAll(String customer_phone) throws Exception;
}