<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@include file="/view/security/login_check.jspf"%>

   

<%	
	if(request.getMethod().equals("GET")){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	

	
	String reviewNo= request.getParameter("reviewNo");
	String productNo= request.getParameter("productNo");
	
	ReviewDTO review =  ReviewDAO.getDAO().selectReviewByNo(reviewNo);

	//상품검색
	ProductDTO product = ProductDAO.getDAO().selectProductByNo(productNo);
	
%>


    




  
<!DOCTYPE html>
<html>
<head>
    <title>GENERIC MONSTER</title>
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


    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2 class="h3 mb-3 text-black" style="font-weight: bold">후기 수정</h2>
          </div>
          <div class="col-md-7">

          <form action="<%=request.getContextPath()%>/view/detail_page/review_update_action.jsp" method="post" id="boardForm" enctype="multipart/form-data">
			<!-- <input type="hidden" name="productNo" value="<%=product.getNo()%>"> -->
			
              <input type="hidden" name="originPicture" value="<%=review.getPicture()%>">
              <input type="hidden" name="reviewNo" value="<%=reviewNo%>">
              <input type="hidden" name="productNo" value="<%=productNo%>">
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rpname" class="text-black" aria-disabled="false" style="font-weight: bold">제품명 </label>
                    <p id="rpname"><%=product.getName()%> 
                    	
                  </div>
   
                </div>
             
                
                <br>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rstars" class="text-black" style="font-weight: bold">별점 <span style="color: red;">*</span></label>
                    <br>
                   	<input type="radio" name="score" value="1" <%if(review.getScore() ==1){ %> checked="checked" <%} %>>&nbsp;&nbsp;★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="2" <%if(review.getScore() ==2){ %> checked="checked" <%} %>>&nbsp;&nbsp;★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="3" <%if(review.getScore() ==3){ %> checked="checked" <%} %>>&nbsp;&nbsp;★★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="4" <%if(review.getScore() ==4){ %> checked="checked" <%} %>>&nbsp;&nbsp;★★★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="5" <%if(review.getScore() ==5){ %> checked="checked" <%} %>>&nbsp;&nbsp;★★★★★&nbsp;&nbsp;
                  </div>
                </div>
                <br>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rtitle" class="text-black" style="font-weight: bold">후기 제목 <span style="color: red;">*</span></label>
                    <input type="text" class="form-control" id="rtitle" name="title" value="<%=review.getTitle()%>">
                  </div>
                </div>
				<br>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rcontent" class="text-black" style="font-weight: bold">후기 내용 <span style="color: red;">*</span></label>
                    <textarea name="content" id="rcontent" cols="30" rows="7" class="form-control"><%=review.getContent()%></textarea>
                  </div>
                </div>
                
                <br>
                <div class="form-group row">
                  <div class="col-lg-9">
                  	<label for="rorigin" class="text-black" style="font-weight: bold">후기 사진</label>
                  </div>  
                  </div>
                    <div class="col-lg-12">
                    <input type="file" name="picture" style="font-size: 1.0em;" value="불러오기" accept=".jpg,.jpeg,.png,.gif,.jfif">
                    </div>
                      <div>      
                      <br>    
                  <p>
                   &nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #fc7945;" class="icon-times-circle"></span>
                   &nbsp;후기 사진은 jpg, jpeg, png, gif, jfif 확장자 파일만 첨부 가능합니다.
                  </p>
                  </div>
        	
           		<br>
                
                <div class="form-group row">
                  <div class="col-lg-12">
                  <div id="message" style="color: red;"></div>
                    <input type="submit" class="btn btn-outline-dark btn-lg btn-block" value="작성 완료">
                  </div>
                </div>
                
              </div>
            </form>
          </div>
          <div class="col-md-5 ml-auto">
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h4 text-uppercase" style="font-weight: bold">주의 사항</span>
              <br>
             <p class="mb-0" style="text-align: justify;">
              &nbsp;<span style="font-weight: bold">산업안전보건법 제41조</span>에 따라 서비스를 제공하는 업무에 종사하는 근로자(이하 "고객응대근로자"라 한다)에 대하여 
			  고객의 폭언, 폭행, 그 밖에 적정 범위를 벗어난 신체적ㆍ정신적 고통을 유발하는 행위(이하 "폭언등"이라 한다)를
			  포함한 글은 <span style="color: red">미통보 삭제, 회원 탈퇴</span> 조치로 이어질 수 있습니다.
			  </p>
			  <br>
			  <p class="mb-0">
			   &nbsp;또한 해당 상품과 관련 없는 내용이나 사진/동영상, 동일 문자의 지나친 반복 등 부적합한 내용의 후기 작성은 통보없이 삭제 됩니다. </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  
<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	
	if($("#rtitle").val()=="") {
		$("#message").text("후기제목을 입력해 주세요.");
		$("#rtitle").focus();
		return false;
	}
	
	if($("#rcontent").val()=="") {
		$("#message").text("후기내용을 입력해 주세요.");
		$("#rcontent").focus();
		return false;
	}
});

</script>


<div>

  <jsp:include page="/view/template/footer.jsp"></jsp:include>
  
  
    </div>

  </body>
  </html>