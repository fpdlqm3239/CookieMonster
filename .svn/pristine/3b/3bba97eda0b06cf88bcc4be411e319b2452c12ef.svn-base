
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/security/login_check.jspf" %>


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


<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<title>COOKIE MONSTER</title>
<meta charset="utf-8">
	<jsp:include page="/view/template/includes.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/view/template/header.jsp"></jsp:include>
	
  
    <div class="site-section">
      <div class="container">
      <div class="row mb-5"></div>
      <form id="info_pw" name="pwCheckForm" action="<%=request.getContextPath()%>/view/member_page/member_remove_action.jsp" method="post">
      <h2 class="h3 mb-3 text-black" style="text-align: center;">회원 탈퇴 인증</h2>
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <div class="p-3 p-lg-5 border">
              <div class="form-group">
              </div>
				<div class="form-group row">
					<div class="col-md-12">
						<label for="mid" class="text-black"><span	class="text-danger">*</span>이메일&nbsp;&nbsp;</label> 
						<input type="text"	class="form-control" id="mid" name="email"  value= "<%=loginMember.getEmail()%>" readonly="readonly">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-12">
						<label for="mpw" class="text-black"><span	class="text-danger">*</span>패스워드&nbsp;&nbsp;</label> 
						<input type="password"	class="form-control" id="mpw" name="passwd" placeholder="패스워드 입력">
						<div id="message_1"></div>
					</div>
				</div>
			  <button type="submit" class="btn btn-outline-dark btn-lg btn-block" id="pw_check" >패스워드 확인</button>
            </div>
          </div>
        </div>
        </form>
        <!-- </form> -->
      </div>
    </div>
     <script type="text/javascript">
     $("#mpw").focus();

     $("#info_pw").submit(function() {
    	 $("#message_1").text("");
      	
      	if($("#mpw").val()=="") {
      		$("#message_1").text("비밀번호를 입력해 주세요.");
      		$("#mpw").focus();
      		return false;
      	}
  
     });
	</script>

	<div>
		<jsp:include page="/view/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>
