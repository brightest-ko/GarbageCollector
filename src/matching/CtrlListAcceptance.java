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
			helperVO_list = select * from helper where  helperID in
		 	(select helperID  from matching where serialNo = ?'serialNo' and suggestion =1 and acceptance =0)		 	
		 */
        MatchingDAO dao = new Matching_OracleImpl();
      //  List<CustomerApplyVO> rl = dao.suggestion_list(customer_phone);

      //  request.setAttribute("rl", rl);

		System.out.println("ControllerList TEST");
		return "/index.jsp";
	}

}
