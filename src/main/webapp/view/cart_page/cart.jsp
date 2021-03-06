<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/security/login_url.jspf"%>
<%
	
	

 

	
	List<CartDTO> cartList = CartDAO.getDAO().selectCartList(loginMember.getNo());
	
	String imagePath = request.getContextPath()+"/images/";
	
	//해당 멤버에 저장되어 있는 장바구니 상품들과 갯수로 총합계 계산
	int totalSum= 0;
	for(CartDTO cart : cartList){
		totalSum +=cart.getPrice()*cart.getCount();
	}
	
	
	

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
	<jsp:include page="/view/template/includes.jsp" />
</head>
<body> 
   <jsp:include page="/view/template/header.jsp"></jsp:include>
 

  <div class="site-wrap" >
<form  id="cartForm" >
 <input type="hidden" name="startRow" value="1">
 <input type="hidden" name="endRow" value="1">
 <input type="hidden" name="pageNum" value="1">
 
    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
         <div class="col-md-12">
          
            <div class="site-blocks-table">
              <table class="table" style="margin-top:100px;">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">상품명</th>
                    <th class="product-price">가격</th>
                    <th class="product-quantity">수량</th>
                   	<th class="product-total">합계</th>
                    <th class="product-remove">삭제</th>
                  </tr>
                </thead>
                <tbody>
                
                <%if(cartList.size()==0){ %>
         
              `		<tr>
              			<td colspan="6">장바구니가 비어있습니다</td>
              		</tr>
              
              	
                <%}else { %>
               	<%
               		
               		for(CartDTO cart : cartList){
               			
               	%>
                  <tr>
                    <td class="product-thumbnail">
                      <img src="<%=imagePath+cart.getThumbnail()%>"  alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name center-block">
                      <h2 class="h5 text-black"><%=cart.getName()%></h2>
                    </td>
                    <td><%=DecimalFormat.getInstance().format(cart.getPrice()) %></td><!-- 170,000 -->
                    <td>
                      <div class="input-group mb-3" style="max-width: 50px; margin-left: 100px">
                        <!-- <div class="input-group-prepend">
                          <button class="btn btn-outline-dark js-btn-minus" type="button">&minus;</button>
                        </div> -->
                        <input type="text"  class="form-control text-center" name="cqty" value="<%=cart.getCount() %>"  readonly="readonly" min="1 !important" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
		                <input type="hidden" name="pstock" value="187">
                        <!-- <div class="input-group-append">
                          <button class="btn btn-outline-dark js-btn-plus" type="button">&plus;</button>
                        </div> -->
                      </div>
                    </td>
                    <td class="sum"><%=DecimalFormat.getInstance().format(cart.getPrice()*cart.getCount())%></td>                    
                    <td><a href="#" onclick="f_cart_delete('<%=cart.getNo()%>')" btn btn-outline-dark height-auto btn-sm">X</a></td>
                  </tr>
                  
                  <script type="text/javascript">
					
</script>
                  
				<%} %> 	
				<%} %>
                </tbody>
              </table>
            </div>
           </div>
          
        </div>
	
	<!-- <div class="row">
      <div class="col-md-12 text-center">
         <div class="site-block-27">
            <ul>
			<li><a>&lt;</a></li>
				<li class="active"><span>1</span></li>
				<li><a>&gt;</a></li>
				</ul>
         </div>
      </div>        
    </div> -->
    <br>
        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              
              <div class="col-md-4 col-sm-4">
                <a href=" <%=request.getContextPath()%>/view/product_list_page/product_list.jsp?category=glasses" class="btn btn-outline-dark btn-sm btn-block">계속 쇼핑하기</a>
              </div>
              <div class="col-md-3 col-sm-3">
                <a id="cartDeletebtn" class="btn btn-outline-dark btn-sm btn-block" >카트 비우기</a>                
              </div>
            </div>            
          </div>
          
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">장바구니 합계</h3>
                  </div>
                </div>
                
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">총 합계</span>
                  </div>
                  <div class="col-md-6 text-right">
                  
                  
                  	
                    <strong class="text-black" id="totalSum">￦<%=DecimalFormat.getInstance().format(totalSum)%></strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                  <%if(cartList.size()!=0){ %>
         
              `		<button class="btn btn-outline-dark btn-lg btn-block" id="checkoutBtn">결제하기</button>
              	
                <%}%>
                    
                    <br>
                    <span id="message" style="color:red;"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>

    
  </div>
<script>
$("#cartUpdate").click(function() {
	$("#cartForm").attr("method", "post")
	$("#cartForm").attr("action", "/generic/cart/cart_update.jsp")
	$("#cartForm").submit()	
})

$("#checkoutBtn").click(function() {
	
	$("#cartForm").attr("action", "<%=request.getContextPath()%>/view/order_page/order.jsp");
		
})
$("#cartDeletebtn").click(function() {
	var result = confirm("정말로 모두 삭제하시겠습니까?");
	if(result){
		location.href="<%=request.getContextPath()%>/view/cart_page/cart_all_delete_action.jsp";		
	} else {
		
	}
})

function f_cart_delete (cartNo) {
	
	if(!confirm("정말 삭제하시겠습니까?")) {
		return;
	}
	
	location.href="<%=request.getContextPath()%>/view/cart_page/cart_delete_action.jsp?cartNo="+cartNo;
}



</script>

</body>
</html>

  