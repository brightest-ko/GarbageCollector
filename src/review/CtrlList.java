package review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;

@RequestMapping("/review_list.do")
public class CtrlList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println("CtrlList");
		
		ReviewDAO dao = new ReviewDAO_Impl();
		List<ReviewVO> rl = dao.findAll();
		
		request.setAttribute("rl", rl);
		
		return "/review/review_list.jsp";
	}

}
