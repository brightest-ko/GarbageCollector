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

        //Exception err = null;
    	
        String path = request.getServletContext().getRealPath("/assets/img");
        MultipartRequest mpr = new MultipartRequest( request , path , 1024*1024*20 , "UTF-8" ,
				new DefaultFileRenamePolicy());

        String ofn = mpr.getOriginalFileName("helper_photo");
		String fsn = mpr.getFilesystemName("helper_photo");
		System.out.println(ofn+"->"+fsn);


        String helperId = mpr.getParameter("email");
        String helperPw = mpr.getParameter("pw" );
        String phoneNum = mpr.getParameter("phoneNum");
        String helper_name = mpr.getParameter("helper_name");
        String sex = mpr.getParameter("sex");
        String bankName = mpr.getParameter("bank");
        String account = mpr.getParameter("account");
        String accountname = mpr.getParameter("accountname");
        String wishf1 =  mpr.getParameter("city1");
        String wishd1 =  mpr.getParameter("dong1");
        String wishf2 =  mpr.getParameter("city2");
        String wishd2 =  mpr.getParameter("dong2");
        String wishf3 =  mpr.getParameter("city3");
        String wishd3 =  mpr.getParameter("dong3");
        String message =  mpr.getParameter("message");

        HelperVO vo = new HelperVO();

        vo.setHelperId(helperId);
        vo.setHelperPw(helperPw);
        vo.setHelperPhotoOfn(ofn);
        vo.setHelperPhotoFsn(fsn);
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
        System.out.println(vo.toString());
        HelperSignUpDAO dao = new HelperSignUpDAO_OracleImpl();

        dao.add(vo);

        return "redirect:/index.do";
    }
}
