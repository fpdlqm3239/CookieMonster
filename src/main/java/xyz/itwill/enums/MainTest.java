package xyz.itwill.enums;


import java.util.List;

import xyz.itwill.dao.MemberDAO;
import xyz.itwill.dto.MemberDTO;

public class MainTest {
	public static void main(String[] args) {
			
		List<MemberDTO> list = MemberDAO.getDAO().selectAllMemberList();
		for(MemberDTO iter : list) {
			System.out.println(iter);
		}
//		var memberlist = MemberDAO.getDAO().selectAllMemberList();
//		for(var member : memberlist) {
//			System.out.println(member);
//		}

		
//jsp 코드
//<%@page import="xyz.itwill.dao.MemberDAO"%>
//<%@page import="xyz.itwill.dto.MemberDTO"%>
//<%@page import="java.util.List"%>
//
//<%@ page language="java" contentType="text/html; charset=UTF-8"
//    pageEncoding="UTF-8"%>
//
//<% 
//	List<MemberDTO> memberList=MemberDAO.getDAO().selectAllMemberList();
//%>    
//  
//		<table align="center" border="1" cellspacing="0" cellpadding="1" width="800">
//		<tr bgcolor="yellow">
//			<th width="100">번호</th>
//			<th width="100">이메일</th>
//			<th width="150">이름</th>
//			<th width="250">번호</th>
//			<th width="100">생일</th>
//		</tr>
//		
//		<% if(memberList.isEmpty()) {  %>
//			<tr align="center">
//				<td colspan="7">검색된 회원정보가 없습니다.</td>
//			</tr>	
//		<% } else {//List 인스턴스에 저장된 요소가 없는 경우 %>
//			<%-- List 인스턴스에 저장된 요소를 차례대로 제공받아 반복 처리 --%>
//			<%-- => 제공받은 요소(학생정보 - StudentDTO 인스턴스)의 필드값을 클라이언트에게 전달 --%>
//			<% for(MemberDTO member:memberList) { %>
//			<tr align="center">
//				<td width="100"><%=member.getNo() %></td>				
//				<td width="100"><%=member.getEmail() %></td>				
//				<td width="150"><%=member.getName() %></td>				
//				<td width="250"><%=member.getPhone() %></td>				
//				<td width="100"><%=member.getBirth().substring(0, 10) %></td>				
//				</tr>	
//			<% } %>
//		<% } %>
//		</table>
		
		
	}
}
