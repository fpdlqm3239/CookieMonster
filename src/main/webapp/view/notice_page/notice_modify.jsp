<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글번호 받아 CM_NOTICE 테이블의 해당 글번호의 게시글 검색, 입력태그의 초기값으로 설정하고 변경값을 입력받기 위한 JSP 문서 --%>
<%-- 비회원이 문서 요청시 에러페이지 이동 --%>
<%-- => [수정]을 클릭한 경우 게시글 변경페이지(notice_modify_action.jsp)로 이동 -입력값 전달 --%>

<%@include file="/view/security/login_check.jspf" %>   
    
<%
	//글번호 없이 비정상 요청 -에러페이지 이동
	if(request.getParameter("no")==null){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}

	//전달값 반환받아 저장(글번호/ 페이지번호/ 검색항목/ 검색어)
	int no =Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");
	
	if(pageNum==null || pageNum.equals("")){
		pageNum = "1";	//전달값 없을시 1페이지로 이동
	}
	
	//글번호 받아 검색
	NoticeDTO notice = NoticeDAO.getDAO().selectNoNotice(no);
	
	//검색된 게시글 없으면 비정상 요청 처리
	if(notice==null) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	//관리자가 아니면 비정상 요청 처리
	if(!loginMember.getStatus().equals("9")) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
%>  
    
<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    
        <jsp:include page="/view/template/includes.jsp" />

</head>
<body> 
    <jsp:include page="/view/template/header.jsp"></jsp:include>
</body>    


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


<br><br><br><br><br>
<h2 style="text-align: center; font-weight: bold; ">[ 수정 ]</h2>
<br><br> 
<form action="<%=request.getContextPath()%>/view/notice_page/notice_modify_action.jsp" method="post" id="noticeForm" enctype="multipart/form-data">
	<%--저장된 기존 이미지 파일값이 있으면 originPic으로 전달함 --%>
	
		<input type="hidden" name="originPic" value="<%=notice.getPicture()%>">
	
	<input type="hidden" name="no" value="<%=no%>">	
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">	
	<input type="hidden" name="keyword" value="<%=keyword%>">	
	<table>
		<tr>
			<th style="font-weight: bold">제목</th>
			<td>
				<input type="text" name="title" id="title" size="60" style="font-weight: bold;" value="<%=notice.getTitle() %>">
			</td>
		</tr>
		<tr>
			<th style="font-weight: bold">내용</th>
			<td>
				<textarea rows="15" cols="63" name="content" id="notice_content" style="font-weight: bold;"><%=notice.getContent() %></textarea>
			</td>
		</tr>
	</table>
	<br>

	<div style="text-align: center;">
		<label for="rorigin" class="text-black" style="font-weight: bold">파일&nbsp;&nbsp;&nbsp;&nbsp;<%=notice.getPicture()%>
		</label>&nbsp;&nbsp;
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
				<button type="submit" id="saveBtn">저장</button>
			</th>
		</tr>
		</table>
</form>

<br><br><br>
 
  
<div>
	<jsp:include page="/view/template/footer.jsp"></jsp:include>
</div>
 
 

<script type="text/javascript">
$("#title").focus();

$("#noticeForm").submit(function() {
	if($("#title").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}
	
	if($("#notcie_content").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#notcie_content").focus();
		return false;
	}
});

</script>
</html>
 