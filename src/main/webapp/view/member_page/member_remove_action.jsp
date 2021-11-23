<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/security/login_check.jspf" %>
	
<%

if (request.getMethod().equals("GET")) {
	response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
	return;
}



MemberDTO member = MemberDAO.getDAO().selectMember(loginMember.getEmail());
String passwd = Utility.encrypt(request.getParameter("passwd"));

String email=loginMember.getEmail();
MemberDAO.getDAO().deleteMember(email);

if(member.getPw().equals(passwd)){

	MemberDAO.getDAO().deleteMember(loginMember.getEmail());
	session.setAttribute("message", "회원 탈퇴 하셨습니다.");
	response.sendRedirect(request.getContextPath()+"/view/member_page/logout_action.jsp");
	return;
}else{ 
	
	session.setAttribute("message", "비밀번호가틀렷습니다");
	response.sendRedirect(request.getContextPath()+"/view/member_page/member_remove.jsp");
	return;
}



%>