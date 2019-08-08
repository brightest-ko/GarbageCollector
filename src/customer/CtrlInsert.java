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
		String one_phone=Util.h(request.getParameter("one_phone"));
		System.out.println(one_phone);
		String customer_addr_first=Util.h(request.getParameter("customer_addr_first"));
		String customer_addr_second=Util.h(request.getParameter("customer_addr_second"));
		String customer_addr_third=Util.h(request.getParameter("customer_addr_third"));		
		int bag_num=Integer.parseInt(request.getParameter("bag_num"));
		int trash_type=Integer.parseInt(request.getParameter("trash_type"));
		String card_num=Util.h(request.getParameter("card_num"));
		
		//Date time_wanted=request.getParameter("time_wanted");
		
		CustomerApplyVO vo=new CustomerApplyVO();
		vo.setCustomer_phone(one_phone);
		vo.setCustomer_addr_first(customer_addr_first);
		vo.setCustomer_addr_second(customer_addr_second);
		vo.setCustomer_addr_third(customer_addr_third);
		vo.setBag_num(bag_num);
		vo.setTrash_type(trash_type);
		vo.setCard_num(card_num);
		vo.setPrice(1500*bag_num);
		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date time_wanted = new java.sql.Date(utilDate.getTime());
		//vo.setWanted_time(time_wanted);
		//KaraImpl
		//vo.setWanted_time(time_wanted);
		vo.setWanted_time(time_wanted);
		vo.setHelperID("ID");
		
		//serialNo,helperID,price
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();	
		//customerApplyDAO dao=new KaraImpl();
		dao.add(vo);
		System.out.println("sdsdfsdff");
		return "/customer.do";
	
	}
}
