<%@page import="xyz.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/view/security/login_check.jspf" %>

<%
	


	
	CartDAO cartdao = CartDAO.getDAO();
	
	CartDAO.getDAO().deleteAllCart(loginMember.getNo());
	


	
	//장바구니 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/view/cart_page/cart.jsp");

%>    