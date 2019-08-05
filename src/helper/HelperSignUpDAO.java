package helper;

import java.util.List;

public interface HelperSignUpDAO {
    public void add(HelperVO vo) throws Exception;
    public List<HelperVO> findAll() throws Exception;
}

