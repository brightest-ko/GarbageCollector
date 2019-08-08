<%@page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"
import="customer.CustomerApplyDAO,customer.CustomerApplyDAO_OracleImpl,
customer.CustomerApplyVO"%><%

	String phonet=request.getParameter("two_phone");
	String pricet=request.getParameter("price");
	String card_numt=request.getParameter("card_num");
	System.out.println(phonet+pricet+card_numt);
	//CustomerApplyVO vo=new CustomerApplyVO(phone,first,second,third,Integer.parseInt(bag_num)
	//		,Integer.parseInt(trash_type),null,0,"card","helper");
	CustomerApplyVO vo=new CustomerApplyVO(phonet,card_numt,pricet);
	System.out.println(vo.toString());
	String code="OK1";
	CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
	dao.update(phonet,Integer.parseInt(pricet),card_numt);
%>{code:'OK1'}
