<%@page import="xyz.itwill.enums.EProductCategory"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/view/security/admin_check.jspf"%>    
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	if(product!=null) {
		session.removeAttribute("product");
	}
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
	<h2>제품등록</h2>
	
	<%-- 파일을 입력받아 전달하기 위해 form 태그의 method 속성값을 [post]로 설정하고 
	enctype 속성값을 [multipart/form-data]로 설정 --%>
	<form action="<%=request.getContextPath()%>/view/admin/product_add_action.jsp"
		method="post" enctype="multipart/form-data" id="productForm">
		<table>
			<tr>
				<td>카테고리</td>
				<td>
				
					<select name="category" id="category">
						<%
						for (EProductCategory categoryEnum : EProductCategory.values()) {
							if(categoryEnum.toString().equals("ALL")) {
								continue; }
						%>
						<option value=<%=categoryEnum.toString()%>
							<% if (categoryEnum.toString().equals("ALL")) {	%>
								selected="selected" 
							<% } %>>
								<%=categoryEnum.getValue()%>
						</option>
						<% } %>
					</select>

				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="productName" id="productName" maxlength="20" <% if(product!=null) { %>value="<%=product.getNo()%>" <% } %>>
				</td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td>
					<input type="file" name="mainImage" id="mainImage">
				</td>
			</tr>
			<tr>
				<td>상품상세설명</td>
				<td>
					<textarea rows="7" cols="60" name="productDetail" id="productDetail"><% if(product!=null) { %><%=product.getDescription()%><% } %></textarea>
				</td>
			</tr>
			<tr>
				<td>상품수량</td>
				<td>
					<input type="text" name="productQty" id="productQty" <% if(product!=null) { %>value="<%=product.getCount()%>" <% } %>>
				</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" name="productPrice" id="productPrice" <% if(product!=null) { %>value="<%=product.getPrice()%>" <% } %>>
				</td>
			</tr>
			<tr>
				<td>추천상품</td>
				<td>
					<select name="productRecommand" id="productRecommand">
					<option value= "0" selected="selected"> 추천없음 </option>
					<option value= "1" <% 
					if(product != null &&product.getRecommand() == 1) { %> 
						selected="selected" <% } %>> 추천상품 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">상품등록</button></td>
			</tr>
		</table>	
	</form>
	
	<div id="message" style="color: red;"><%=message %></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	
	if($("#productName").val()=="") {
		$("#message").text("상품명을 입력해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	if($("#mainImage").val()=="") {
		$("#message").text("상품이미지를 입력해 주세요.");
		$("#mainImage").focus();
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

