package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_acceptance_list.do")
public class CtrlListAcceptance implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String auth = null;
		String customer_phone = null;
		try{
			auth = (String)session.getAttribute("auth");
			customer_phone =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("customer")||customer_phone==null||customer_phone.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp로 변경
		}
		
        String l = null;
        
		/*
		 select * from customer_apply where serialNo in (select serialNo from matcing where heplerID=?’로그인ID’ and suggestion = 1 and acceptance = 1) order by customer_apply_day desc
				 	
		 */
        MatchingDAO dao = new MatchingDAO_OracleImpl();
      //  List<CustomerApplyVO> rl = dao.suggestion_list(customer_phone);

      //  request.setAttribute("rl", rl);

		System.out.println("ControllerList TEST");
		return "/index.jsp";
	}

}
