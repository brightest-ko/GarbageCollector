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
		//��û�� �߰� ����
		//��û�� �߰� ctrl�� �߰�����
		/*
			1. ��û�� �߰�
			select count(*) from customer where customer_phone = ?
			if(rs.hasnext())
				update customer set customer_addr_front=?, customer_addr_detail=? where customer_phone = ?
				insert into customer_apply
			else
				insert into customer
				insert into customer_apply
			
			2.
			select serialNo, customer_addr_front from customer_apply where customer_phone = ? order by customer_apply_day desc
			'���� ��û�� serialNo' = rs�� ù��° ���� serialNo
			'���� ��û�� customer_addr_front' = rs�� ù��° ���� serialNo
			'���ֽ�/��������' = customer_addr_front.����1
			'��������' = customer_addr_front.����2
			
			rs = select helperID  from helper where (wish_addr_front1 = ?'���ֽ�/��������' and wish_addr_detail1 =?'��������')
			or (wish_addr_front2 = ?'���ֽ�/��������' and wish_addr_detail2 =?'��������')
			or (wish_addr_front3 = ?'���ֽ�/��������' and wish_addr_detail3 =?'��������');
			
			for rs{
				insert into matching(serialNo,helperID,suggestion,acceptance) values (?'���� ��û�� serialNo',?'rs.helperID',0,0);
			}
			
		*/
		
		/*
		 	���ȸ���Ʈ (����ȭ��)
		 	select serialNo  from matching where helperID = ?'helperID' and suggestion =0 and acceptance =0
		 	customer_applyVO_list
		 	rs.for{
		 		customer_applyVO = select * from customer_apply where  serialNo = ?serialNo 
		 	}
		 	
		 	��������Ʈ (�մ�ȭ��)
		 	select helperID  from matching where serialNo = ?'serialNo' and suggestion =1 and acceptance =0
		 	helperVO_list
		 	rs.for{
		 		helperVO = select * from helper where  helperID = ?helperID 
		 	}
		 	
		 	����(��������Ʈ���� add - �մ�ȭ��)
		 	
		 	
		 */


        String l = null;

        MatchingDAO dao = new Matching_OracleImpl();
        List<MatchingVO> rl = dao.findAll();

        request.setAttribute("rl", rl);

		System.out.println("ControllerList TEST" + rl.toString());
		return "/index.jsp";
	}

}
