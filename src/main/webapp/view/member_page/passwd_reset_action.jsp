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
	
	String email=request.getParameter("mid");
	String passwd=request.getParameter("mpw_1");
	if(passwd==null || passwd.equals("")) {

		System.out.println("비밀번호 입력안함");
		response.sendRedirect(request.getContextPath()+"/view/member_page/passwd_reset.jsp");
	} else {

		//System.out.println(passwd);
		passwd=Utility.encrypt(passwd);
		//System.out.println(passwd);
	}
	
	MemberDTO member = MemberDAO.getDAO().selectMember(email);
	MemberDAO.getDAO().resetPw(member, passwd);
	
	response.sendRedirect(request.getContextPath()+"/view/member_page/login.jsp");

%>