<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 상세 출력
(member_detail.jsp)로 이동하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 비정상적인 요청으로 에러페이지 이동 --%>
<%@include file="/view/security/login_check.jspf" %>
<% 

	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400'");
		out.println("</script>");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	//전달값을 반환받아 저장
	String email=request.getParameter("mid");
	String passwd=request.getParameter("mpw_1");
	if(passwd==null || passwd.equals("")) {//비밀번호가 전달되지 않은 경우
		//로그인 사용자의 비밀번호를 변수에 저장 - 기존 비밀번호로 변경
		passwd=loginMember.getPw();
	} else {//비밀번호가 전달된 경우
		//전달된 비밀번호를 암호화 처리하여 변수에 저장 - 새로운 비밀번호로 변경
		passwd=Utility.encrypt(request.getParameter("mpw_1"));
	}
	String name=request.getParameter("mname").trim();
	String mobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")
		+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("maddress1");
	String address1=request.getParameter("maddress2");
	String address2=Utility.stripTag(request.getParameter("maddress3"));
	
	
	
	//DTO 인스턴스를 생성하고 전달값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setPw(passwd);
	member.setName(name);      
	member.setEmail(email);
	member.setPhone(mobile);
	member.setZipcode(zipcode);
	member.setMainAddress(address1);
	member.setDetailAddress(address2);
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateMember(member);
	
	//세션에 저장된 권한 관련 정보(회원정보)를 변경
	session.setAttribute("loginMember", MemberDAO.getDAO().selectMember(email));
	
	//회원정보 상세 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/view/index.jsp");
%>



