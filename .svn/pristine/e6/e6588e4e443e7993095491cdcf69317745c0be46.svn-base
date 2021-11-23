<%@page import="java.io.File"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/security/admin_check.jspf" %>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect(request.getContextPath() + "/view/error_page/error.jsp");
		return;
	}

	String saveDirectory=request.getServletContext().getRealPath("/images");
	
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String productCategory=multipartRequest.getParameter("category");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getFilesystemName("mainImage");
	String productDetail=multipartRequest.getParameter("productDetail");
	int productQty=Integer.parseInt(multipartRequest.getParameter("productQty"));	
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	

	ProductDTO product=new ProductDTO();
	product.setCategory(productCategory);
	product.setName(productName);
	product.setThumbnail(mainImage);
	product.setDescription(productDetail);
	product.setCount(productQty);
	product.setPrice(productPrice);
	

	if(ProductDAO.getDAO().selectProductByName(product.getName())!=null) {
		new File(saveDirectory, mainImage).delete();//파일 삭제
		session.setAttribute("message", "이미 등록된 이름을 사용하였습니다.");
		product.setNo(ProductDAO.getDAO().selectProductByName(product.getName()).getNo());
		session.setAttribute("product", product);
		response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=product_add&productNum="+product.getNo());
		return;
	}

	ProductDAO.getDAO().insertProduct(product);
	ProductDTO productTemp = ProductDAO.getDAO().selectProductByName(product.getName());
	response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=product_detail&productNum="+productTemp.getNo());
%>
















