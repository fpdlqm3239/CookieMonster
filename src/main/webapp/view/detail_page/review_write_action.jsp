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
	    
    
    	// �������� �ý��� ������ �� 
	    String saveDirectory = request.getServletContext().getRealPath("/images");
		System.out.println(saveDirectory);
    	
		//�̹����� �޾� �����ϱ����� MultipartRequest ��ü ����
    	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory ,30*1024*1024,"utf-8", new DefaultFileRenamePolicy());
    	
		// ��ǰ no, ����, ����, ����, ������ �޾ƿͼ� reviewDTO�� ����
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
