package customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
import common.Util;

@RequestMapping("/customer_apply_two.do")
public class CtrlInsert implements Controller{
//����â������û��ư������ insert
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CtrlInsert");
		String two_phone=Util.h(request.getParameter("two_phone"));
		String customer_addr_first=Util.h(request.getParameter("customer_addr_first"));
		String customer_addr_second=Util.h(request.getParameter("customer_addr_second"));
		String customer_addr_third=Util.h(request.getParameter("customer_addr_third"));		
		int bag_num=Integer.parseInt(request.getParameter("bag_num"));
		int trash_type=Integer.parseInt(request.getParameter("trash_type"));
		//Date time_wanted=request.getParameter("time_wanted");
		
		CustomerApplyVO vo=new CustomerApplyVO();
		vo.setCustomer_phone(two_phone);
		vo.setCustomer_addr_first(customer_addr_first);
		vo.setCustomer_addr_second(customer_addr_second);
		vo.setCustomer_addr_third(customer_addr_third);
		vo.setBag_num(bag_num);
		vo.setTrash_type(trash_type);
		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date time_wanted = new java.sql.Date(utilDate.getTime());
		//vo.setWanted_time(time_wanted);
		//KaraImpl
		//vo.setWanted_time(time_wanted);
		vo.setWanted_time(time_wanted);
		vo.setHelperID("ID");
		vo.setCard_num("card");

		//serialNo,helperID,price
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		
		//customerApplyDAO dao=new KaraImpl();
		dao.add(vo);
		
		request.setAttribute("two_phone",two_phone);
		request.setAttribute("bag_num",bag_num);
		request.setAttribute("price",bag_num*1500);
		return "/customer_apply_two.jsp";
	
	}
}
