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
      <form id="find_pw" name="findForm" action="<%=request.getContextPath()%>/view/member_page/find_pw_action.jsp" method="post" >
      <h2 class="h3 mb-3 text-black" style="text-align: center;">패스워드 찾기</h2>
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <div class="p-3 p-lg-5 border">
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="mid" class="text-black">전화번호 </label>
                  <input type="text" class="form-control" id="mid" name="phone">
                  <div id="message_1"></div>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="mname" class="text-black">이름 </label>
                  <input type="text" class="form-control" id="mname" name="name">
                  <div id="message_2"></div>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="memail" class="text-black">이메일 </label>
                  <input type="text" class="form-control" id="memail" name="email">
                  <div id="message_3"></div>
                </div>
              </div>
			  <button type="submit" class="btn btn-outline-dark btn-lg btn-block" >패스워드 재설정</button>
            </div>
          </div>
        </div>
        </form>
        <!-- </form> -->
      </div>
    </div>
    
         <script type="text/javascript">
		$("#mid").focus();
		
		$("#find_pw").submit(function() {
			
    		var idReg=/^\d{3}-\d{3,4}-\d{4}$/; 
    		if($("#mid").val()=="") {
    			$("#message_1").text("폰번호를 입력해주세요.");
    			return false;
    		} else if(!idReg.test($("#mid").val())) {
    			$("#message_1").text("올바른 형식의 폰번호로 입력해 주세요.");
    			return false;
    		} else if($("#mname").val()=="") {
				$("#message_2").text("이름을 입력해주세요.");
				$("#mname").focus();
				return false;
			 var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email 유효성 검사 정규식
			}else if($("#memail").val()=="") {
				$("#message_3").text("이메일을 입력해주세요.");
				$("#memail").focus();
				return false;
			}else if(checkEmail.test($("#memail").val())!=true) {
				$("#message_3").text("올바른 형식의 이메일로 입력해 주세요.");
				$("#memail").focus();
				return false ;
			}

		});
		
	</script>
    
	
<div>

  <jsp:include page="/view/template/footer.jsp"></jsp:include>
  
  
    </div>

  </body>
  
<!-- Mirrored from itwill.xyz/generic/member/find_pw.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Jul 2021 10:23:42 GMT -->
</html>  