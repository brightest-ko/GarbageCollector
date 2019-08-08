package customer;

import common.Controller;
import common.RequestMapping;
import helper.HelperSignUpDAO;
import helper.HelperSignUpDAO_OracleImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@RequestMapping("/helper/customerLogin.do")
public class CtrlCustomerLogin implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        String customer_phone = request.getParameter("customer_phone");
        System.out.println("CC: " + customer_phone);
        String result;

        System.out.println("input number : " +  customer_phone);

        CustomerApplyDAO dao = new CustomerApplyDAO_OracleImpl();
        if (dao.checkLoginInfo(customer_phone)) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", "customer");
            session.setAttribute("id", customer_phone);

            result = "SUCCESS";
        }
        else {
            result = "FAIL";
        }

        System.out.println(result);
        return "redirect:/index.do";
    }
}