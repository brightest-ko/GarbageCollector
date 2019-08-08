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
		System.out.println("/matching_suggetion_add.do ����");
		
		HttpSession session = request.getSession();
		String auth = null;
		String helperID = null;
		try{
			auth = (String)session.getAttribute("auth");
			helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}

		Integer serialNo = Util.parseInt(request.getParameter("serialNo"));
//		System.out.println("대행제안 : "+serialNo);
		MatchingDAO dao = new MatchingDAO_OracleImpl();
		int r = dao.suggest(serialNo,helperID);
//		if(r==1){
//			System.out.println("성공");
//		}else{
//			System.out.println("실패");
//		}
//		System.out.println("/matching_suggetion_add.do �Ϸ�");
		return "redirect:/matching_suggetion_list2.do";

	}

}