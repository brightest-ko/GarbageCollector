package helper;

import common.Controller;
import common.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/helper_add_view.do")
public class CtrlAdd_view implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        return "redirect:/signUp.jsp";
    }
}