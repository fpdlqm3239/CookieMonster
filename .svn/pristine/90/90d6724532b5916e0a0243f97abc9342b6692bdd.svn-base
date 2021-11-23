<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
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

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
<title>COOKIE MONSTER</title>
<meta charset="utf-8">

<jsp:include page="/view/template/includes.jsp" />

</head>
<body> 
    <jsp:include page="/view/template/header.jsp"></jsp:include>
  
    <div class="site-section">
      <div class="container">
      <div class="row mb-5"></div>
   	<form id="find_id" name="findForm" action="<%=request.getContextPath()%>/view/member_page/find_id_action.jsp" method="post">
      <h2 class="h3 mb-3 text-black" style="text-align: center;">이메일 찾기</h2>
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <div class="p-3 p-lg-5 border">
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="mname" class="text-black">이름 </label>
                  <input type="text" class="form-control" id="mname" name="mname" value="">
                  <div id="message_1"></div>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="memail" class="text-black">전화번호 </label>
                  <input type="text" class="form-control" id="phone" name="phone">
                  <div id="message_2"></div>
                </div>
              </div>
			  <button type="submit" class="btn btn-outline-dark btn-lg btn-block">이메일 찾기</button>
            </div>
          </div> 
        </div>
          </form>
      </div>
    </div>
    
    
     <script type="text/javascript">
		$("mname").focus();
		
		$("#find_id").submit(function() {
			 var checkPhone = /^\d{3}-\d{3,4}-\d{4}$/; 

			if($("#mname").val()=="") {
				$("#message_1").text("이름을 입력해주세요.");
				$("#mname").focus();
				return false;
			}else if($("#phone").val()=="") {
				$("#message_2").text("전화번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}else if(checkPhone.test($("#phone").val())!=true) {
				alert("올바른 형식의 전화번호로 입력해 주세요.");
				$("#phone").focus();
				return false ;
			}

		});
		
		
		
	</script>

	
<div>

 <jsp:include page="/view/template/footer.jsp"></jsp:include>
  
  
    </div>

  </body>
  
<!-- Mirrored from itwill.xyz/generic/member/find_id.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Jul 2021 12:14:10 GMT -->
</html>  