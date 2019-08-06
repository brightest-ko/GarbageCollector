package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
import common.Util;

@RequestMapping("/certify_find2.do")
public class CtrlFind2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int serino = Util.parseInt(request.getParameter("certify_serialNo"));
		CertifyDAO dao = new CertifyDAO_OracleImpl();
		CertifyVO vo =null;
		try{
			vo = dao.find(serino);
		}
		catch(Exception e){
			throw e;
		}
		System.out.println(vo.getDetails());
	//	System.out.println(vo.getHousePlace());
		request.setAttribute("vo", vo);
		return "/certify/certify_update.jsp";
		
	}

}
