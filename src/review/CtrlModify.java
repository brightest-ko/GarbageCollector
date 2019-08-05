package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/review_modify.do")
public class CtrlModify implements Review_Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlModify");
		return "redirect:/reivew_list.do";
	}

}
