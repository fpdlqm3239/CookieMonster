<%@page import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dao.PictureDAO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.PictureDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	//no 파라미터가 없이 요청시 에러페이지로 이동
	if(request.getParameter("no") ==null){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	


	//no 파라미터 저장
	String productNo = request.getParameter("no");
	//상품 검색
	ProductDTO product = ProductDAO.getDAO().selectProductByNo(productNo);
	//상품 상세 이미지들 검색
	List<PictureDTO> pictureList = PictureDAO.getDAO().selectPictureByProductNo(product.getNo());
	
	//이미지가 있는 경로를 변수에 저장
	String imagePath = request.getContextPath()+"/images/"; 
	
	
	
	int reviewCount = ReviewDAO.getDAO().selectReviewCount(productNo);
	
	int pageNum = 1;
	if(request.getParameter("pageNum")!=null){
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize = 5;
	
	int totalPage = (int)Math.ceil((double)reviewCount/pageSize);
	
	
	if(pageNum <= 0 || pageNum>totalPage){
		pageNum=1;
	}
	
	//1		6 	  11 	 16
	int startRow = pageSize*(pageNum-1)+1;
	
	//5 	10	  15	
	int endRow = pageSize*(pageNum);
	
	
	
	List<ReviewDTO> reviewList =  ReviewDAO.getDAO().selectReviewList(productNo, startRow, endRow);
	
	

	
	//로그인없이 볼수 있는 페이지지만 후기작성 버튼 활성화 비활성화 결정하기위해 로그인정보 저장
	MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
	
	
%>

<!DOCTYPE html>
<html>

<!-- Mirrored from itwill.xyz/generic/main/product_single_page.jsp?pid=1017 by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Jul 2021 10:29:34 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

	<link rel="shortcut icon" type="image/x-icon"
		href="<%=request.getContextPath()%>/images/favicon.ico">

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
	<jsp:include page="/view/template/includes.jsp"/>
	
</head>
<body> 
    <jsp:include page="/view/template/header.jsp"></jsp:include>
 

<body class="scrollBody" data-spy="scroll" data-target=".navbar" data-offset="50"> 
<form id="addCartForm">
	<input type="hidden" name="productNo" value="<%=product.getNo()%>">
<!-- add to cart 에 보낼때 productNum과 수량(count) 보낼것 -->
	
    <div class="site-section">
      <div class="container">
      	<div class="padding_container" style="margin-top: 35px;">
        <div class="row">
          <div class="col-md-6">
            <div class="item-entry">
                <img src="<%=imagePath+product.getThumbnail()%>" alt="img" class="responsive">                          
            </div>
          </div>
          <div class="col-md-6">
		  <br>
          <h2 class="text-black"><%=product.getName() %></h2>
         
          <p><strong class="text-primary h4"><%=DecimalFormat.getInstance().format(product.getPrice())%>원</strong></p>
          <p>SILVER</p>
          <br>
          <p><%=product.getDescription()%></p>           
          <br><br>
            <div class="mb-5">
		      <p style="float:right;"><button id="addCartBtn"  class="buy-now btn btn-sm height-auto px-4 py-3 btn-outline-dark">Add To Cart</button></p>
                <div class="input-group mb-3" style="max-width: 120px;">
                  <div class="input-group-prepend">
                   <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                  </div>
                  <input type="text" id="cqty" name="count" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                <div class="input-group-append">
                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
              </div>
              
             <span style="color : red;"></span>
             
          </div>
        </div>       
       
         <p style="font-size: 50px"><strong class="text-primary h4">Price : &nbsp;&nbsp;<span id="price"></span> 원</strong></p>
      </div>      
    </div>  
      
  <div>
  </div>
  <br>
  </div>
  </div>
  </div> 
  </form>
  <!-- 상세페이지 탭 -->
   
  <div class="container">
    <!-- Nav tabs -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#section1">상품보기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#section2">상품후기</a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="#section3">교환 및 환불 규정</a>
          </li> 
          
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/view/notice_page/notice.jsp">브랜드이슈</a>
          </li>               
        </ul>
      
      
      <div id="section1" class="container-fluid" style="padding-top:70px;padding-bottom:70px">
        <div class="detail_img">
        <%if(!pictureList.isEmpty()){ %>
        	<%for(PictureDTO picture : pictureList){ %>
        <img alt="img" src="<%=imagePath+picture.getContent()%>" width="100%"><br><br>
        	<%} %>
        <%} %>
        </div>
        <h4>공식 온라인에서만 제공하는 특별한 선물포장 서비스</h4>
        <h7>공식 온라인스토어에서 상품을 구매하시는 모든 고객님께 특별한 선물포장 서비스가 제공됩니다.<br>리본 포장이 된 케이스에 극세사 섬유 클리너가 동봉되어, 제품을 안전하게 보호해주는 케이스에 담아 무료로 배송됩니다.</h7><br><br>
        <img alt="img" src="<%=imagePath%>gift.jpg" width="100%">
      </div>
      
      <div id="section2" class="container-fluid" style="padding-top:70px;padding-bottom:70px">
      <br><br>
		<!-- 상품후기 출력영역 -->
		










        
 
 
	<h2 style="font-weight: bold">상품후기(<%=reviewCount%>)</h2>
	
	<%if(loginMember!=null){ %>
	
   	<button type="button" class="btn btn-dark" id="RwriteBtn" style="float: right; height: 33px;">후기작성</button></a>
	<%} %>
    
	<br><br>
	
	<table class="table table-hover tbcenter" >
	 <thead>
	    <tr style="text-align: center;">
	      <th scope="col" style="width: 15%">평점</th>
	      <th scope="col" style="width: 50%">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성날짜</th>
	    </tr>
	  </thead>
	
	
		  
			  <tbody>  
			  		<%if(reviewList.isEmpty()){ %>
			  			<tr>
			  				<td colspan="4" style="text-align: center;">등록된 후기가 없습니다</td>
			  			</tr>
			  		<%}else { %>
			  			<%for(ReviewDTO review : reviewList){ %>
						  <tr>
			      <th scope="row">
			      	<!-- 별점 출력부 -->
			      	
			      	
			      	<%if(review.getScore()==1){%>
			      		★
			      	<%}else if(review.getScore()==2){ %>
			      		★★
			      	<%}else if(review.getScore()==3){ %>
			      		★★★
			      	<%}else if(review.getScore()==4){ %>
			      		★★★★
			      	<%}else if(review.getScore()==5){ %>
			      		★★★★★
			      	<%} %>
			      </th>
			      <td id="rslide" class="rslide board_title"><%=review.getTitle().replace("\n", "<br>") %>
			     
					<div style="display: none" id="rboard_content" class="rboard_content">
					
					
						<br>
																	
						<!-- 이미지 출력부 -->
						<%if(review.getPicture()!=null){%>
						
							<img src="<%=imagePath+review.getPicture()%>" style="height: 300px;" class="img-fluid"> 
							<br><br>
							<%} %>
						
						
						<!-- 내용 출력부 -->
					<%=review.getContent().replace("\n","<br>")%>
						
					</div>
			       
			      </td>
			      <!-- 사용자가 게시글 작성시 입력한 이름 출력부 -->
			      <!-- cm_review 테이블에 작성자 컬럼 추가 필요 -->
			      <td><%=review.getWriter()%></td>
			      
			      <!-- 게시글 작성 시간 출력부 -->
			      <td><%=review.getCreateDate()%> 
			      <%if(loginMember != null){ %>
			      <%if(review.getMemberNo() == loginMember.getNo()){ %>
			      <form id="updateForm" action="<%=request.getContextPath()%>/view/detail_page/review_update.jsp" method="post">
			      	<input type="hidden" name="reviewNo" value="<%=review.getNo()%>">
			      	<input type="hidden" name="productNo" value="<%=productNo%>">
			      		&nbsp;&nbsp;<button id="updateBtn" type="submit">수정</button>
			      		<button id="deleteBtn" type="submit">삭제</button>
			      

					<%} %>
					<%} %>
			      </td>
			    </tr>
			    	<%} %>
				<%} %>
			  </tbody>
			    
			
			    
			  		
				
			
		
	
	 
	  
	</table>
	



	<!-- 페이지 버튼 -->	
	<div class="row">
      <div class="col-md-12 text-center">
         <div class="site-block-27">
            <ul>
			
			<li><a>&lt;</a></li>
			
			
			<%for(int i =1; i<=totalPage; i++){ %>
				
				<li <%if(pageNum==i){ %> class="active"<%} %>><span><%if(pageNum!=i){ %><a href="<%=request.getContextPath()%>/view/detail_page/product_detail.jsp?no=<%=productNo%>&pageNum=<%=i%>#section2"><%=i%></a><%}else{%><%=i%><%} %></span></li>
				
				
				<%} %>							
			
			
			
				<li><a>&gt;</a></li>
			
				</ul>
         </div>
      </div>        
    </div>
    <br>
    <script>
	function deleteRBoard(rno, pid) {
		var result = confirm("정말로삭제하시겠습니까?");
		if(result){
			location.href="../board/r_board_delete_actionb1f8.html?pid="+pid+"&rno="+rno;			
		} else {
			
		}
	}
	
	</script>
	

        </div>
      
      <div id="section3" class="container-fluid" style="padding-top:70px;padding-bottom:70px">
      <br><br>
      	<!-- 상품문의 출력영역 -->
      











    

 

	
      


	
	<script>
	
	
	
	function deleteBoard(qno, pid) {
		var result = confirm("정말로삭제하시겠습니까?");
		if(result){
			location.href="../board/q_board_delete_actionb1f8.html?pid="+pid+"&qno="+qno;			
		} else {
			
		}
	}
	
	
	
	</script>
	
       

      <div id="section4" class="container-fluid" style="padding-top:70px;padding-bottom:70px">
      <br><br>
        <h2 style="font-weight: bold">교환 및 환불 규정</h2><br><br>
        <div class="exchange_cont">
			<div class="left_cont">
				
				<div class="cont">
					<h5><strong>■ 배송 가이드</strong></h5>
					<div class="admin_msg">
						· 배송 방법 택배( CJ 대한통운), 퀵서비스, 해외배송가능 ( 우체국 EMS), 전국 (도서산간 포함) <br>
						· 배송비용 : 5만원 이상 무료배송 / 퀵서비스 후불 (3,000원 지원) / 해외배송 선불 <br>
						· 매장수령 : 직접 매장 수령을 원하시면, 재고 확인을 위해 미리 고객센터로 연락후, 방문바랍니다. <br>
						· 매장주소 : 서울시 금천구 벚꽃로 298 (가산동) 대륭포스트타워 6차 105호
					</div>
				</div>
				<br>

				<div class="cont">
					<h5><strong>■ 배송 기간</strong></h5>
					<div class="admin_msg" style="margin-bottom:0;">
						· 택배 : 입금 일 기준 1~3일 소요 (주말,공휴일 제외 /  도서산간지역 2~5일 추가) <br>
						· 퀵서비스 : 서울 및 수도권 일부지역가능 (그 외 별도문의) <br>
						· 해외배송 : 평균 3~15일 (국가별로 차이있음)
					</div>
				</div>
			</div>
			<br>
			
			<div class="right_cont">
				<div class="cont">
					<h5><strong>■ 교환 및 반품 가이드</strong></h5>
					<div class="admin_msg">
						· 교환 및 반품 절차 안내 <br>
						- 교환 및 반품은 수령 후 2일 이내 게시판 및 고객센터로 사전접수해 주신 후 <br>
						  &nbsp; 7일 이내에 반송해주셔야 처리 가능합니다. <br>						

						· 교환 및 반품이 불가한 경우 <br>
						&nbsp;&nbsp;① 사용방지 텍 제거 및 제품 손상 <br>
						&nbsp;&nbsp;② 제품 수령 후 일주일 경과 <br>
						&nbsp;&nbsp;③ 렌즈교체 및 피팅을 받은 경우 <br>
						&nbsp;&nbsp;④ 정품 구성품 훼손 및 분실 등 <br>
						&nbsp;&nbsp;⑤ 불량미비 <br>
						- 해상도차이로 인한 색상차이, 후공정으로 인한 미세기스, 피팅으로 완화되는 불균형 등 <br>
						- 안경테에 장착되어있는 렌즈는 프레임의 형태의 변형을 막기위한 플라스틱 데모렌즈 입니다. <br>
						&nbsp; 데모렌즈의 미세한 스크래치는 불량사유가 될 수 없습니다. <br>
					</div>
				</div>
				<br>
				<div class="cont">
					<h5><strong>■ 환불 안내</strong></h5>
					<div class="admin_msg">
						· 환불시 반품 여부를 확인한 후 결제 금액을 환블해 드립니다. <br>
						· 신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다. <br>
						· 신용카드 결제일자에 맞추어 대금이 청구될 경우, 익월 신용카드 대금청구시 카드사에서 환급처리 <br>
						&nbsp; 됩니다.
					</div>
				</div>
			</div><!-- //right_cont -->
		</div>
      </div>
     </div>
    </div>
<!-- 푸터 -->

<div>

  <jsp:include page="/view/template/footer.jsp"></jsp:include>
  
    </div>

  </body>
  
<!-- Mirrored from itwill.xyz/generic/main/product_single_page.jsp?pid=1017 by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Jul 2021 10:30:03 GMT -->
</html>


<script type="text/javascript">

$("#RwriteBtn").click(function() {
	location.href = '<%=request.getContextPath()%>/view/detail_page/review_write.jsp?productNo=<%=product.getNo()%>';
})

$('.rslide').click( function() {
	  $(this).find('.rboard_content').slideToggle();     	
} );

 $( '.qslide' ).click( function() {
	$(this).find( '.qboard_content' ).slideToggle();
} );
 
$("#addCartBtn").click(function() {	
	$("#addCartForm").attr("action","<%=request.getContextPath()%>/view/cart_page/cart_insert_action.jsp");
	$("#addCartForm").attr("method","post");
	$("#addCartForm").submit();	
	
});

 
var count = parseInt($("#cqty").val());
var price = count*<%=product.getPrice()%>;
var strPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
$("#price").text(strPrice);

    $('.js-btn-minus').click(function(e) {	
    	
        if (parseInt($("#cqty").val()) > 1) {
        	 $("#cqty").val(count-1);
             count = parseInt($("#cqty").val());
             price = count*<%=product.getPrice()%>
             strPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
             $("#price").text(strPrice);
        }
    });
    
    
    
    $('.js-btn-plus').click(function(e) {	
   	 
     $("#cqty").val(count+1);
     count = parseInt($("#cqty").val());
     price = count*<%=product.getPrice()%>
     strPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
     $("#price").text(strPrice);
});
    
   
    $("#updateBtn").click(function(e){
    	 $("#updateForm").attr("action","<%=request.getContextPath()%>/view/detail_page/review_update.jsp");
    	 $("#updateForm").attr("method","post");
    	 $("#updateForm").submit();
    	 
    })
    
    $("#deleteBtn").click(function(e){
    	if(confirm("정말 삭제하시겠습니까?")){
		     $("#updateForm").attr("action","<%=request.getContextPath()%>/view/detail_page/review_delete_action.jsp");
		   	 $("#updateForm").attr("method","post");
		   	 $("#updateForm").submit();
    	}
    })
    
    
   
   


</script>
