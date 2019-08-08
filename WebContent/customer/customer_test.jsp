<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"
import="customer.CustomerApplyDAO,customer.CustomerApplyDAO_OracleImpl,
customer.CustomerApplyVO,java.util.Date,java.sql.*"%><%

	String phone=request.getParameter("one_phone");
	String first=request.getParameter("first");
	String second=request.getParameter("second");
	String third=request.getParameter("third");
	String bag_num=request.getParameter("bag_num");
	System.out.println("Ctrl: "+bag_num);
	int price=Integer.parseInt(request.getParameter("price"));
	String trash_type=request.getParameter("trash_type");
	String imsi_date=request.getParameter("date");
	
	System.out.println(phone+first+second+third+bag_num+trash_type+imsi_date);
	SimpleDateFormat transFormat = new SimpleDateFormat("DD/MM/YYYY HH:mm");
	Date date1 = transFormat.parse(imsi_date);
	java.sql.Date date=new java.sql.Date(date1.getTime());
	
	//CustomerApplyVO vo=new CustomerApplyVO(phone,first,second,third,Integer.parseInt(bag_num)
	//		,Integer.parseInt(trash_type),null,0,"card","helper");
	CustomerApplyVO vo=new CustomerApplyVO(phone,first,second,third,Integer.parseInt(bag_num)
			,Integer.parseInt(trash_type),date,price,"card","helper");
	
	System.out.println(vo.toString());
	String code="OK";
	CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
	dao.add(vo);
%>{code:'<%=code%>'}
