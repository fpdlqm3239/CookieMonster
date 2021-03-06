<%@page import="xyz.itwill.dto.MemberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
		href="<%=request.getContextPath()%>/images/favicon.ico">

</head>
<body>
	<header>
		<div class="site-wrap">
			<div class="site-navbar bg-white py-2">
				<div class="search-wrap">
					<div class="container">
						<a href="#" class="search-close js-search-close"><span
							class="icon-close2"></span></a>
						<form
							action="<%=request.getContextPath()%>/view/product_list_page/product_list.jsp"
							method="get">
							<input type="text" name="keyword" id="keyword"
								class="form-control" placeholder="찾으시는 상품명을 입력해주세요.">
						</form>
					</div>
				</div>
				<div class="container">
					<div class="d-flex align-items-center justify-content-between">
						<div class="logo">
							<div class="site-logo">
								<!-- <a href="../view/index.jsp">GENERIC MONSTER</a> -->
								<a href="<%=request.getContextPath()%>/view/index.jsp">COOKIE
									MONSTER</a>

							</div>
						</div>
						<div class="main-nav d-none d-lg-block">
							<nav class="site-navigation text-right text-md-center"
								role="navigation">
								<ul class="site-menu js-clone-nav d-none d-lg-block">
									<li><a href="<%=request.getContextPath()%>/view/index.jsp">쿠키몬스터</a></li>
									<li><a
										href="<%=request.getContextPath()%>/view/product_list_page/product_list.jsp?category=glasses">안경</a></li>
									<li><a
										href="<%=request.getContextPath()%>/view/product_list_page/product_list.jsp?category=sunglass">선글라스</a></li>
									<li><a
										href="<%=request.getContextPath()%>/view/notice_page/notice.jsp">브랜드이슈</a></li>
								</ul>
							</nav>
						</div>
						<div class="icons">
							<a href="#" class="icons-btn d-inline-block js-search-open">
								<span class="icon-search"></span>
							</a> <a
								href="<%=request.getContextPath()%>/view/member_page/password_confirm.jsp"
								class="icons-btn d-inline-block"> <span class="icon-user"></span>
							</a> <a href="<%=request.getContextPath()%>/view/cart_page/cart.jsp"
								class="icons-btn d-inline-block bag"> <span
								class="icon-shopping-bag"></span>
							</a> <a href="#"
								class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none">
								<span class="icon-menu"></span>
							</a>
						</div>

						<%
						if(loginMember != null) {
							if(loginMember.getStatus().equals("9")) {
						%>

						<a href="<%=request.getContextPath()%>/view/admin/admin_main.jsp">관리자</a>
						<%
						}
						%>
						<a>'<%=loginMember.getName()%>'
						</a> <a
							href="<%=request.getContextPath()%>/view/member_page/logout_action.jsp">로그아웃</a>
						<%
						} else {
						%>
						<a href="<%=request.getContextPath()%>/view/member_page/login.jsp">로그인
							</a>
						<%
						}
						%>


					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>