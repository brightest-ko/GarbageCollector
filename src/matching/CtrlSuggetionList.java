package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_list.do")
public class CtrlSuggetionList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("서비스 요청 리스트");
		System.out.println("/matching_suggestion_list.do 진입");
		
		HttpSession session = request.getSession();
		String auth = null;
		String helperID = null;
		try{
			auth = (String)session.getAttribute("auth");
			helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}

		MatchingDAO dao = new MatchingDAO_OracleImpl();
		List<CustomerApplyVO> rl = dao.suggestion_list(helperID);
		List<CustomerApplyVO> rl_deadline = dao.suggestion_list_deadline(helperID);
//		System.out.println("제안 추천 리스트 " + rl.toString());
		request.setAttribute("rl_deadline", rl_deadline);
		request.setAttribute("rl", rl);

		System.out.println("/matching_suggestion_list.do 완료");
		return "/matching/matching_suggetion.jsp";

	}

}