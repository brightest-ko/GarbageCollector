package certify;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import certify.CertifyDAO;
import certify.CertifyDAO_OracleImpl;
import certify.CertifyVO;
import common.Controller;
import common.RequestMapping;


@RequestMapping("/certify/certify_list.do")
public class CtrlList implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) 
			throws Exception {

		CertifyDAO dao = new CertifyDAO_OracleImpl();
		
		//request.setAttribute("rl", rl);
		return "/certify/certify_list.jsp";
	}

}
