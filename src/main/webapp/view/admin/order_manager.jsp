<%@page import="xyz.itwill.enums.EOrderStatus"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dao.OrderDAO"%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<%

String status = request.getParameter("status");
String orderNo = request.getParameter("orderNo");

if(status != null && orderNo != null){
	OrderDAO.getDAO().updateStatus(orderNo, status);
	%>
<script type="text/javascript">	
alert("<%=status%>(으)로 변경하였습니다.");	
</script>
	<%
}

{
	int pageNum = 1;
	if(request.getParameter("pageNum") != null){
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	int pagePerSize = 10;	// 페이지당 게시글 콤보박스로 수정할수있게할것
	int totalBoard = 10; 	// dao로 가져올수 있게 수정
	int totalPage = (int)Math.ceil((double)totalBoard/pagePerSize);
	
	if(pageNum < 0 || pageNum > totalPage){
		pageNum = 1;
	}
	
	int startRow = (pageNum - 1) * pagePerSize + 1; 
	int endRow = pageNum * pagePerSize;
	
	
}


List<OrderDTO> orderList = OrderDAO.getDAO().selectAllOrder();
%>
<!-- 
<h2>주문관리</h2>
 -->
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


<div id="product">
	<table>
		<tr>
			<td>주문번호</td>
			<td>주문자</td>
			<td>주문날짜</td>			
			<td>주문상태</td>
			
		</tr>

		<% if (orderList.isEmpty()) { %>
		<tr>
			<td colspan="4">주문이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
		<% for (OrderDTO order : orderList) { 
		%>
		<tr>
			<td>
			<a href="<%=request.getContextPath()%>/view/admin/order_detail.jsp?orderNo=<%=order.getNo()%>"
			   onclick="window.open(this.href, '주문보기', 'width=800, height=700'); return false;">[ <%=order.getNo()%> ] 보기</a>
			</td>
			<td><%=MemberDAO.getDAO().selectNameByNo(order.getMemberNo())%></td>
			<td><%=order.getDate()%></td>
			<td>
			<form method="post" action="">
				<select name="status" id="status">
				<%
				for (EOrderStatus orderStatus : EOrderStatus.values()) {
				%>
				<option <% 
					if (orderStatus.getString().equals(order.getStatus())) {	%>
					value=<%=orderStatus.getString()%>
					selected="selected" 
					<% } %>>
					<%=
					orderStatus.getString()%>
				</option> 
				<%
				} 
				%>
				</select>
				<input type="hidden" value="<%=order.getNo()%>" name="orderNo"/>
				<button type="submit" id="changeStatus" class="changeStatus">변경</button>			
			</form>
			
			</td>
		</tr>
		<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>
	
	<%
		int blockSize = 5;
		int startPage = 5;
	%>

</div>
