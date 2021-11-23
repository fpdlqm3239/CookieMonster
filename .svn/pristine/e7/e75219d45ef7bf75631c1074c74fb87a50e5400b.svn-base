
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 삭제하고자 선택된 회원정보의 아이디 목록을 전달받아 MEMBER 테이블에 저장된 해당 아이디의
회원정보를 삭제하고 회원목록 출력페이지(member_manager.jsp)로 이동하는 JSP 문서  --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%@include file="/view/security/admin_check.jspf"%>
<%

	if(request.getMethod().equals("GET")) {
		response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
		return;
	}

	String[] checkId=request.getParameterValues("checkId");

	String actionStr = request.getParameter("doSomething");

	System.out.println(actionStr);
	
	if(actionStr != null && actionStr.equals("remove")){
		System.out.println("탈퇴처리");
		for(String id:checkId) {
			MemberDAO.getDAO().deleteMember(id);
		}	
	}
	if(actionStr != null && actionStr.equals("removeDB")){			//db에서 삭제 //외래키때문에 삭제가 안되네요 ^^
		System.out.println("삭제처리");								//on delete cascading 써야함 ^^
		for(String id:checkId) {
			MemberDAO.getDAO().deleteDBMember(id);
		}	
	}

System.out.println("다시가유");

	
	response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=member_manager");
	
%>







