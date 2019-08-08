package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/customer_apply_list2.do")
public class CtrlApplyList2 implements Controller{

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
		
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		List<CustomerApplyVO> rl=dao.findAll2(customer_phone);
		request.setAttribute("rl", rl);
		System.out.println(rl);
		return "/customer/customer_list2.jsp";
	}

}
