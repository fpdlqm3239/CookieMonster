<%@page import="xyz.itwill.dao.PictureDAO"%>
<%@page import="xyz.itwill.dto.PictureDTO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="java.io.File"%>
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
	
	int productNum=Integer.parseInt(multipartRequest.getParameter("productNum"));	
	String currentMainImage=multipartRequest.getParameter("currentMainImage");
	String productCategory=multipartRequest.getParameter("category");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getFilesystemName("mainImage");
	String productDetail=multipartRequest.getParameter("productDetail");
	int productCount=Integer.parseInt(multipartRequest.getParameter("productQty"));	
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	int productRecommand=Integer.parseInt(multipartRequest.getParameter("productRecommand"));
	
	ProductDTO product=new ProductDTO();
	product.setNo(productNum);
	product.setCategory(productCategory);
	product.setName(productName);
	if(mainImage!=null) {
		product.setThumbnail(mainImage);
		new File(saveDirectory, currentMainImage).delete();
	} else {
		product.setThumbnail(currentMainImage);
	}

	int subImageCount = 3;
	String subImages[] = new String[subImageCount];
	for(int i=0; i<subImageCount; ++i){
		subImages[i] = multipartRequest.getFilesystemName("subImage"+i);		
		if(subImages[i] != null){		//전달받은게 있다면 테이블에 추가
			PictureDTO picture = new PictureDTO();
			picture.setProductNo(productNum);
			picture.setContent(subImages[i]);
			PictureDAO.getDAO().insertPicture(picture);
		}
		else{
										
		}
	}
	
	
	product.setDescription(productDetail);
	product.setCount(productCount);
	product.setPrice(productPrice);
	product.setRecommand(productRecommand);
	
	ProductDAO.getDAO().updateProduct(product);
	
	response.sendRedirect(request.getContextPath()+"/view/admin/admin_main.jsp?workgroup=product_detail&productNum="+product.getNo());
	
%>








