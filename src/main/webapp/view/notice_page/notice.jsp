<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("utf-8");

	//검색항목 받아 저장
	String search = request.getParameter("search");
	if(search==null){
		search = "";
	}
	
	//검색어 받아 저장
	String keyword = request.getParameter("keyword");
	if(keyword==null){
		keyword = "";
	}

	int pageNum = 1;	//페이지번호 전달값 없을시 첫 페이지 출력
	if(request.getParameter("pageNum")!=null){	//페이지번호 전달값 있으면
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize = 10;	//한 페이지에 출력될 게시글 수
	
	//검색어 포함된 게시글 갯수 반환
	int totalNotice = NoticeDAO.getDAO().selectNoticeCount(search, keyword);
			
	//전체 페이지 갯수 계산, 저장
	int totalPage = (int)Math.ceil((double)totalNotice/pageSize);
	
	//페이지 번호 검증
	if(pageNum<=0 || pageNum>totalPage){
		pageNum = 1;
	}
	
	//글 시작/종료행 번호 계산
	int startRow = (pageNum-1) * pageSize +1;
	int endRow = pageNum * pageSize;
	
	if(endRow>totalNotice){	//마지막 페이지 처리
		endRow = totalNotice;
	}
	
	//글 시작/종료행 받아 해당 범위 게시글 검색
	List<NoticeDTO> noticeList = NoticeDAO.getDAO().selectNoticeList(startRow, endRow, search, keyword);
	
	//글 번호 시작값 계산
	int number = totalNotice-(pageNum-1) * pageSize;
	
	//세션의 권한정보 받아 저장
	MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
	
	//현재 날짜 받아 작성일과 비교 출력
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	System.out.println(totalNotice);

%>
  
<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/images/favicon.ico">
    
    <jsp:include page="/view/template/includes.jsp" />

<style>
	#writeBtn{
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


   
   <br><br><br><br>     
   <div class="container">       
   <div class="form-group row"> 
       &nbsp;&nbsp;<div class="col-md-12" >
     
    <h2 style="font-weight: bold; text-align: center;">브랜드 이슈</h2><br><br>      
               
    <%--공지글 검색 --%>
	   <form action="<%=request.getContextPath()%>/view/notice_page/notice.jsp" method="post">
    	<div class="col-md-12 text-center">
	      <select name="search" style="height: 34px;">
	         <option value="title" selected="selected">&nbsp;제목&nbsp;</option>
	         <option value="content">&nbsp;내용&nbsp;</option>
	      </select>   
	      &nbsp;<input class="text_box" type="text" name="keyword" style="height: 34px; width: 300px;">
	      &nbsp;<button class="btn btn-dark" type="submit" style="height: 34px;">검색</button>
		</div>    
	   </form>
  	 </div>
    </div> 
   <br><br>         
   
	<!-- 관리자면 글쓰기 버튼 활성화 /삭제글 보이게 처리시 글status 속성 추가 필요  -->
	<% if(loginMember!=null && loginMember.getStatus().equals("9")) { %>
	<div id = "btn">
		<button type="button" id="writeBtn" onclick="location.href=
			'<%=request.getContextPath()%>/view/notice_page/notice_write.jsp?pageNum=<%=pageNum%>';">글쓰기</button>
		</div>
	<% } %>
	<br><br>
	
    <table class="table table-hover tbcenter" >   
        <tr style="text-align: center;">
          <th scope="col" style="width: 10%;">번호</th>
          <th scope="col" style="width: 55%; text-align: left;">&nbsp;제목</th>
          <th scope="col" style="width: 10%;">작성자</th>
          <th scope="col" style="width: 15%;">날짜</th>
          <th scope="col" style="width: 10%;">조회</th>
        </tr>
          
        <% if(noticeList.isEmpty()) { %>
      	<tr>
      		<td colspan="5">검색된 게시글이 없습니다.</td>
         </tr>
         <% } else { %>
         	<%for(NoticeDTO notice:noticeList) { %>
         	<tr>
         		<td><%=number %></td>
         		
         		<td class="title" style="text-align: left;">
         			<a href="<%=request.getContextPath()%>/view/notice_page/notice_detail.jsp?no=<%=notice.getNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=notice.getTitle() %></a>
         		
				<td><%=MemberDAO.getDAO().selectStatusByNo(notice.getMemberNo()) %></td>     
				 		
         		<td>
         		<% if(currentDate.equals(notice.getRegdate().substring(0, 10))) { %>
         			<%=notice.getRegdate().substring(11)%>
         		<%} else { %>
         			<%=notice.getRegdate()%>
         		<% } %>	
         		</td>	
         		
         		<td><%=notice.getReadcount()%></td>
         	</tr>
         	<% number--; %>
         	<% } %>
         <% } %>

		<!-- 페이징 처리 -->
		<%
		int blockSize = 5;

		int startPage = (pageNum-1) / blockSize * blockSize +1;	

		int endPage = startPage + blockSize -1;

		if(endPage>totalPage) {
			endPage = totalPage;
		}
		%>
	</table>
  </div>

   <%-- 페이지 버튼--%>
    <div class="row" style="margin-top: -30px;">
      <div class="col-md-12 text-center">
         <div class="site-block-27">
            <ul>
         		<% if(startPage > blockSize) { %>
         			<li><a href="<%=request.getContextPath()%>/view/notice_page/notice.jsp?
         				&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">&lt;</a></li>
           		<% } else { %>
       			 	<li><a>&lt;</a></li>
         		<% } %>
         	
         		<% for(int i=startPage; i<=endPage; i++) { %>
					<% if(pageNum!=i) { %>
						<li <%if(pageNum == i){ %>class="active"<% } %>><span><a href="<%=request.getContextPath()%>/view/notice_page/notice.jsp?
							&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i %></a></span></li>
					<% } else { %>
						<li class="active"><span><%=i %></span></li>
					<% } %>
				<% } %>
         	
				<% if(endPage!=totalPage) { %>
					<li><a href="<%=request.getContextPath()%>/view/notice_page/notice.jsp?
						&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">&gt;</a></li>
				<% } else { %>
         		   <li><a>&gt;</a></li>
				<% } %>    
            </ul>
         </div>
      </div>        
    </div>
    <br><br>
    
   <br><br><br><br><br>  

<div>
 <jsp:include page="/view/template/footer.jsp"></jsp:include>
</div>

</body>
</html>