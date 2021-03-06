
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
<title>COOKIE MONSTER</title>
<meta charset="utf-8">

<jsp:include page="/view/template/includes.jsp" />

</head>
<body>
	<jsp:include page="/view/template/header.jsp"></jsp:include>

	<form id="login" name="loginForm"
		action="<%=request.getContextPath()%>/view/member_page/login_action.jsp"
		method="post" onsubmit="return;">
		<main>
			<div class="site-section">
				<div class="row mb-5"></div>
				<div class="row mb-5"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-6 mb-5 mb-md-0">
							<h2 class="h3 mb-3 text-black">로그인</h2>
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="mid" class="text-black">이메일</label> <input
											type="text" class="form-control" id="mid" name="mid" value="">
										<div id="message_1"></div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="mpw" class="text-black">패스워드 </label> <input
											type="password" class="form-control" id="mpw" name="mpw">
										<div id="message_2"></div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<div class="find-pw margin_b20 text_l">
											<a href="<%=request.getContextPath()%>/view/member_page/find_id.jsp" style="text-decoration: underline;">이메일
												찾기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="<%=request.getContextPath()%>/view/member_page/find_pw.jsp" style="text-decoration: underline;">패스워드
												찾기</a>
										</div>

									</div>
								</div>
								<button type="submit"
									class="btn btn-outline-dark btn-lg btn-block" id="login_btn">로그인</button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row mb-5">
								<div class="col-md-12">
									<h2 class="h3 mb-3 text-black">회원가입</h2>
									<div class="p-3 p-lg-5 border">
										<label for="c_code" class="text-black mb-3">회원가입을 하시면,
											주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</label> <a
											class="btn btn-outline-dark btn-lg btn-block"
											href="<%=request.getContextPath()%>/view/member_page/join.jsp">신규가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</main>
	</form>

	<script type="text/javascript">
		$("#mid").focus();
		$("#login_btn").click(function() {
			$("#message_1").text("");
			if ($("#mid").val() == "") {
				$("#message_1").text("이메일을 입력해 주세요.");
				$("#mid").focus();
				return false;
			}
			if ($("#mpw").val() == "") {
				$("#message_2").text("비밀번호를 입력해 주세요.");
				$("#mpw").focus();
				return false;
			}
			$("#login").submit();
		});
	</script>

	<div>
		<jsp:include page="/view/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>
