<%@page import="xyz.itwill.dao.OrderProductDAO"%>
<%@page import="xyz.itwill.dto.OrderProductDTO"%>
<%@page import="xyz.itwill.enums.EOrderStatus"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dao.OrderDAO"%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String orderNo = request.getParameter("orderNo");
if (orderNo != null) {
	//에러처리
}
OrderDTO order = OrderDAO.getDAO().selectOrder(Integer.parseInt(orderNo));

List<OrderProductDTO> orderProductList = OrderProductDAO.getDAO().selectOrderProdList(order.getNo());
System.out.println(orderProductList.size());
int totalPrice = 0;
for(OrderProductDTO orderProduct : orderProductList){
	totalPrice += orderProduct.getProductDTO().getPrice() * orderProduct.getCount();  
}
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


<h2>주문정보</h2>
<div id="order">
	<table>
		<tr>
			<td>주문번호</td>
			<td><%=order.getNo()%></td>
		</tr>
		<tr>
			<td>주문일자</td>
			<td><%=order.getDate()%></td>
		</tr>
		<tr>
			<td>주문자</td>
			<td><%=order.getMemberNo()%></td>
		</tr>
		<tr>
			<td>주문상태</td>
			<td><%=order.getStatus()%></td>
		</tr>
		
		
	</table>
	<div>&nbsp;</div>
</div>

<h2>배송정보</h2>
<div id="delivery">
	<table>
		<tr>
			<td>배송주소</td>
			<td><%=order.getMainAddress()%>, <%=order.getDetailAddress()%></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><%=order.getPhone()%></td>
		</tr>
		<tr>
			<td>택배사</td>
			<td><%=order.getCourier()%></td>
		</tr>
		<tr>
			<td>송장번호</td>
			<td><%=order.getInvoice()%></td>
		</tr>
	</table>
	<div>&nbsp;</div>
</div>

<h2>결제정보</h2>
<div id="payment">
	<table>
		<tr>
			<td>주문금액</td>
			<td><%=totalPrice%></td>
		</tr>
	</table>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<table>
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<% for(OrderProductDTO orderProduct : orderProductList){ %>
		<tr>
			<td><%=orderProduct.getProductDTO().getNo()%></td>
			<td><%=orderProduct.getProductDTO().getCategory()%></td>
			<td><%=orderProduct.getProductDTO().getName()%></td>
			<td><%=orderProduct.getCount()%></td>
			<td><%=orderProduct.getProductDTO().getPrice()*orderProduct.getCount()%></td>
		</tr>
		<% } %>
	</table>
	<div>&nbsp;</div>
</div>
