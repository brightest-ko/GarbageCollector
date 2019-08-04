package certify;

import java.util.List;


public interface CertifyDAO {
	public List<CertifyVO> findAll() throws Exception;
	public int insert (CertifyVO vo) throws Exception;
	public int update (String details) throws Exception;
	int delete( String SerialNo ) throws Exception;
}