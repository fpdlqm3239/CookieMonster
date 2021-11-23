<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

if (request.getMethod().equals("GET")) {
	response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
	return;
}
request.setCharacterEncoding("utf-8");
String phone = request.getParameter("phone");

MemberDTO member = MemberDAO.getDAO().selectMemberByEmail(phone);

if(member == null){
	session.setAttribute("message", "존재하지않음");
	response.sendRedirect(request.getContextPath()+"/view/member_page/find_id.jsp");
	return;
}else{
	session.setAttribute("message", member.getEmail()+"입니다.");
	response.sendRedirect(request.getContextPath()+"/view/member_page/login.jsp");
}
%>	
