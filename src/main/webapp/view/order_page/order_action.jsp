<%@page import="xyz.itwill.dao.OrderProductDAO"%>
<%@page import="xyz.itwill.dto.OrderProductDTO"%>
<%@page import="xyz.itwill.dao.OrderDAO"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/security/login_check.jspf" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String orname = request.getParameter("orname");
	String ophone = request.getParameter("ophone");
	String ophone2 = request.getParameter("ophone2");
	String ophone3 = request.getParameter("ophone3");
	String oaddress = request.getParameter("oaddress");
	String oaddress2 = request.getParameter("oaddress2");
	String oaddress3 = request.getParameter("oaddress3");
	String orequire = request.getParameter("orequire");
	String totalPrice = request.getParameter("totalPrice");
	
	
	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
	/* member = new MemberDTO();
	member.setNo(61); */
			
	int memberNo = member.getNo();
			
	List<CartDTO> cartlist = CartDAO.getDAO().selectCartList(memberNo);
	OrderDAO orderDao = OrderDAO.getDAO();
	
	//주문 일련번호 가져오기
	int orderSeq = orderDao.selectOrderSeq();
	
	//주문 상세정보 저장하기위한 DTO 생성
	OrderDTO order = new OrderDTO();
	order.setNo(orderSeq);
	order.setMemberNo(memberNo);
	order.setPhone(ophone+"-"+ophone2+"-"+ophone3);
	order.setMainAddress(oaddress2);
	order.setDetailAddress(oaddress3);
	order.setZipcode(oaddress);
	order.setInvoice(orequire);
	order.setStatus("입금대기");
	order.setReceiverName(orname);
	order.setTotalPrice(totalPrice);
	
	//주문 상세정보 db저장 dao
	orderDao.insertOrder(order);
	
	//장바구니에 있는 전체 상품 주문 상품(목록) 으로 db저장
	for (CartDTO cart : cartlist) {
		OrderProductDTO orderProd = new OrderProductDTO();
		orderProd.setOrderNo(orderSeq);
		orderProd.setProductNo(cart.getProductNo());
		orderProd.setCount(cart.getCount());
		
		OrderProductDAO.getDAO().insertOrderProduct(orderProd);
	}
	
	CartDAO.getDAO().deleteAllCart(memberNo);
	
	//결제 완료 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/view/order_page/order_complete.jsp");
%>