<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 입력받기 위한 JSP 문서 --%>
<%-- 관리자에게만 글쓰기 권한 제공 --%>
<%-- => [저장] 클릭시 게시글 저장페이지(notice_write_action.jsp)로 이동 -입력값 전달 --%>

<%-- => 비회원이 문서 요청시 에러페이지로 이동 --%>
<%@include file="/view/security/login_check.jspf" %>  

<%
	//페이지번호 전달값 저장위한 변수 선언
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum==null || pageNum.equals("")){
		pageNum = "1";	//전달값 없을시 1페이지로 이동
	}
%>

<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    
     <jsp:include page="/view/template/includes.jsp" />
	
	
<style type="text/css">
table {
	margin: 0 auto;
}

th {
	width: 70px;
	font-weight: normal;
}

td {
	text-align: left;
}

#saveBtn{
	float: right;
	background-color: #424949; 
	color: white; 
	border-radius: 0.3em; 
	border: 2px solid #424949;
}
</style>
</head>	
<body> 
    <jsp:include page="/view/template/header.jsp"></jsp:include>


<br><br><br><br><br>
<h2 style="text-align: center; font-weight: bold; ">[ 새글 쓰기 ]</h2>
<br><br>

<form action="<%=request.getContextPath()%>/view/notice_page/notice_write_action.jsp" method="post" id="noticeForm" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	
	<table>
		<tr>
			<th style="font-weight: bold">제목</th>
			<td>
				<input type="text" name="title" id="title" size="60" style="font-weight: bold;">
			</td>
		</tr>
		<tr>
			<th style="font-weight: bold">내용</th>
			<td>
				<textarea rows="15" cols="63" name="content" id="content" style="font-weight: bold;"></textarea>
			</td>
		</tr>
	</table>
	<br>
	<div id="fileUpload" style="text-align: center;">
		<label for="rorigin" class="text-black" style="font-weight: bold">파일&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<input type="file" name="picture" style="font-size: 1.0em;" value="불러오기" accept=".jpg,.jpeg,.png,.gif,.jfif">
       </div>
	 <div>      
        <br>    
		<p style="text-align: center;">
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #fc7945;" class="icon-times-circle"></span>
		&nbsp;jpg, jpeg, png, gif, jfif 확장자의 이미지 파일만 첨부 가능합니다.
         	</p>
        </div>
        <br>  
                  	
		<div id="message" style="color: red; text-align: center;"></div>

       <table>          
		<tr>
			<th colspan="1" style="text-align: center;">
				<button type="button" id="saveBtn">저장</button>&nbsp;
			</th>
		</tr>
	</table>
	
</form>



<script type="text/javascript">
$("#title").focus();

$("#noticeForm").submit(function() {
	if($("#title").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}
	
	if($("#content").val()=="") {
 		$("#message").text("내용을 입력해 주세요.");
 		$("#notice_content").focus();
 		return false;
 	}
});

$("#saveBtn").click(function() {
	if(confirm("이대로 업로드 하시겠습니까?")){
		$("#noticeForm").attr("action", "<%=request.getContextPath()%>/view/notice_page/notice_write_action.jsp");
		$("#noticeForm").submit();
	}
});

</script>

<div>
  <jsp:include page="/view/template/footer.jsp"></jsp:include>
</div>

</body>
</html>