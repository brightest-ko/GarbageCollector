package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
import common.Util;

@RequestMapping("/certify/certify_info2.do")
public class CtrlInfo2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("info");
		System.out.println(request.getParameter("SerailNo"));
		int serino = Util.parseInt(request.getParameter("SerailNo"));
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
		return "/certify/certify_info.jsp";
		
	}

}
