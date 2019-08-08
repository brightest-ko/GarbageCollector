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
		String auth ="customer";//= null;
		String customer_phone ="01094589584";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("customer")||customer_phone==null||customer_phone.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
		}
		
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		List<CustomerApplyVO> rl=dao.findAll1(customer_phone);
		request.setAttribute("rl", rl);
		

		ReviewDAO dao2 =new ReviewDAO_Impl();
		List<ReviewVO> rl_review=dao2.viewDetail(customer_phone);
		request.setAttribute("rl_review", rl_review);

		System.out.println(rl);
		System.out.println(rl_review);
		return "/customer/customer_list.jsp";
	}

}
