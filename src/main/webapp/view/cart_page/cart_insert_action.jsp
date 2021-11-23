<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<%
	MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
	if(loginMember == null){
		response.sendRedirect(request.getContextPath()+"/view/member_page/login.jsp");
		return;
	}


	if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
 	int productNo=Integer.parseInt(request.getParameter("productNo"));
	int count = Integer.parseInt(request.getParameter("count"));
	
	CartDTO cart = new CartDTO();
	cart.setMemberNo(loginMember.getNo());
	cart.setProductNo(productNo);
	cart.setCount(count);
	
	System.out.println("productNo = "+productNo);
	System.out.println("count = "+count);
	
	
	CartDAO.getDAO().insertCart(cart);
	
	response.sendRedirect(request.getContextPath()+"/view/cart_page/cart.jsp");
	
	
%>

