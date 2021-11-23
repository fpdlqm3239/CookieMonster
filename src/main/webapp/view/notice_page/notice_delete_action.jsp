<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- 글번호 받아 해당 게시글을 CM_NOTICE테이블에서 삭제, 공지글 목록 페이지(notice.jsp)로 이동--%>

<%-- 비회원이 해당 문서 요청시 에러페이지 이동 --%>
<%@include file="/view/security/login_check.jspf" %>
<%
	//글번호 없이 비정상 요청 -에러페이지 이동
	if(request.getParameter("no")==null){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}

	//전달값을 반환받아 저장
	int no = Integer.parseInt(request.getParameter("no"));
	
	//글번호 받아 검색
	NoticeDTO notice = NoticeDAO.getDAO().selectNoNotice(no);
	
	//검색된 글 없으면 비정상 요청
	if(notice==null) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	//관리자가 아니면 비정상 요청
	if(!loginMember.getStatus().equals("9")) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	//글번호 받아 게시글 삭제
	NoticeDAO.getDAO().deleteNotice(no);
	
	//글목록 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/view/notice_page/notice.jsp'");
	out.println("</script>");
%>    