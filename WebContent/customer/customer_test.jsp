<%@page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"
import="customer.CustomerApplyDAO,customer.CustomerApplyDAO_OracleImpl,
customer.CustomerApplyVO"%><%

	String phone=request.getParameter("one_phone");
	String first=request.getParameter("first");
	String second=request.getParameter("second");
	String third=request.getParameter("third");
	String bag_num=request.getParameter("bag_num");
	String trash_type=request.getParameter("trash_type");
	String date=request.getParameter("date");
	System.out.println(phone+first+second+third+bag_num+trash_type+date);
	//CustomerApplyVO vo=new CustomerApplyVO(phone,first,second,third,Integer.parseInt(bag_num)
	//		,Integer.parseInt(trash_type),null,0,"card","helper");
	CustomerApplyVO vo=new CustomerApplyVO(phone,first,second,third,1
			,Integer.parseInt(trash_type),null,0,"card","helper");
	System.out.println(vo.toString());
	String code="OK";
	CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
	dao.add(vo);
%>{code:'<%=code%>'}
