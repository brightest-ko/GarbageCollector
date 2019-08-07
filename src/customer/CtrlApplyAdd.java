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
		System.out.println("대행서비스신청");
		System.out.println("/customer_apply_add.do 진입");
		
		
		//NOTE: 로그인 기능되면 변경하기
		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp濡? 蹂?寃?
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp濡? 蹂?寃?
		}

		
		//NOTE: getParameter로 CustomerApplyVO vo 채워주기
		CustomerApplyVO vo = new CustomerApplyVO();
		CustomerApplyDAO dao = new CustomerApplyDAO_OracleImpl();
		dao.add(vo);
		

		System.out.println("/customer_apply_add.do 완료");
		
		return "redirect:/신청결과조회.do";
	}

}