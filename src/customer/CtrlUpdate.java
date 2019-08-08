package customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
@RequestMapping("/customer_update.do")
public class CtrlUpdate implements Controller{
	//����â������û��ư������ insert
		@Override
		public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("CtrlUpdate");
			String total_money=request.getParameter("total_money");
			String card_num=request.getParameter("card_num");
			String update_phone=request.getParameter("two_phone");
			System.out.println("total_money : "+total_money+"card_num"+card_num+"phone"+update_phone);
			CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
			dao.update(update_phone,Integer.parseInt(total_money),card_num);
			return "redirect:/customer_apply_result.jsp";
		}
	}
