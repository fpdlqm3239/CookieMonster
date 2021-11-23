<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    if(request.getMethod().equals("GET")){
  		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
  		return;
  	}
    
    String reviewNo = request.getParameter("reviewNo");
    String productNo = request.getParameter("productNo");
    
    ReviewDAO.getDAO().deleteReview(reviewNo);
    
    
    response.sendRedirect(request.getContextPath()+"/view/detail_page/product_detail.jsp?no="+productNo+"#section2");
    %>