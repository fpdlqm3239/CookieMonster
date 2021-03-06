<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 전달받아 CM_NOTICE 테이블에 저장, 게시글 목록페이지(notice.jsp)로 이동하는 JSP 문서 --%>
<%-- 관리자에게만 글쓰기 권한 제공 --%>

<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 에러페이지로 이동 --%>
<%@include file="/view/security/login_check.jspf" %>       
<%
	//GET방식 요청 -에러페이지 이동
	if(request.getMethod().equals("GET")){
    		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
    		return;
    }

	//서버폴더 시스템 절대경로 값 
	String saveDirectory = request.getServletContext().getRealPath("/images");
	System.out.println(saveDirectory);
	
	//이미지 파일 저장위해 MultipartRequest 객체 생성
	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory ,30*1024*1024,"utf-8", new DefaultFileRenamePolicy());

	//전달값 받아 저장
	String pageNum = multipartRequest.getParameter("pageNum");
	String title = multipartRequest.getParameter("title");
	String content = multipartRequest.getParameter("content");
	String picture = multipartRequest.getFilesystemName("picture");
	
	//CM_NOTICE_SEQ 시퀀스의 다음값 반환, 새글 번호(no)로 저장
	int no = NoticeDAO.getDAO().selectNextNo();
	
	//DTO 인스턴스 필드값 변경
	NoticeDTO notice = new NoticeDTO();
	notice.setNo(no);
	notice.setMemberNo(loginMember.getNo());
	notice.setTitle(title);
	if(multipartRequest.getParameter("content")==null || multipartRequest.getParameter("content")==null){
		notice.setContent("");
	} else{
		notice.setContent(content);
	};
	notice.setPicture(picture);

	
	//게시글 받아 CM_NOTICE 테이블에 저장
	NoticeDAO.getDAO().insertNotice(notice);
	
	//글목록 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/view/notice_page/notice.jsp?pageNum="+pageNum);

%> 