package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_list2.do")
public class CtrlSuggetionList2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("대행자 제안 리스트");
		System.out.println("/matching_suggetion_list2.do 진입");
		
		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobakse5@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
		}

		MatchingDAO dao = new MatchingDAO_OracleImpl();
		List<CustomerApplyVO> rl_success = dao.suggestion_list2_success(helperID);
		List<CustomerApplyVO> rl_yet = dao.suggestion_list2_yet(helperID);
		List<CustomerApplyVO> rl_fail = dao.suggestion_list2_fail(helperID);

		System.out.println("매칭 성공 " + rl_success.toString());
		System.out.println("매칭 대기 " + rl_yet.toString());
		System.out.println("매칭 실패 " + rl_fail.toString());
		request.setAttribute("rl_success", rl_success);
		request.setAttribute("rl_yet", rl_yet);
		request.setAttribute("rl_fail", rl_fail);

		System.out.println("/matching_suggestion_list2.do 완료");
		return "/matching/matching_suggetion2.jsp";

	}

}