<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- MEMBER 테이블에 저장된 모든 회원정보를 검색하여 클라이언트에게 회원목록을 전달하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%-- => [선택회원삭제]를 클릭한 경우 회원정보 삭제 처리페이지(member_remove_action.jsp)로 이동 
- 체크박스에 의해 선택된 모든 회원정보의 아이디 전달 --%>
<%-- => [회원상태]를 변경한 경우 회원상태 변경 처리페이지(member_status_action.jsp)로 이동
- 아이디와 변경할 회원상태를 전달 --%>
<%@include file="/view/security/admin_check.jspf"%>
<%
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<MemberDTO> memberList=MemberDAO.getDAO().selectAllMemberList(); 
%>
<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;	
}

th {
	background: black;
	color: white;
}

.member_check { width: 80px; }
.member_id { width: 80px; }
.member_name { width: 80px; }
.member_email { width: 140px; }
.member_mobile { width: 140px; }
.member_address { width: 300px; }
.member_join { width: 150px; }
.member_login { width: 150px; }
.member_status { width: 80px; }
</style>

<!-- 
<h2>회원목록</h2> 
-->

<form name="memberForm" id="memberForm">

	<div><button type="button" id="removeBtn" >선택회원 탈퇴처리</button>
		<button type="button" id="removeBtnDB" >선택회원 삭제처리</button>
		<input type="hidden" name="doSomething" value=""></input>
		</div>

	<table>
		<tr>
			<th><input type="checkbox" id="allCheck"></th>
			<th>고유번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입날짜</th>
			<th>마지막로그인</th>
			<th>상태</th>
		</tr>
		<% for(MemberDTO member:memberList) { %>
		<tr>
			<td class="member_check">
				<% if(member.getStatus().equals("9")) { %>
					관리자
				<% } else { %>
					<input type="checkbox" name="checkId" value="<%=member.getNo()%>" class="check">
				<% } %>
			</td>
			<td class="member_id"><%=member.getNo() %></td>
			<td class="member_name"><%=member.getName() %></td>
			<td class="member_email"><%=member.getEmail() %></td>
			<td class="member_mobile"><%=member.getPhone() %></td>
			<td class="member_address">
				[<%=member.getZipcode() %>]<%=member.getMainAddress() %> <%=member.getDetailAddress() %>
			</td>
			<td class="member_join"><%=member.getJoinDate() %></td>
			<td class="member_login">
				<%=member.getLastJoinDate() %>
			</td>
			<td class="member_status">
				<select class="status" name="<%=member.getNo()%>">
					<option value="1" <% if(member.getStatus().equals("1")) { %> selected <%} %>>일반회원</option>
					<option value="9" <% if(member.getStatus().equals("9")) { %> selected <%} %>>관리자</option>
				</select>
			</td>	
		</tr>
		<% } %>
	</table>
	<p></p>
	<div id="message" style="color: red;"></div>
</form>

<script type="text/javascript">
$("#allCheck").change(function() {
		if($(this).is(":checked")) {
			$(".check").prop("checked",true);
		} else {
			$(".check").prop("checked",false);
		}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 회원이 하나도 없습니다.");
		return;
	}
	//$('#doSomething').value("remove");
	document.getElementsByName("doSomething")[0].value = "remove";
	alert("removeDB");
	
	$("#memberForm").attr("method", "post");
	$("#memberForm").attr("action", 
		"<%=request.getContextPath()%>/view/admin/member_remove_action.jsp");
	$("#memberForm").submit();
});

$("#removeBtnDB").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 회원이 하나도 없습니다.");
		return;
	}
	//$('#doSomething').value("removeDB");
	document.getElementsByName("doSomething")[0].value = "removeDB";
	alert("removeDB");
	
	$("#memberForm").attr("method", "post");
	$("#memberForm").attr("action", 
		"<%=request.getContextPath()%>/view/admin/member_remove_action.jsp");
	$("#memberForm").submit();
});

$(".status").change(function() {
	//이벤트가 발생된 엘리먼트의 속성값을 반환받아 저장
	var no=$(this).attr("name");//식별자(아이디)를 반환받아 저장
	var status=$(this).val();//변경값(상태값)를 반환받아 저장
	//alert(id+" = "+status);
	if(no==53 || no==54 || no==55 || no==56 || no==81 || no==121 ){
		alert("최고관리자 입니다.");	
		location.reload();
		return;
	}	

	alert("등급을 조정합니다");	
	location.href="<%=request.getContextPath()%>/view/admin/member_status_action.jsp?no="+no+"&status="+status;
});
</script>








