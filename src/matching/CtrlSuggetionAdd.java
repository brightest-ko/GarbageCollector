package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import common.Controller;
import common.RequestMapping;
import common.Util;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_add.do")
public class CtrlSuggetionAdd implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/matching_suggetion_add.do ½ÃÀÛ");
		
		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jspë¡? ë³?ê²?
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jspë¡? ë³?ê²?
		}

		Integer serialNo = Util.parseInt(request.getParameter("serialNo"));
		MatchingDAO dao = new MatchingDAO_OracleImpl();
		int r = dao.suggest(serialNo,helperID);

		System.out.println("/matching_suggetion_add.do ¿Ï·á");
		return "redirect:/matching_suggetion_list2.do";

	}

}