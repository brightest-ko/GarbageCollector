package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;


@RequestMapping("/matching.do")
public class CtrlListSuggetion implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//신청서 추가 이후
		//신청서 추가 ctrl에 추가예정
		/*
			1. 신청서 추가
			select count(*) from customer where customer_phone = ?
			if(rs.hasnext())
				update customer set customer_addr_front=?, customer_addr_detail=? where customer_phone = ?
				insert into customer_apply
			else
				insert into customer
				insert into customer_apply
			
			2.
			select serialNo, customer_addr_front from customer_apply where customer_phone = ? order by customer_apply_day desc
			'지금 신청한 serialNo' = rs의 첫번째 거의 serialNo
			'지금 신청한 customer_addr_front' = rs의 첫번째 거의 serialNo
			'제주시/서귀포시' = customer_addr_front.분해1
			'나머지동' = customer_addr_front.분해2
			
			rs = select helperID  from helper where (wish_addr_front1 = ?'제주시/서귀포시' and wish_addr_detail1 =?'나머지동')
			or (wish_addr_front2 = ?'제주시/서귀포시' and wish_addr_detail2 =?'나머지동')
			or (wish_addr_front3 = ?'제주시/서귀포시' and wish_addr_detail3 =?'나머지동');
			
			for rs{
				insert into matching(serialNo,helperID,suggestion,acceptance) values (?'지금 신청한 serialNo',?'rs.helperID',0,0);
			}
			
		*/
		
		/*
		 	제안리스트 (대행화면)
		 	select serialNo  from matching where helperID = ?'helperID' and suggestion =0 and acceptance =0
		 	customer_applyVO_list
		 	rs.for{
		 		customer_applyVO = select * from customer_apply where  serialNo = ?serialNo 
		 	}
		 	
		 	수락리스트 (손님화면)
		 	select helperID  from matching where serialNo = ?'serialNo' and suggestion =1 and acceptance =0
		 	helperVO_list
		 	rs.for{
		 		helperVO = select * from helper where  helperID = ?helperID 
		 	}
		 	
		 	수락(수락리스트에서 add - 손님화면)
		 	
		 	
		 */
        String l = null;
		
        MatchingDAO dao = new Matching_OracleImpl();
        List<MatchingVO> rl = dao.findAll();

        request.setAttribute("rl", rl);

		System.out.println("ControllerList TEST" + rl.toString());
		return "/index.jsp";
	}

}
