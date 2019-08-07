package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
import common.Util;

@RequestMapping("/certify/certify_find2.do")
public class CtrlFind2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String certify_no=request.getParameter("SerailNo");
		int serino = Util.parseInt(certify_no);
		System.out.println(serino);
		CertifyDAO dao = new CertifyDAO_OracleImpl();
		CertifyVO vo =null;
		try{
			vo = dao.find(serino);
		}
		catch(Exception e){
			throw e;
		}
		System.out.println(vo.getDetails());
		request.setAttribute("vo", vo);
		return "/certify/certify_update.jsp";
		
	}

}
