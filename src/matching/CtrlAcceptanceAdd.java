package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import common.Controller;
import common.RequestMapping;
import common.Util;
import customer.CustomerApplyVO;


@RequestMapping("/matching_acceptance_add.do")
public class CtrlAcceptanceAdd implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/matching_suggetion_add.do ����");
		
		HttpSession session = request.getSession();
		String auth = null;
		String customer_phone = null;
		try{
			auth = (String)session.getAttribute("auth");
			customer_phone =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||customer_phone==null||customer_phone.equals("")){
				response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}

		Integer serialNo = Util.parseInt(request.getParameter("serialNo"));
		String helperID = request.getParameter("helperID");
//		System.out.println("대행수락 : "+serialNo);
		MatchingDAO dao = new MatchingDAO_OracleImpl();
		int r = dao.accept(serialNo,helperID);
		if(r==1){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
		System.out.println("/customer_apply_list.do �Ϸ�");
		return "redirect:/customer_apply_list.do";

	}

}