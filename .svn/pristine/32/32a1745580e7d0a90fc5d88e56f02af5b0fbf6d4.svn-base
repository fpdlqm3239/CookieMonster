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
String name = request.getParameter("name");
String email = request.getParameter("email");

// 세션에 저장하는 이메일저장 


MemberDTO member = MemberDAO.getDAO().selectMember(email);
if(member == null){

		System.out.println("재하지 않는 이메일 입");
		session.setAttribute("message", "존재하지 않는 이메일 입니다..");
		response.sendRedirect(request.getContextPath()+"/view/member_page/find_pw.jsp?email="+email);
		return;
		
	
}else{

	System.out.println("whswogka");
	if(!member.getName().equals(name)){
		session.setAttribute("message", "존재하지 않는 이름입니다.");
		response.sendRedirect(request.getContextPath()+"/view/member_page/find_pw.jsp");
		return;
	} else if(!member.getPhone().equals(phone)){
		session.setAttribute("message", "존재하지 않는 전화번호입니다.");
		response.sendRedirect(request.getContextPath()+"/view/member_page/find_pw.jsp?email="+email);
		return;
	}
	response.sendRedirect(request.getContextPath()+"/view/member_page/passwd_reset.jsp?email="+email);
	
}
	

%>	

