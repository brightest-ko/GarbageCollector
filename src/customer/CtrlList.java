package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/customer_detail.do")
public class CtrlList implements Controller{
	String s=null;
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CtrlList23");
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		System.out.println(s);
		String serialNo=request.getParameter("serialNo");
		CustomerApplyVO rl=dao.findAll_cus(serialNo);
		request.setAttribute("rl", rl);
		System.out.println(rl);
		return "/customer/customer_detail.jsp";
	}
	
	public void set_no(String s){
		this.s=s;
	}

}
