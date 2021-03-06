<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 로그인 인증정보를 전달받아 MEMBER 테이블에 저장된 회원정보와 비교하여 인증 처리 후
페이지를 이동하는 JSP 문서 --%>
<%-- => 인증 실패 : 세션에 메세지와 아이디를 저장하고 로그인 입력페이지(member_login.jsp)로 이동 --%>
<%-- => 인증 성공 : 세션에 권장 관련 정보를 저장하고 기존 요청 페이지로 이동 --%>
<%--    (기존 요청 페이지가 없는 경우 메인페이지 이동) --%>
<%
if (request.getMethod().equals("GET")) {
	response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
	return;
}

String email = request.getParameter("mid");
String pw = Utility.encrypt(request.getParameter("mpw"));


MemberDTO member = MemberDAO.getDAO().selectMember(email);
if (member == null || !member.getPw().equals(pw)) {
	session.setAttribute("message", "입력한 이메일이 없거나 비밀번호가 맞지 않습니다.");
	session.setAttribute("id", email);
	response.sendRedirect(request.getContextPath() + "/view/member_page/login.jsp");
	return;
}
if(member.getStatus().equals("2")){
	session.setAttribute("message", "탈퇴한 회원입니다.");
	response.sendRedirect(request.getContextPath() + "/view/member_page/login.jsp");
	return;
}

MemberDAO.getDAO().updateLastJoinDate(email);

session.setAttribute("loginMember", MemberDAO.getDAO().selectMember(email));

String url = (String) session.getAttribute("url");
if (url == null) {
	response.sendRedirect(request.getContextPath() + "/view/index.jsp");
} else {//기존 요청페이지가 있는 경우 - 요청페이지 이동
	session.removeAttribute("url");
	response.sendRedirect(url);
}
%>

















