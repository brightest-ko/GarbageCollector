package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

@RequestMapping("/review_insert.do")
public class CtrlInsert implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlInsert");
		
		Exception e = null;
		
		String content = Util.h(request.getParameter("content"));
		ReviewVO vo = new ReviewVO();
		vo.setReviewContent( content );
		
		ReviewDAO dao = new ReviewDAO_Impl();
		dao.insert( vo );
		
		// 아직 미구현
		return "redirect:/reivew_list.do";
	}

}
