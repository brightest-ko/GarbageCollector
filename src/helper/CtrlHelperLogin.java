package helper;

import common.Controller;
import common.RequestMapping;
import common.Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@RequestMapping("/helper/login.do")
public class CtrlHelperLogin implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        String id = request.getParameter("helperId");
        String password = request.getParameter("pw");
        String result;

        System.out.println("input id : " +  id + " input pw :" + password);

        HelperSignUpDAO dao = new HelperSignUpDAO_OracleImpl();
        if (dao.checkLoginInfo(id, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", "helperId");
            session.setAttribute("helperId", id);
            result = "SUCCESS";
        }
        else {
            result = "FAIL";
        }

        System.out.println(result);
        return "redirect:/index.do";
    }
}