<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");
	
	if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;	
	}
	
	String email = request.getParameter("mid");
	String pw = Utility.encrypt(request.getParameter("mpw_1"));
	String name = request.getParameter("mname");
	String phone = request.getParameter("mphone1") + "-" + request.getParameter("mphone2") 
												   + "-" + request.getParameter("mphone3");
	
	String zipcode = request.getParameter("maddress1");
	String address1 = request.getParameter("maddress2");
	String address2 = Utility.stripTag(request.getParameter("maddress3"));
	
	MemberDTO member = new MemberDTO();
	member.setEmail(email);
	member.setPw(pw);
	member.setName(name);
	member.setPhone(phone);
	member.setZipcode(zipcode);
	member.setMainAddress(address1);
	member.setDetailAddress(address2);
	
	MemberDAO.getDAO().insertMember(member);

	response.sendRedirect(request.getContextPath()+"/view/member_page/login.jsp");

%>
