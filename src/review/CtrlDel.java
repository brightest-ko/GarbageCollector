package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;

@RequestMapping("/review_delete.do")
public class CtrlDel implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlDel");
		
		Integer serialNo = Integer.parseInt( request.getParameter("serialNo") );
		System.out.println(serialNo); //test
		
		ReviewVO vo = new ReviewVO();
		vo.setSerialNo(serialNo);
		
		ReviewDAO dao = new ReviewDAO_Impl();
		dao.delete( vo );
		return "redirect:/review_list.do";
	}

}
