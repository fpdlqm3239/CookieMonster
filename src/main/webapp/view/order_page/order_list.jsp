<%@page import="xyz.itwill.dao.OrderDAO"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dto.OrderProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
    th, td {text-align: center !important;}
    .contents {
  width: 700px ;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto; }
  @media (min-width: 576px) {
    .container {
      max-width: 540px; } }
  @media (min-width: 768px) {
    .container {
      max-width: 720px; } }
  @media (min-width: 992px) {
    .container {
      max-width: 960px; } }
  @media (min-width: 1200px) {
    .container {
      max-width: 1140px; } }
      
     #totprice {
     	text-align: right;
     }
    </style>
  
 

  
  <div class="site-wrap">
    
<%@include file="/view/security/login_check.jspf" %>
<%
	//로그인 하기 귀찬아서 임시 로그인 정보 생성
	/* MemberDTO loginMember = new MemberDTO();
	loginMember.setNo(61);*/
		
	int memberNo = loginMember.getNo(); 
	
	List<OrderDTO> orderList = OrderDAO.getDAO().selectOrderList(memberNo);
%>

  
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/images/favicon.ico">

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
        
        
    <div class="site-section">
     <div class="container">
     <div class="contents"> 
     
      <div class="row mb-5">
       
       
       <div class="site-blocks-table col-md-12">
       <form action="orderList2" method="post">
        <table class="table">
        
 		 <tr>
 		  <th>주문번호</th>
 		  <th>받는분 이름</th>
 		  <th>주문날짜</th> 		  
 		  <th>배송상태</th>
 		  <th>주문상세보기</th>
 		 </tr>
 		 
 		<%if(orderList.size()==0){ %>
			<tr>
            	<td colspan="5">주문하신 상품이 없습니다.</td>
            </tr>
              
            <%}else { 
            	
            
   			int orderSize = orderList.size();
   		
   			for(OrderDTO order : orderList){
        %>
                 
 		 <tr>
 		  <td><%=order.getNo() %> </td>
 		  <td><%=order.getReceiverName() %> </td>
 		  <td><%=order.getDate() %> </td>
 		  <td><%=order.getStatus() %> </td>
 		  <td><a href="#" onclick="detail_order('<%=order.getNo()%>')" >주문상세보기</a></td>
 		 </tr>
 		 
 		 	<% } %>
 		 <% } %>
        </table>
        </form>        
       </div>
      </div>
                   
     </div>
     </div>
    </div>
  
    
  </div>

  

 
  <script type="text/javascript">
  function detail_order(order_no) {
		location.href="<%=request.getContextPath()%>/view/order_page/order_list_detail.jsp?order_no="+order_no;		
	}
 
  </script>
  
  <div>
  	<jsp:include page="../template/footer.jsp"></jsp:include>
  </div>
  
  </body>
  </html>
    