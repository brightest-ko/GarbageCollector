package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;


@RequestMapping("/customer.do")
public class CtrlList implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("CtrlList");
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
		List<CustomerApplyVO> rl=dao.findAll();
		request.setAttribute("rl", rl);
		return "redirect:/customer_list.jsp";
	}
//�˻������ȸselect
	
}
