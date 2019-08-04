package certify;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import certify.CertifyDAO;
import certify.CertifyDAO_OracleImpl;
import certify.CertifyVO;
import common.Controller;
import common.RequestMapping;


// modl
@RequestMapping("/certify_list.do")
public class CtrlList implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) 
			throws Exception {

		CertifyDAO dao = new CertifyDAO_OracleImpl();
		List<CertifyVO> rl = dao.findAll();
		
		request.setAttribute("rl", rl);
		return "/certify_list.jsp";
	}

}
