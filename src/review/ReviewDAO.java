package review;

import java.util.List;

public interface ReviewDAO {
	public List<ReviewVO> viewDetail(String customerPhone) throws Exception; // 리스트에서 글 클릭시 
	public List<ReviewVO> findAll() throws Exception; // 전체리스트
	public List<ReviewVO> find( ReviewVO vo ) throws Exception; // 색인페이지
	public int insert( ReviewVO vo ) throws Exception; // 테스트용(지울예정)
	public int modify( ReviewVO vo ) throws Exception;
	public int delete( ReviewVO vo ) throws Exception;
}