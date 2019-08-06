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
		
		// 아직 미구현
		return "redirect:/reivew_list.do";
	}

}
