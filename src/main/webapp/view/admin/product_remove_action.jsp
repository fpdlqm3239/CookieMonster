<%@page import="java.io.File"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 삭제하고
제품목록 출력페이지로 이동하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%@include file="/view/security/admin_check.jspf" %>
<%
	if(request.getParameter("productNum")==null) {
		response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
		return;
	}
	
	String productNo=(String)(request.getParameter("productNum"));

	ProductDTO product=ProductDAO.getDAO().selectProductByNo(productNo);
	ProductDAO.getDAO().deleteProduct(Integer.parseInt(productNo));

	String saveDirectory=request.getServletContext().getRealPath("/images");
	new File(saveDirectory,product.getThumbnail()).delete();
	
	response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=product_manager");	
%>








