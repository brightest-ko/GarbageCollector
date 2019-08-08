package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Controller;
import common.RequestMapping;
import common.Util;



@RequestMapping("/certify/certify_add2.do")
public class CtrlAdd2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String auth = null;
		String helperID = null;
		try{
			auth = (String)session.getAttribute("auth");
			helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
			}
		}catch(Exception e){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}
		
		String path = request.getServletContext().getRealPath("/assets/img");
		System.out.println( path );
		
		MultipartRequest mpr = new MultipartRequest( request , path , 1024*1024*20 , "UTF-8" ,
				new DefaultFileRenamePolicy());
		String ofn = mpr.getOriginalFileName("photo");
		String fsn = mpr.getFilesystemName("photo");
		System.out.println(ofn+"->"+fsn);

		System.out.println("���� DB insert ����");
		CertifyVO vo = new CertifyVO();
		
		 vo.setSerialNo(Util.parseInt(mpr.getParameter("certify_serialNo")));
		 vo.setHelperID(helperID);
		 vo.setDetails(Util.h(mpr.getParameter("details")));
		 vo.setHousePlace(mpr.getParameter("housePlace"));
		 vo.setCertify_photo_ofn(ofn);
		 vo.setCertify_photo_fsn(fsn);
		 System.out.println(vo.getHelperID());
		 CertifyDAO dao = new CertifyDAO_OracleImpl();
		 dao.insert(vo);
		return "redirect:/matching_suggetion_list2.do";
	}

	

}
