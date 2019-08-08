package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;

@RequestMapping("/review_modify.do")
public class CtrlModify implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlModify");
		
		Integer serialNo = Integer.parseInt( request.getParameter("serialNo") ); //시리얼 넘버받아옴
		System.out.println(serialNo); //test
		
		ReviewVO vo = new ReviewVO();
		vo.setSerialNo(serialNo);
		
		ReviewDAO dao = new ReviewDAO_Impl();
		dao.modify( vo );
		
		return "redirect:/reivew_list.do";
	}

}
