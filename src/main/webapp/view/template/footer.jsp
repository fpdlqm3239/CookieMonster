<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="site-footer custom-border-top">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
					<h3 class="footer-heading mb-4">고객센터</h3>
					<h1 class="c_number">1588-1588</h1>
					<ul class="list-unstyled">
						<li>운영기간: 월~금</li>
						<li>운영시간: 09:00 ~ 19:00</li>
					</ul>
				</div>
				<div class="col-lg-5 ml-auto mb-5 mb-lg-0">
					<div class="row">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">법적고지</h3>
						</div>
						<div class="col-md-6 col-lg-4">
							<ul class="list-unstyled">
								<li><a
									href="<%=request.getContextPath()%>/view/policy_page/policy.jsp">이용약관</a></li>
								<li><a
									href="<%=request.getContextPath()%>/view/policy_page/personal.jsp">개인정보처리방침</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-3">
					<div class="block-5 mb-5">
						<h3 class="footer-heading mb-4">Contact Info</h3>
						<ul class="list-unstyled">
							<li class="address">서울시 강남구 테헤란로123 COOKIE MONSTER</li>
							<li class="phone">+82 2 392 3929</li>
							<li class="email">cookie_monster@itwill.xyz</li>
						</ul>
					</div>
				</div>
				<div class="copyright">
					<p>&copy Copyright 2020 All rights reserved | This site is made with
						by COOKIE MONSTER</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>