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
		System.out.println("CtrlList2");		
		HttpSession session = request.getSession();
		String auth ="customer";//= null;
		String customer_phone ="01094589584";//= null;
		try{
//			auth = (String)session.getAttribute("auth");
//			helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("customer")||customer_phone==null||customer_phone.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
		}
		
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		List<CustomerApplyVO> rl=dao.findAll2(customer_phone);
		request.setAttribute("rl", rl);
		System.out.println(rl);
		return "/customer/customer_list2.jsp";
	}

}
