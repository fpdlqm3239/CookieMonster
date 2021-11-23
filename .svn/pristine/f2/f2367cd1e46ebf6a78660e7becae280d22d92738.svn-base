<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- => [제품정보변경]을 클릭한 경우 제품정보 변경 입력페이지(product_modify.jsp)로 이동 - 제품번호 전달 --%>
<%-- => [제품정보삭제]를 클릭한 경우 제품정보 삭제 처리페이지(product_remove_action.jsp)로 이동 - 제품번호 전달 --%>
<%@include file="/view/security/admin_check.jspf"%>
<%
	if(request.getParameter("productNum")==null) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;		
	}

	int productNum=Integer.parseInt(request.getParameter("productNum"));
	ProductDTO product=ProductDAO.getDAO().selectProductByNo(Integer.toString(productNum));

%>
<head>
<jsp:include page="/view/template/includes.jsp" />


<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

.title {
	background: black;
	color: white;
	text-align: center;
	width: 100px;
}

.value {
	padding: 3px;
	text-align: left;
	width: 400px;
}

.admin_header{
	width: 500px;
	margin: 0 auto;
}

.admin_button{
	margin-top: 30px;
	text-align: center;
}

button{
	font-size: 15px;
	padding: 7px 10px;

	margin: 0 10px;
}


</style>

</head>
<div class="admin_header">
<h2>상품상세정보</h2>
</div>
<table>
	<tr>
		<td class="title">상품번호</td>
		<td class="value"><%=product.getNo() %></td>
	</tr>
	<tr>
		<td class="title">상품명</td>
		<td class="value"><%=product.getName() %></td>
	</tr>
	<tr>
		<td class="title">상품이미지</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/images/<%=product.getThumbnail() %>" width="200">
		</td>
	</tr>
	<tr>
		<td class="title">상세설명</td>
		<td class="value"><%=product.getDescription().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">상품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getCount()) %></td>
	</tr>
	<tr>
		<td class="title">상품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(product.getPrice()) %></td>
	</tr>
	
	<tr>
		<td class="title">추천상품</td>
		<td class="value"><%=product.getRecommand() %></td>
	</tr>
	<tr>
		<td class="title">상품등록일</td>
		<td class="value"><%=product.getReceivingDate()%></td>
	</tr>
</table>

<p class="admin_button">
	<button type="button" id="modifyBtn">상품정보변경</button>
	<button type="button" id="removeBtn">상품정보삭제</button>
</p>

<script type="text/javascript">
$("#modifyBtn").click(function() {
	if(confirm("제품정보를 수정 하겠습니까?")){
		location.href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=product_modify&productNum=<%=product.getNo()%>";		
	}

});

$("#removeBtn").click(function() {
	if(window.confirm("제품정보를 삭제 하겠습니까?")) {
		location.href="<%=request.getContextPath()%>/view/admin/product_remove_action.jsp?productNum=<%=product.getNo()%>";
	}
});
</script>












