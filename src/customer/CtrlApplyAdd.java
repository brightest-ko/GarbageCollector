package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/customer_apply_add.do")
public class CtrlApplyAdd implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("���༭�񽺽�û");
		System.out.println("/customer_apply_add.do");

		//NOTE: �α��� ��ɵǸ� �����ϱ�
		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp�? �?�?
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp�? �?�?
		}

		//NOTE: getParameter�� CustomerApplyVO vo ä���ֱ�
		CustomerApplyVO vo = new CustomerApplyVO();
		CustomerApplyDAO dao = new CustomerApplyDAO_OracleImpl();
		dao.add(vo);


		System.out.println("/customer_apply_add.do");

		return "redirect:/customer_apply_list.do";
	}

}