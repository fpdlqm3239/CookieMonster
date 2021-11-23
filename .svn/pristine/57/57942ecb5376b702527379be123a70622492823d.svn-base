<%@page import="xyz.itwill.enums.EProductCategory"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="/view/security/admin_check.jspf"%>    
<%
	if(request.getParameter("productNum")==null) {
		response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
		return;		
	}

	String productNum=(String)(request.getParameter("productNum"));

	ProductDTO product=ProductDAO.getDAO().selectProductByNo(productNum);
%>
<style type="text/css">
#product {
	width: 800px;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}

td {
	text-align: left;
}
</style>

<div id="product">
	<h2>상품변경</h2>
	
	<form action="<%=request.getContextPath()%>/view/admin/product_modify_action.jsp"
		method="post" enctype="multipart/form-data" id="productForm">
		<input type="hidden" name="productNum" value="<%=product.getNo()%>">
		<%-- 제품이미지를 변경하지 않을 경우 기존 제품이미지를 사용하기 위해 전달하거나
		제품이미지를 변경할 경우 기존 제품이미지 파일을 삭제하기 위해 전달 --%>
		<input type="hidden" name="currentMainImage" value="<%=product.getThumbnail()%>">
		<table>
			<tr>
				<td>상품분류</td>
				<td>
					<select name="category">
					<%	for(EProductCategory ecategory : EProductCategory.values()){ %>
						<option value=<%=ecategory.toString()%> 
						<% if(product.getCategory().equalsIgnoreCase(ecategory.toString())) { %> 
						selected="selected" <% } %>><%=ecategory.getValue()%></option>
					<%
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품번호</td>
				<td>
					<input type="text" readonly="readonly" name="productCode" id="productCode" value="<%=product.getNo()%>">
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="productName" id="productName" maxlength="20" value="<%=product.getName()%>">
				</td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td>
					<img src="<%=request.getContextPath()%>/site/product_image/<%=product.getThumbnail() %>" width="200">
					<br>
					<span style="color: red;">이미지를 변경하지 않을 경우 입력하지 마세요.</span>
					<br>
					<input type="file" name="mainImage" id="mainImage">
				</td>
			</tr>
			<tr>
				<td>상품상세설명</td>
				<td>
					<textarea rows="7" cols="60" name="productDetail" id="productDetail"><%=product.getDescription()%></textarea>
				</td>
			</tr>
			<tr>
				<td>상품수량</td>
				<td>
					<input type="text" name="productQty" id="productQty" value="<%=product.getCount()%>">
				</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" name="productPrice" id="productPrice" value="<%=product.getPrice()%>" >
				</td>
			</tr>
			
			<tr>
				<td>추천상품</td>
				<td>
					<select name="productRecommand" id="productRecommand">
					<option value= "0" selected="selected"> 추천없음 </option>
					<option value= "1" <% 
					if(product.getRecommand() == 1) { %> 
						selected="selected" <% } %>> 추천상품 </option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>등록일</td>
				<td>
					<input type="text" readonly="readonly" name="productReceivingDate" id="productReceivingDate" value="<%=product.getReceivingDate()%>" >
				</td>
			</tr>
			<tr>
				<td>상품이미지추가</td>
				<td>
					<br><br>
					<input type="file" name="subImage<%=0%>">
					<input type="file" name="subImage<%=1%>">
					<input type="file" name="subImage<%=2%>">
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="2"><button type="submit">상품변경</button></td>
			</tr>
		</table>	
	</form>
	
	<div id="message" style="color: red;"></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	if($("#productCode").val()=="") {
		$("#message").text("상품코드를 입력해 주세요.");
		$("#productCode").focus();
		return false;
	}
	
	if($("#productName").val()=="") {
		$("#message").text("상품명을 입력해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	if($("#productDetail").val()=="") {
		$("#message").text("상품상세설명을 입력해 주세요.");
		$("#productDetail").focus();
		return false;
	}
	
	if($("#productQty").val()=="") {
		$("#message").text("상품수량을 입력해 주세요.");
		$("#productQty").focus();
		return false;
	}
	
	if($("#productPrice").val()=="") {
		$("#message").text("상품가격을 입력해 주세요.");
		$("#productPrice").focus();
		return false;
	}
		
	
});

</script>