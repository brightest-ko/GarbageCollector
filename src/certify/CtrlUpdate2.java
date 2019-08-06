package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Controller;
import common.RequestMapping;
import common.Util;


@RequestMapping("/certify/certify_update2.do")
public class CtrlUpdate2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("업뎃 전");

		System.out.println("업뎃 시작");

		// fileup 디렉터리의 실제 저장위치 (절대경로) 값을 파악한다.
		String path = request.getServletContext().getRealPath("/assets/img");
		System.out.println( path );
		
		// cos.jar에서 제공되는 클래스
		// 고로 올릴 때 이름과 서버에 올려진 이름이 다를 수 있다.
		MultipartRequest mpr = new MultipartRequest( request , path , 1024*1024*20 , "UTF-8" ,
				new DefaultFileRenamePolicy()); // 는 이름이 겹칠 때 이름 바꿔서 올려준다.
		// new DefaultFileRenamePolicy() 대신에 null값을 주면 엎어쓴다.
		// 업로드한 원래 파일 이름 
		String ofn = mpr.getOriginalFileName("photo");
		// 바뀐 이름
		String fsn = mpr.getFilesystemName("photo");
		System.out.println(ofn+"->"+fsn);
		//MultipartRequest 쓰면 request.getParameter 못쓴다 .
		// 대신 MultipartRequest 안의 getParameter을 쓴다.
		// 한글처리도 내부에서 해주더라(UTF-8로 설정해서)
		String title = mpr.getParameter("title");
		
		
		System.out.println(mpr.getParameter("certify_helperID"));
		System.out.println("인증 DB 업데이트 시작");
		String details = Util.h(mpr.getParameter("details"));
		System.out.println(details);
		CertifyVO vo = new CertifyVO();
		System.out.println("mpr get param certify no"+mpr.getParameter("certify_serialNo"));
		 vo.setSerialNo(Util.parseInt(mpr.getParameter("certify_serialNo")));
		 System.out.println("serialNo after set: " + vo.getSerialNo());
		 vo.setHelperID("certify_helperID");
		 
		 vo.setDetails(details);
		 vo.setHousePlace(mpr.getParameter("housePlace"));
		 System.out.println(mpr.getParameter("housePlace"));
		 vo.setCertify_photo_ofn(ofn);
		 vo.setCertify_photo_fsn(fsn);
		 CertifyDAO dao = new CertifyDAO_OracleImpl();
		 System.out.println(vo.getDetails());
		 dao.update(vo);
		 return "redirect:/certify/certify_list.jsp";
	}
}
