<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 변경 공지글 받아 CM_NOTICE테이블에 반영 후 공지글 상세페이지(notice_datail.jsp)로 이동--%>

<%-- 비회원이 문서 요청시 에러페이지 이동 --%>
<%@include file="/view/security/login_check.jspf" %>    
<%
	//GET방식으로 비정상 요청 -에러페이지 이동
	if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}

	//서버폴더 시스템 절대경로 값 
	String saveDirectory = request.getServletContext().getRealPath("/images");
	System.out.println(saveDirectory);
	
	//이미지 파일 저장위해 MultipartRequest 객체 생성
	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory ,30*1024*1024,"utf-8", new DefaultFileRenamePolicy());

	//전달값받아 저장
	int no = Integer.parseInt(multipartRequest.getParameter("no"));
	String pageNum = multipartRequest.getParameter("pageNum");
	String search = multipartRequest.getParameter("search");
	String keyword = multipartRequest.getParameter("keyword");
	String title = multipartRequest.getParameter("title");
	String content = multipartRequest.getParameter("content");
	String picture = "";
	
	//새 이미지 파일 전달값 없고, 기존 이미지 파일 있으면 기존것 받아옴
	if(multipartRequest.getFilesystemName("picture")==null){
		picture = multipartRequest.getParameter("originPic");
	} else {
	 	picture = multipartRequest.getFilesystemName("picture");
	}
	
	//DTO인스턴스 필드값 변경
	NoticeDTO notice = new NoticeDTO();
	notice.setNo(no);
	notice.setTitle(title);
	notice.setContent(content);
	notice.setPicture(picture);
	
	//게시글 받아 CM_NOTICE 테이블에 반영
	NoticeDAO.getDAO().updateNotice(notice);
	
	//게시글 상세페이지 이동 -페이지 번호, 검색 관련 정보 전달
	response.sendRedirect(request.getContextPath()+"/view/notice_page/notice_detail.jsp?no="+no
					+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
%> 