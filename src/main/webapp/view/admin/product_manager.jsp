<%@page import="xyz.itwill.dto.ProductSearchDTO"%>
<%@page import="xyz.itwill.enums.EProductCategory"%>
<%@page import="xyz.itwill.enums.EProductSelect"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품목록을 검색하여 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%-- => [카테고리]를 변경한 경우 제품목록 출력페이지(product_manager.jsp)로 이동 - 카테고리 전달 --%>
<%-- => [제품등록]을 클릭한 경우 제품정보 입력페이지(product_add.jsp)로 이동 --%>
<%-- => [제품명]을 클릭한 경우 제품정보 출력페이지(product_detail.jsp)로 이동 - 제품번호 전달 --%>
<%@include file="/view/security/admin_check.jspf"%>
<%

ProductSearchDTO searchDTO = new ProductSearchDTO();

String category = request.getParameter("category");
if (category == null) {//전달값이 없는 경우
	searchDTO.setCategory(EProductCategory.ALL);
}
else{
	searchDTO.setCategory(EProductCategory.valueOf(category));
}

String select = request.getParameter("select");
if (select == null) {
	searchDTO.setSelect(EProductSelect.ALL);
}
else {
	searchDTO.setSelect(EProductSelect.valueOf(select));
}

String search = request.getParameter("searchText");
if (search == null) {
	search = "";
	searchDTO.setSearch("");
}
else{
	searchDTO.setSearch(search);
}

List<ProductDTO> productList = ProductDAO.getDAO().selectProductList(searchDTO);
%>
<style type="text/css">
#product {
	width: 1000px;
	margin: 10px auto;
}

#btnDiv {
	text-align: right;
	margin-bottom: 5px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
	width: 200px;
}

.pname {
	width: 400px;
}

td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: blue;
}
</style>

<!-- 
<h2>상품목록</h2>
 -->
 
<div id="product">
	<!-- action 속성이 생략된 경우 현재 요청 URL 주소의 웹문서 재요청 -->
	<form method="post" id="productForm" action="">
		<select name="category" id="category">
			<%
			for (EProductCategory categoryEnum : EProductCategory.values()) {
			%>
			<option value=<%=categoryEnum.toString()%>
				<% if (categoryEnum.toString().equals(category)) {	%>
				selected="selected" 
				<% } %>>
				<%=categoryEnum.getValue()%>
			</option>
			<% } %>
		</select>	
		<select name="select" id="select">
			<%
			for (EProductSelect selectEnum : EProductSelect.values()) {
			%>
			<option value=<%=selectEnum.toString()%>
				<% if (selectEnum.toString().equals(select)) {	%>
				selected="selected" 
				<% } %>>
				<%=selectEnum.getValue()%>
			</option>
			<% } %>
		</select>	
		<input type="text" name='searchText' value="<%=search%>" placeholder='상품명검색'/>
		<button type="submit" id="searchBox">검색</button>	
	</form>
			
	<div id="btnDiv">
		<button type="button" id="addBtn">상품등록</button>
	</div>

	<table>
		<tr>
			<td>상품번호</td>
			<td>상품분류</td>
			<td>썸네일</td>			
			<td class="pname">제품명</td>
			<td>상품수량</td>
			<td>상품가격</td>
			<td>추천상품</td>
			<td>상품등록일</td>
			
		</tr>

		<% if (productList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 상품이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
		<% for (ProductDTO product : productList) { %>
		<tr>
			<td><%=product.getNo()%></td>
			<td><%=product.getCategory()%></td>
			<td><img src="<%=request.getContextPath()%>/images/<%=product.getThumbnail()%>" width=50 height=50/></td>
			<td><a
				href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=product_detail&productNum=<%=product.getNo()%>"><%=product.getName()%></a>
			</td>
			<td><%=DecimalFormat.getInstance().format(product.getCount())%></td>
			<td><%=DecimalFormat.getCurrencyInstance().format(product.getPrice())%></td>
			<td><%=product.getRecommand()%></td>
			<td><%=product.getReceivingDate()%></td>
		</tr>
		<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>

	

	<script type="text/javascript">
	$("#addBtn").click(function() {
		location.href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=product_add&productNum=product_add";
	});

	$("#category").change(function() {	
		//alert($(this).val());
		//$("#categoryForm").submit();
	});
	
	$("#category").click(function() {
		//alert("클릭");
	});

	</script>
</div>
<%-- <jsp:include page="/view/admin/product_detail.jsp?productNum=3" /> --%>











