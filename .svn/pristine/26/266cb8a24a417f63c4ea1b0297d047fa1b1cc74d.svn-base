<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원도 볼 수 있는 공지글 상세페이지 -->
<%
	//글번호 없이 비정상 요청 -에러페이지 이동
	if(request.getParameter("no")==null){
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	//전달값 받아 저장
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");
	
	//글번호 받아 검색
	NoticeDTO notice = NoticeDAO.getDAO().selectNoNotice(no);
	
	//검색된 공지글 없이 비정상 요청 -에러페이지 이동
	if(notice==null) {
		response.sendRedirect(request.getContextPath()+"/view/error_page/error.jsp");
		return;
	}
	
	//세션의 권한정보 받아 저장
	MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
	
	//글번호 받아 글 조회수 증가
	NoticeDAO.getDAO().updateReadCount(no);
%>


  
<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    
    <jsp:include page="/view/template/includes.jsp" />
	
	<style>
	
	#board_menu{
		display: block;
		margin: 5px;
		text-align: right;
	}
	
	#removeBtn, #modifyBtn, #listBtn{
		background-color: #424949; 
		color: white; 
		border-radius: 0.3em; 
		border: 2px solid #424949;
	}
	
	img{
		display: block;
		margin: auto;
	}
	
	</style>
	
</head>
<body> 
    <jsp:include page="/view/template/header.jsp"></jsp:include>
 
 
   
 <br><br><br><br><br>            
 <div class="container">       
            <h2 style="font-weight: bold; text-align: center;">브랜드 이슈</h2>        
 	</div>	
 	<br>                       
    
  <div id="board_menu">
	<%-- 관리자면 삭제,수정 기능 제공 --%>
	<% if(loginMember!=null && loginMember.getStatus().equals("9")) { %>
		<button type="button" id="modifyBtn">수정</button>&nbsp;
		<button type="button" id="removeBtn">삭제</button>&nbsp;
		<button type="button" id="listBtn" onclick="location.href=
			'<%=request.getContextPath()%>/view/notice_page/notice.jsp';">목록</button>
	<% } %>
	</div>
	
	<form id="boardForm" method="post">
 		<%-- 삭제, 수정 페이지 요청시 전달값 --%>
 		<input type="hidden" name="no" value="<%=notice.getNo()%>">
 		<%-- 게시글 목록 페이지 요청시 전달값 --%>
 		<input type="hidden" name="pageNum" value="<%=pageNum%>">
 		<input type="hidden" name="search" value="<%=search%>">
 		<input type="hidden" name="keyword" value="<%=keyword%>">
 	</form>
	
        <table class="table tbcenter" >   
            <tr>
              <th scope="col" style="width: 100%; text-align: left;"> &nbsp;&nbsp;제목 ㅣ <%=notice.getTitle()%> </th>
            </tr>
            
             <tr>
             	 <th scope="col" style="width: 15%; text-align: left; font-weight: 400;">
            	  &nbsp;&nbsp;작성자 ㅣ <%=MemberDAO.getDAO().selectStatusByNo(notice.getMemberNo()) %>&nbsp;&nbsp;&nbsp;&nbsp;작성일 ㅣ <%=notice.getRegdate()%>&nbsp;&nbsp;&nbsp;&nbsp;조회수 ㅣ <%=notice.getReadcount()%>   
            	  </th>                     
           	 </tr>
			
			<tr>
            	 <th scope="col" style="width: 15%; text-align:center; font-weight: 400;"><%=notice.getContent().replace("\n", "<br>")%>
            	 <%if(notice.getPicture()==null || notice.getPicture()==""){  %>
            	 	<br>
            	 <% } else { %>
            	 <img src="<%=request.getContextPath()%>/images/<%=notice.getPicture()%>" width="800" alt="Image" >
            	 <% } %>
 				 </th>  
			</tr>	
	             
            <tr>
           	  <th scope="col" style="text-align: right;"><a href="notice.jsp" class="btn btn-dark">목록</a></th>
            </tr>
     </table>
    
 
<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
		$("#boardForm").attr("action", "<%=request.getContextPath()%>/view/notice_page/notice_delete_action.jsp");
		$("#boardForm").submit();
	}
});	
$("#modifyBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/view/notice_page/notice_modify.jsp");
	$("#boardForm").submit();
});
</script>
	
<div>
  <jsp:include page="/view/template/footer.jsp"></jsp:include>
</div>
	
</body>
</html>