<%@page import="xyz.itwill.dao.MemberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	if(request.getParameter("no")==null || request.getParameter("no").equals("")){
		response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
		return;
	}
	
	int no = Integer.parseInt(request.getParameter("no"));
	String status = request.getParameter("status");
	
	//System.out.println(no);
	MemberDAO.getDAO().updateStatus(no, status);

	response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=member_manager");
%>



