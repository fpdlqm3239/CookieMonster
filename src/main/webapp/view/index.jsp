<%@page import="xyz.itwill.enums.EProductSelect"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
//List<ProductDTO> productList = ProductDAO.getDAO().selectAllProductList();
List<ProductDTO> recommandProductList = ProductDAO.getDAO().selectProductList(EProductSelect.RECOMMAND);
List<ProductDTO> arrivalProductList = ProductDAO.getDAO().selectProductList(EProductSelect.RECEIVING_DATE);
System.out.println(arrivalProductList.size());
%>


<!DOCTYPE html>
<html>
<% 
	String message = (String)session.getAttribute("message");
	if(message!=null){
		session.removeAttribute("message");
		%>
		<script type="text/javascript">
		alert('<%=message %>');
		</script>
		<%
	}
	
%>

<!-- Mirrored from itwill.xyz/generic/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Jul 2021 12:17:43 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<title>COOKIE MONSTER</title>
<meta charset="utf-8">

<jsp:include page="/view/template/includes.jsp" />

</head>
<body>

	<jsp:include page="/view/template/header.jsp"></jsp:include>

	<!--메인 슬라이드-->
	<div class="container"></div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="<%=request.getContextPath()%>/images/gallery1_image_pc.jpg">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="<%=request.getContextPath()%>/images/nano-collection.png">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="<%=request.getContextPath()%>/images/JENNY.png">
			</div>
			<!-- 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"
				aria-hidden="tr
              ue"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</a>
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
		</div>
	</div>


	<!--Recommend Products-->
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="title-section mb-5 col-12">
					<h2 class="text-uppercase">Recommend Products</h2>
				</div>
			</div>
			<div class="row">

				<%
				int i=0;
				for (ProductDTO product : recommandProductList) {
					if(!(i<3)){
						break;
					}
					i++;
				%>
				<div class="col-lg-4 col-md-6 item-entry mb-4">
					<a
						href="<%=request.getContextPath()%>/view/detail_page/product_detail.jsp?no=<%=product.getNo()%>"
						class="product-item md-height bg-gray d-block"> <img
						src="<%=request.getContextPath()%>/images/<%=product.getThumbnail()%>"
						alt="Image" class="img-fluid">
					</a>

					<h2 class="item-title">
						<a><%=product.getName()%></a>
					</h2>

					<div class="item-price">
						<strong class="item-price"><%=product.getPrice() + "원"%></strong>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>

	<!--video player-->
	<div class="videoplayer">
		<video autoplay muted loop id="myVideo">
			<source src="<%=request.getContextPath()%>/images/video1.mp4"
				type="video/mp4">
		</video>
		<div class="content">
			<span>COOKIE MONSTER x YE RIN ㅣ WEWU
				<button id="myBtn">
					<a
						href="<%=request.getContextPath()%>/view/product_list_page/product_list.jsp?no=<%=0%>">상품보기()</a>
				</button>
			</span>
		</div>
	</div>



	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="title-section text-center mb-5 col-12">
					<h2 class="text-uppercase">© 2021 COOKIE MONSTER</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 block-3">
					<div class="nonloop-block-3 owl-carousel">
+            			
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="title-section mb-5 col-12">
					<h2 class="text-uppercase">Arrival Products</h2>
				</div>
			</div>
			<div class="row">

				<%
				i=0;
				for (ProductDTO product : arrivalProductList) {
					if(!(i<3)){
						break;
					}
					i++;
				%>
				<div class="col-lg-4 col-md-6 item-entry mb-4">
					<a
						href="<%=request.getContextPath()%>/view/detail_page/product_detail.jsp?no=<%=product.getNo()%>"
						class="product-item md-height bg-gray d-block"> <img
						src="<%=request.getContextPath()%>/images/<%=product.getThumbnail()%>"
						alt="Image" class="img-fluid">
					</a>

					<h2 class="item-title">
						<a><%=product.getName()%></a>
					</h2>

					<div class="item-price">
						<strong class="item-price"><%=product.getPrice() + "원"%></strong>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" style="height: 600px;">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath()%>/images/store_img1.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/images/store_img2.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/images/store_img3.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


	<div class="store_visit">
		<p>매장을 방문하여 쿠키몬스터를 느껴보세요.</p>
		<a href="<%=request.getContextPath()%>/view/notice_page/notice_detail.jsp?no=142&pageNum=1&search=&keyword="
			class="btn btn-dark">매장 안내</a>
	</div>



	<div>

		<jsp:include page="/view/template/footer.jsp"></jsp:include>


	</div>

</body>

<script>
	$(document).ready(function() {
		$(".carousel slide").owlCarousel({
			items : 1,
			loop : true,
			autoplay : true,
			autoplayTimeout : 4000,
			autoplayHoverPause : true
		});
	});
</script>

<!-- Mirrored from itwill.xyz/generic/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Jul 2021 12:21:40 GMT -->
</html>

