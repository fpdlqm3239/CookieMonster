<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dao.OrderProductDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="xyz.itwill.dto.OrderProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@include file="/view/security/login_check.jspf" %>
 <%@include file="/view/cart_page/common_func.jsp" %>
 <%
 	
 	/* MemberDTO loginMember = new MemberDTO();
 	loginMember.setNo(61);
 	loginMember.setName("김은유"); */
 	
 	/* MemberDTO loginMember = new MemberDTO();
	loginMember.setNo(); */
 	
 	int memberNo = loginMember.getNo();
	
	int orderNo = Integer.parseInt(request.getParameter("order_no"));
	
	List<OrderProductDTO> orderList = OrderProductDAO.getDAO().selectOrderProdList(orderNo);
	
	//List<ProductDTO> productList = ProductDAO.getDAO().selectAllProductList();
	
%>
 
<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
    <link rel="stylesheet" href="../../maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/generic.css">  
    
    <script src="../../unpkg.com/sweetalert%402.1.2/dist/sweetalert.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/aos.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script> 
	<script src="http://maps.google.com/maps/api/js?v=3.3&amp;sensor=true"></script>

</head>
<body> 
   	
   	<jsp:include page="/view/template/header.jsp"></jsp:include>
 
 
	<div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
               ???
            </div>
          </div>
        </div>      
        
    
     <div class="container">      
     
      <div class="row mb-5">
       
       <div class="site-blocks-table col-md-12">
        <table class="table">
 		 <tr style="text-align:center;">
 		  <th>상품명</th> 		  
 		  <th>상품 가격</th> 		  
 		  <th>주문수량</th> 		  
 		  <th>배송상태</th>
 		  <th>결제 금액</th>
 		 </tr>
 		 
 		 <%
 		 
 		OrderDTO order = OrderDAO.getDAO().selectOrder(orderNo);
 		for(OrderProductDTO orderProd : orderList){
 			//ProductDTO product = orderProd.getProductDTO();
 			int orderProductPrice = orderProd.getProductDTO().getPrice() * orderProd.getCount();
         %>
 		 <tr>
 		  <td><%=orderProd.getProductDTO().getName() %></td>
 		  <td><%=orderProd.getProductDTO().getPrice() %></td>
 		  <td><%=orderProd.getCount() %></td> 		  
 		  <td><%=order.getStatus() %></td>
 		  <td><%=orderProductPrice%></td>
 		 </tr>
		<% } %>
		<%-- <div><%=order.getTotalPrice() %></div> --%>
        </table>        
       </div>
      </div>
      
      <div class="row mb-5">
       <div class="site-blocks-table col-md-12">
        <table class="table">
 		 <tr style="text-align:center;">
 		  <th>배송지</th>
 		  <th>주문인</th>
 		  <th>수령인</th>
 		  <th>받는사람번호</th>
 		  <th>배송상태</th>
 		 </tr>	    
 		 <tr>
 		  <td>[<%=strNullChk(order.getZipcode()) %>] <%=order.getMainAddress() %> <%=order.getDetailAddress() %> </td>
 		  <td><%=strNullChk(loginMember.getName()) %></td>
 		  <td><%=strNullChk(order.getReceiverName()) %></td>
 		  <td><%=order.getPhone() %></td>
 		  <td><%=order.getStatus() %></td>
 		 </tr>	
 		
 		 
        </table>
        
       </div>
      </div>        
     
     </div>
   

<script type="text/javascript">
$("#asdfimnas").click(function() {
	window.
});
</script>

	<div>
  		<jsp:include page="../template/footer.jsp"></jsp:include>
 	</div>
  ㅅ
  </body>
  </html>