package review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;
import common.Util;

@RequestMapping("/review_insert.do")
public class CtrlInsert implements Controller { // 패스워드 설정해야함..

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ctrlInsert");
		
		Integer serialNo = Integer.parseInt( request.getParameter("serialNo") );
		String reviewTitle = Util.h(request.getParameter("review_title"));
		String helperID = request.getParameter("helperID");
		
		// 현재날짜를 저장 (반드시 yyyy-MM-dd 형식이여야함. 안그러면 오류 or 날짜 오버플로)
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String transDay = date.format( new java.sql.Date ( System.currentTimeMillis() ) );
		java.sql.Date reviewDay = java.sql.Date.valueOf( transDay );
		
		double rating = Double.parseDouble( request.getParameter("rating") );
		String cleanPlaceAddFront = Util.h( request.getParameter("review_cleanhouse") );
		String content = Util.h( request.getParameter("review_content") );
		
		/* ##### check #####
		System.out.println("--test--");
		System.out.println("serialNo : " + serialNo);
		System.out.println("reviewTitle : " + reviewTitle);
		System.out.println("helperID : " + helperID);
		System.out.println("reviewDay : " + reviewDay.toString());
		System.out.println("rating : " + rating);
		System.out.println("cleanPlaceAddFront : " + cleanPlaceAddFront);
		System.out.println("content : " + content);  */
		
		//java에만 저장하는단계
		String reviewPwd="1234";
		ReviewVO vo = new ReviewVO();
		
		vo.setSerialNo( serialNo );
		vo.setReviewTitle(reviewTitle);
		vo.setHelperID(helperID);
		vo.setReviewDay(reviewDay);
		vo.setRating(rating);
		vo.setCleanPlaceAddrFront(cleanPlaceAddFront);
		vo.setReviewContent( content );
		
		ReviewDAO dao = new ReviewDAO_Impl();
		dao.insert( vo );
		
		return "redirect:/review_list.do"; 
	}

}
