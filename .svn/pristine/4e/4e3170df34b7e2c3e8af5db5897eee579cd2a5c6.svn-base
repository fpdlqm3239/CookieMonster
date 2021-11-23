<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@include file="/view/security/login_check.jspf"%>

   

<%	
	//상품 no 가 파라미터에 없으면 비정상적인 접근
	if(request.getParameter("productNo")==null){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}

	

	
	String productNo= request.getParameter("productNo");

	//상품검색
	ProductDTO product = ProductDAO.getDAO().selectProductByNo(productNo);
	
%>


    




  
<!DOCTYPE html>
<html>
<head>
    <title>GENERIC MONSTER</title>
    <meta charset="utf-8">
    
    <jsp:include page="/view/template/includes.jsp" />

</head>
<body> 
     <jsp:include page="/view/template/header.jsp"></jsp:include>


    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2 class="h3 mb-3 text-black" style="font-weight: bold">후기 작성</h2>
          </div>
          <div class="col-md-7">

          <form action="<%=request.getContextPath()%>/view/detail_page/review_write_action.jsp" method="post" id="boardForm" enctype="multipart/form-data">
			<input type="hidden" name="productNo" value="<%=product.getNo()%>">
			
              
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
                   	<input type="radio" name="score" value="1">&nbsp;&nbsp;★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="2">&nbsp;&nbsp;★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="3">&nbsp;&nbsp;★★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="4">&nbsp;&nbsp;★★★★&nbsp;&nbsp;
                   	<input type="radio" name="score" value="5" checked="checked">&nbsp;&nbsp;★★★★★&nbsp;&nbsp;
                  </div>
                </div>
                <br>
                
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rtitle" class="text-black" style="font-weight: bold">후기 제목 <span style="color: red;">*</span></label>
                    <input type="text" class="form-control" id="rtitle" name="title">
                  </div>
                </div>
				<br>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="rcontent" class="text-black" style="font-weight: bold">후기 내용 <span style="color: red;">*</span></label>
                    <textarea name="content" id="rcontent" cols="30" rows="7" class="form-control"></textarea>
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