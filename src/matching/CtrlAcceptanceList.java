package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import common.Controller;
import common.RequestMapping;
import common.Util;
import customer.CustomerApplyDAO;
import customer.CustomerApplyDAO_OracleImpl;
import customer.CustomerApplyVO;
import helper.HelperVO;


@RequestMapping("/matching_acceptance_list.do")
public class CtrlAcceptanceList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String auth = null;
		String customer_phone = null;
		try{
			auth = (String)session.getAttribute("auth");
			customer_phone =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("customer")||customer_phone==null||customer_phone.equals("")){
				response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}
		

		int serialNo = Util.parseInt(request.getParameter("serialNo"));
		System.out.println("serialNo "+serialNo);
		CustomerApplyDAO dao = new CustomerApplyDAO_OracleImpl();
		CustomerApplyVO vo = dao.findAll_cus(serialNo);
        request.setAttribute("vo", vo);
		System.out.println("detail : "+vo.toString());
        MatchingDAO dao2 = new MatchingDAO_OracleImpl();
        List<HelperVO> rl = dao2.acceptance_list(serialNo);

        request.setAttribute("rl", rl);
		System.out.println("detail rl : "+rl.toString());

		return "/customer/customer_detail.jsp";
	}

}
