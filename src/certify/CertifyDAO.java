package certify;

import java.util.List;


public interface CertifyDAO {
	public int insert (CertifyVO vo) throws Exception;
	public int update (CertifyVO vo) throws Exception;
	public CertifyVO find(Integer serialNo)throws Exception;
}