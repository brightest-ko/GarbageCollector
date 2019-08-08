package common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;


@RequestMapping("/index.do")
public class CtrlIndex implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("auth"));
        System.out.println(session.getAttribute("helperId"));


		System.out.println("Index TEST");
		return "/index.jsp";
	}

}
