<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/security/admin_check.jspf"%>

<header>

	<div class="site-wrap">
		<div class="site-navbar bg-white py-2">
			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="logo">
						<div class="site-logo">
							<a href="<%=request.getContextPath()%>/view/index.jsp">COOKIE
								MONSTER</a>

						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li><a href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=product_manager">상품</a></li>
								<li><a href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=member_manager">회원</a></li>
								<li><a href="<%=request.getContextPath()%>/view/admin/admin_main.jsp?workgroup=order_manager">주문</a></li>
							</ul>
						</nav>
					</div>

					<a href="<%=request.getContextPath()%>/view/admin/admin_main.jsp">
						&nbsp;&nbsp;&nbsp;&nbsp;관리자홈</a> <a>'<%=loginMember.getName()%>'
					</a> <a
						href="<%=request.getContextPath()%>/view/member_page/logout_action.jsp">로그아웃</a>

				</div>
			</div>
		</div>
	</div>
	
</header>

<title>COOKIE ADMIN</title>
<div id="profile">
	관리자[<%=loginMember.getName()%>] 로그인중

</div>