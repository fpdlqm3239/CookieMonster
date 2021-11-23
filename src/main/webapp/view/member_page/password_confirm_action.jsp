
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/security/login_check.jspf" %>

<%
if(request.getMethod().equals("GET")){
	response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
	return;
}

MemberDTO member = MemberDAO.getDAO().selectMember(loginMember.getEmail());
String passwd = Utility.encrypt(request.getParameter("passwd"));


if(member.getPw().equals(passwd)){
	response.sendRedirect(request.getContextPath()+"/view/member_page/modify.jsp");
	return;
}else{
	
	session.setAttribute("message", "비밀번호가틀렷습니다");
	response.sendRedirect(request.getContextPath()+"/view/member_page/password_confirm.jsp");
	return;
}



%>