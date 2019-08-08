package helper;

import common.Controller;
import common.RequestMapping;
import common.Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@RequestMapping("/helper_add.do")
public class CtrlAdd implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        Exception err = null;

        String path = request.getServletContext().getRealPath("/assets/img");
        MultipartRequest mpr = new MultipartRequest( request , path , 1024*1024*20 , "UTF-8" ,
				new DefaultFileRenamePolicy());
        String ofn = mpr.getOriginalFileName("photo");
		// ¹Ù²ï ÀÌ¸§
		String fsn = mpr.getFilesystemName("photo");
		System.out.println(ofn+"->"+fsn);


        String helperId = Util.h( request.getParameter("email"));
        String helperPw = Util.h( request.getParameter("pw" ));
       // String helperPhotoOfn = Util.h( request.getParameter("pw" ));
       //  String helperPhotoFsn = Util.h( request.getParameter("pw" ));
        String phoneNum = Util.h( request.getParameter("phoneNum"));
        String helper_name = Util.h( request.getParameter("helper_name"));
        String sex = Util.h( request.getParameter("sex"));
        String bankName = Util.h( request.getParameter("bank"));
        String account = Util.h( request.getParameter("account"));
        String accountname = Util.h( request.getParameter("accountname"));
        String wishf1 = Util.h( request.getParameter("city1"));
        String wishd1 = Util.h( request.getParameter("dong1"));
        String wishf2 = Util.h( request.getParameter("city2"));
        String wishd2 = Util.h( request.getParameter("dong2"));
        String wishf3 = Util.h( request.getParameter("city3"));
        String wishd3 = Util.h( request.getParameter("dong3"));
        String message = Util.h( request.getParameter("message"));
>>>>>>> 49ee1cf475cbf5cc71fac85b9224538c9be1a574

        HelperVO vo = new HelperVO();

        vo.setHelperId(helperId);
        vo.setHelperPw(helperPw);
        vo.setHelper_Phone(phoneNum);
        vo.setHelper_Name(helper_name);
        vo.setSex(sex);
        vo.setBank_Name(bankName);
        vo.setAccount(account);
        vo.setAccount_Holder(accountname);
        vo.setWish_Addr_Front1(wishf1);
        vo.setWish_Addr_Detail1(wishd1);
        vo.setWish_Addr_Front2(wishf2);
        vo.setWish_Addr_Detail2(wishd2);
        vo.setWish_Addr_Front3(wishf3);
        vo.setWish_Addr_Detail3(wishd3);
        vo.setWant_to_say(message);

        HelperSignUpDAO dao = new HelperSignUpDAO_OracleImpl();

        dao.add(vo);

        return "redirect:/helper/register.jsp";
    }
}
