<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글번호 받아 해당 게시글을 CM_cartNoTICE테이블에서 삭제, 공지글 목록 페이지(cartNotice.jsp)로 이동--%>

<%-- 비회원이 해당 문서 요청시 에러페이지 이동 --%>
<%@include file="/view/security/login_check.jspf" %>
<%
	//cartNo() 없으면 비정상 요청 -에러페이지 이동
	if(request.getParameter("cartNo")==null || request.getParameter("cartNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}

	//cartNo() 전달값을 반환받아 저장
	
	int cartNo = Integer.parseInt(request.getParameter("cartNo"));

	
	//글번호 받아 게시글 삭제
	CartDAO.getDAO().deleteCart(cartNo);
	
	
	//장바구니 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/view/cart_page/cart.jsp");

%>    