<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>







  
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
 

<div class="site-wrap">
    

    
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="<%=request.getContextPath()%>/view/index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">감사합니다</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">감사합니다!</h2>
            <p class="lead mb-5">결제가 완료되었습니다.</p>
            <p><a href="<%=request.getContextPath()%>/view/index.jsp" class="btn btn-sm height-auto px-4 py-3 btn-outline-dark">메인으로 돌아가기</a></p>
          </div>
        </div>
      </div>
    </div>

    

    
  </div>
  
<div>

  <jsp:include page="/view/template/footer.jsp"></jsp:include>
  
  
    </div>

  </body>
  </html>