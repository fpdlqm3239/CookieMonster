<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (request.getParameter("mid") == null) {
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	return;
}
String email = request.getParameter("mid");
MemberDTO member = MemberDAO.getDAO().selectMember(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
div {
	text-align: center;
}

.mid {
	color: red;
	font-weight: bold;
}
</style>
<title>JSP</title>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id {
	color: red;
}
</style>
</head>
<body>
	<%
	if (member == null) {//아이디가 사용 가능한 경우
	%>
	<div>
		입력한 <span class="mid">[<%=email%>]
		</span>는 사용 가능한 아이디입니다.
	</div>
	<div>
		<button type="button" onclick="windowClose();">아이디 사용</button>
	</div>

	<script type="text/javascript">
		function windowClose() {
			opener.joinForm.mid.value="<%=email%>";
			opener.joinForm.idCheckResult.value = "1";
			window.close();
		}
	</script>
	<%
	} else {//아이디가 사용 불가능 경우
	%>
	<div id="message">
		입력한 <span class="mid">[<%=email%>]
		</span>는 이미 사용 중인 이메일입니다.<br> 다른 이메일을 입력하고 [확인]을 눌러주세요.
	</div>
	<div>
		<%-- form 태그의 action 속성이 생략된 경우 현재 브라우저의 URL 주소로 재요청 --%>
		<%-- form 태그의 method 속성이 생략된 경우 GET 방식으로 요청 --%>
		<form name="checkForm">
			<input type="text" name="mid">
			<button type="button" id="btn">확인</button>
		</form>
	</div>

	<script type="text/javascript">
		document.getElementById("btn").onclick = function() {
			var mid = checkForm.mid.value;
			if (mid == "") {
				document.getElementById("message").innerHTML = "이메일을 입력해 주세요.";
				document.getElementById("message").style = "color: red;";
				return;
			}

			var idReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
			if (!idReg.test(mid)) {
				document.getElementById("message").innerHTML = "이메일 형식에 맞게 입력해주세요.";
				document.getElementById("message").style = "color: red;";
				return;
			}

			checkForm.submit();
		}
	</script>
	<%
	}
	%>
</body>
</html>


