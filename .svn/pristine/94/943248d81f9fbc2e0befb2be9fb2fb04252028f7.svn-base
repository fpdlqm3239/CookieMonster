<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/view/security/login_check.jspf"%>
    
    <%
    if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
    

	// 서버폴더 시스템 절대경로 값 
    String saveDirectory = request.getServletContext().getRealPath("/images");
	
	
	
	
	
	//이미지를 받아 저장하기위해 MultipartRequest 객체 생성
	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory ,30*1024*1024,"utf-8", new DefaultFileRenamePolicy());
	String productNo = multipartRequest.getParameter("productNo");
	String reviewNo = multipartRequest.getParameter("reviewNo");
	String score = multipartRequest.getParameter("score");
	String title = multipartRequest.getParameter("title");
	String picture = multipartRequest.getFilesystemName("picture");
	if(picture == null){
		picture = multipartRequest.getParameter("originPicture");
	}
	String content = multipartRequest.getParameter("content");
	
	ReviewDTO review = new ReviewDTO();
	
	review.setNo(Integer.parseInt(reviewNo));
	review.setScore(Integer.parseInt(score));
	review.setTitle(title);
	review.setPicture(picture);
	review.setContent(content);
	
	ReviewDAO.getDAO().updateReview(review);
	
	response.sendRedirect(request.getContextPath()+"/view/detail_page/product_detail.jsp?no="+productNo+"#section2");
	
	
	
	
    %>