<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    
    <%@include file="/view/security/login_check.jspf"%>
    
    <%
    	if(request.getMethod().equals("GET")){
    		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
    		return;
    	}
	    
    
    	// 서버폴더 시스템 절대경로 값 
	    String saveDirectory = request.getServletContext().getRealPath("/images");
		System.out.println(saveDirectory);
    	
		//이미지를 받아 저장하기위해 MultipartRequest 객체 생성
    	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory ,30*1024*1024,"utf-8", new DefaultFileRenamePolicy());
    	
		// 상품 no, 평점, 제목, 내용, 사진을 받아와서 reviewDTO에 저장
    	int productNo= Integer.parseInt(multipartRequest.getParameter("productNo"));
    	int score = Integer.parseInt(multipartRequest.getParameter("score"));
    	String title = multipartRequest.getParameter("title");
    	String content = multipartRequest.getParameter("content");
    	String picture = multipartRequest.getFilesystemName("picture");
    	
    	ReviewDTO review = new ReviewDTO();
    	
    	review.setMemberNo(loginMember.getNo());
    	review.setWriter(loginMember.getName());
    	review.setProductNo(productNo);
    	review.setScore(score);
    	review.setTitle(title);
    	review.setContent(content);
    	review.setPicture(picture);
    	
    	
    	
    	ReviewDAO.getDAO().insertReview(review);
    	
    	response.sendRedirect(request.getContextPath()+"/view/detail_page/product_detail.jsp?no="+productNo+"#section2");
    %>
