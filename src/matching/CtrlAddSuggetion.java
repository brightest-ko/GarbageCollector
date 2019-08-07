package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_list.do")
public class CtrlAddSuggetion implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      /*

         2.
         INSERT INTO table_a
( title, name, regdate, register, memberid, categoryid )
SELECT title, name, regdate, register, memberid, categoryid
FROM table_b
WHERE categoryid=10

         rs = select helperID  from helper where (wish_addr_front1 = ?'??ì£¼ì??/??ê·??¬ì??' and wish_addr_detail1 =?'??ë¨¸ì???')
         or (wish_addr_front2 = ?'??ì£¼ì??/??ê·??¬ì??' and wish_addr_detail2 =?'??ë¨¸ì???')
         or (wish_addr_front3 = ?'??ì£¼ì??/??ê·??¬ì??' and wish_addr_detail3 =?'??ë¨¸ì???');

         for rs{
            insert into matching(serialNo,helperID,suggestion,acceptance) values (?'ì§?ê¸? ??ì²??? serialNo',?'rs.helperID',0,0);
         }

      */

      /*
          ???½ë¦¬?¤í?? (??????ë©?)
          helperVO_list = select * from helper where  helperID in
          (select helperID  from matching where serialNo = ?'serialNo' and suggestion =1 and acceptance =0)
       */

		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jspë¡? ë³?ê²?
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jspë¡? ë³?ê²?
		}

		String l = null;

      /*
         select * from customer_apply
           where serialNo in (select serialNo from matching where helperID = ?'helperID' and suggestion =0 and acceptance =0
        */
		MatchingDAO dao = new MatchingDAO_OracleImpl();
		List<CustomerApplyVO> rl = dao.suggestion_list(helperID);

		if(rl.size() > 0){
			System.out.println("matching_suggestion_list: " + rl.toString());
			request.setAttribute("rl", rl);
		}

		System.out.println("matching_suggestion_list.do");
		return "/matching/matching_suggetion.jsp";

	}

}