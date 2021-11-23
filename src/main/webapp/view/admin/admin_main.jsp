<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String workgroup = request.getParameter("workgroup");
if(workgroup == null) 
	workgroup = "product_manager";

String work = request.getParameter("work");
if (work == null)
	work = "";

String query = request.getParameter("query");
if (query == null){
	query = "";
}

String folderPath = "/view/admin/";
String contentPath = workgroup + ".jsp";
if(query != null){
	contentPath += ("?" + query);
}
String contentFullPath = folderPath + contentPath;
%>

<head>
	<jsp:include page="/view/template/includes.jsp" />
</head>

<body>
	<div id="header">
		<jsp:include page="/view/admin/admin_header.jsp" />
	</div>

	<div id="sub_header">

	</div>

	<div id="content">
		<jsp:include page="<%=contentFullPath%>" />
	</div>

	<div id="footer">
		<!--<jsp:include page="/view/template/footer.jsp" />-->
	</div>

</body>


</html>