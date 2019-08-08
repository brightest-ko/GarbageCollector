package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;
import review.ReviewDAO;
import review.ReviewDAO_Impl;
import review.ReviewVO;


@RequestMapping("/customer_apply_list.do")
public class CtrlApplyList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CtrlList");		
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
		List<CustomerApplyVO> rl=dao.findAll1(customer_phone);
		request.setAttribute("rl", rl);
		System.out.println("rl : "+rl);
		

		ReviewDAO dao2 =new ReviewDAO_Impl();
		List<ReviewVO> rl_review=dao2.findAll(customer_phone);
		request.setAttribute("rl_review", rl_review);

		System.out.println(rl);
		System.out.println(rl_review);
		return "/customer/customer_list.jsp";
	}

}
