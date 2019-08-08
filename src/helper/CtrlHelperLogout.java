package helper;

import common.Controller;
import common.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/logout.do")
public class CtrlHelperLogout implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        session.removeAttribute("auth");
        session.removeAttribute("id");

        return "redirect:/index.do";
    }
}