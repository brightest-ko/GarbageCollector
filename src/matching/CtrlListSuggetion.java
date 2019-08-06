package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_list.do")
public class CtrlListSuggetion implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp濡� 蹂�寃�
		}

		String l = null;

      /*
         select * from customer_apply
           where serialNo in (select serialNo from matching where helperID = ?'helperID' and suggestion =0 and acceptance =0
        */
		MatchingDAO dao = new Matching_OracleImpl();
		List<CustomerApplyVO> rl = dao.suggestion_list(helperID);

		if(rl.size() > 0){
			System.out.println("matching_suggestion_list: " + rl.toString());
			request.setAttribute("rl", rl);
		}

		System.out.println("matching_suggestion_list.do");
		return "/matching/matching_suggetion.jsp";

	}

}