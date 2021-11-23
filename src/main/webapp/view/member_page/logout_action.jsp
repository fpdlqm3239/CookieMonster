<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String message = (String)session.getAttribute("message");
	if(message!=null){
		session.removeAttribute("message");
		%>
		<script type="text/javascript">
		alert('<%=message %>');
		</script>
		<%
	}
	
%>

<%
	session.invalidate();

	response.sendRedirect(request.getContextPath()+"/view/index.jsp");

%>