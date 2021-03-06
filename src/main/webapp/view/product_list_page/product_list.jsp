<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.enums.EProductCategory"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ProductDTO> productList = new ArrayList();
	
	int pageNum = 1;
	
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	
	
	String category = request.getParameter("category");
	String keyword = request.getParameter("keyword");
	

	int productCount=0;
	
	if(keyword!=null){
		
		
	}else{
		
		if(category != null){
			if(category.equals("glasses")){
				 productCount = ProductDAO.getDAO().selectProductCount(EProductCategory.GLASSES);
				 
				 
				 productList = ProductDAO.getDAO().selectProductList(EProductCategory.GLASSES);
			}else if(category.equals("sunglass")){
				 
				 productCount = ProductDAO.getDAO().selectProductCount(EProductCategory.SUNGLASS);
				
			}
		}else {
			 productCount = ProductDAO.getDAO().selectProductCount(EProductCategory.ALL);
			 
		}
	}
	
		
	
	
	int pageSize = 8;
	
	int totalPage = (int)Math.ceil((double)productCount/pageSize);
	
	
	if(pageNum <= 0 || pageNum>totalPage){
		pageNum=1;
	}
	
	//1		9 	  17 	 25
	int startRow = pageSize*(pageNum-1)+1;
	
	//8	    16	  24	 32
	int endRow = pageSize*(pageNum);
	
	
	
	
	
	if(request.getParameter("keyword")!=null){
		
		productList = ProductDAO.getDAO().selectProductListByKeyword(keyword, startRow, endRow);
	}else{
		
		keyword = "";
		
		if(category != null){
			if(category.equals("glasses")){
				 productList = ProductDAO.getDAO().selectProductList(EProductCategory.GLASSES, startRow, endRow);
				 
				 
				
			}else if(category.equals("sunglass")){
				 
				productList = ProductDAO.getDAO().selectProductList(EProductCategory.SUNGLASS, startRow, endRow);
			}
		}else {
			productList = ProductDAO.getDAO().selectProductList(EProductCategory.ALL, startRow, endRow);
		}
	}
	
	
	
	
	
	
	
	
	
	
%>
  
<!DOCTYPE html>
<html>

<!-- Mirrored from itwill.xyz/generic/main/productList_glasses.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Jul 2021 09:59:26 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon"
		href="<%=request.getContextPath()%>/images/favicon.ico">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link??href="https://fonts.googleapis.com/css2?family=Anton&family=Nanum+Gothic:wght@400;700;800&display=swap"??rel="stylesheet">

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
 

	
    <div class="row">
        <div class="col-xl-12">
<%if(category!=null){ %>
          <div class="site-blocks-cover inner-page" style="background-image: url('<%if(category.equals("glasses")){%><%=request.getContextPath()%>/images/west cost_2.jpg'<%}else if(category.equals("sunglass")){ %> <%=request.getContextPath()%>/images/karma_2.jpg'<%}%>); background-repeat: no-repeat; background-size: cover; background-position: center"></div>  
          <%}else{ %>
          <div class="site-blocks-cover inner-page" style="background-image: url('<%=request.getContextPath()%>/images/mig_4.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center"></div>  
          <%} %>    
          <div class="custom-border-bottom py-3">
            <div class="container">
              <div class="row">
                <div class="col-md-12 mb-0"><a href="../index-2.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black"><%if(category !=null){%><%if(category.equals("glasses")){ %>??????<%}else if(category.equals("sunglass")){%>????????????<%} %><%}else if(keyword!=null){ %>????????? : <%=keyword%><%}else{%>??????<%} %></strong></div>
                </div>
              </div>
            </div>
          </div>
   		</div>  	
   		
	<div class="container">
		<div class="row mb-5">
	
	<%if(productList.size() == 0) {%>
		<p>????????? ????????? ????????????</p>
	<%}else{ %>
		<%for(ProductDTO product : productList) { %>
		
			    <div class="col-lg-3 col-md-4 item-entry mb-6">
			       <a href="<%=request.getContextPath()%>/view/detail_page/product_detail.jsp?no=<%=product.getNo()%>" class="product-item md-height bg-gray d-block">
			         <img src="<%=request.getContextPath()%>/images/<%=product.getThumbnail()%>"  alt="Image" class="img-fluid">                  
			      </a>
			        <h2 class="item-title2"><a href="product_single_pagec313.html?pid=1015"><%=product.getName()%></a></h2>
			         
			            <div class="item-price"><strong class="item-price"> <%=DecimalFormat.getInstance().format(product.getPrice())%></strong></div>
			    </div>
			    
			    <%} %>
		<%} %>
			   
			
		
		
		</div>
	</div>         
	
	     
    
    <div class="row">
      <div class="col-md-12 text-center">
         <div class="site-block-27">
            <ul>
			
			<li><a>&lt;</a></li>
			
			
			
				<%for(int i =1; i<=totalPage; i++){%>
					<li <%if(pageNum == i){%> class="active"<%} %>><span><%if(pageNum != i){ %> <a href="<%=request.getContextPath()%>/view/product_list_page/product_list.jsp?pageNum=<%=i%><%if(category!=null){ %>&category=<%=category%><%}else if(keyword!=null){ %>&keyword=<%=keyword%><%}%>"> <%=i%></a><%}else{%> <%=i%> <%} %></span></li>
				<%} %>

				
											
			
			
			
				<li><a>&gt;</a></li>
			
				</ul>
         </div>
      </div>        
    </div>
	<br>
	
	


<div>

  
<jsp:include page="/view/template/footer.jsp"></jsp:include>
  
    </div>

  </body>
  
<!-- Mirrored from itwill.xyz/generic/main/productList_glasses.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Jul 2021 10:01:19 GMT -->
</html>

 