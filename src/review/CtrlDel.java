package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/review_delete.do")
public class CtrlDel implements Review_Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlDel");
		
		// 아직 미구현
		return "redirect:/reivew_list.do";
	}

}
