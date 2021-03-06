<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dto.OrderDTO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
	int memberNo = member.getNo();
	
	String[] phoneArr = member.getPhone().split("-");
	
	List<CartDTO> orderList = CartDAO.getDAO().selectCartList(memberNo);
	
	/* String str = "한글";
	System.out.println(str); */
%>
<!DOCTYPE html>
<html>
<head>
    <title>COOKIE MONSTER</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
    <link rel="stylesheet" href="../../maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/generic.css">  
    
    <script src="../../unpkg.com/sweetalert%402.1.2/dist/sweetalert.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/aos.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script> 
	<script src="http://maps.google.com/maps/api/js?v=3.3&amp;sensor=true"></script>
	<link rel="shortcut icon" type="image/x-icon"
	
      href="<%=request.getContextPath()%>/images/favicon.ico">

</head>
<body> 
   <jsp:include page="/view/template/header.jsp"></jsp:include>
  <form action="order_action.jsp" method="post">
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <a href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
  		 
        
        <div class="row">
          <div class="col-md-7 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">주문회원정보</h2>
            <div class="p-3 p-lg-5 border">
            
              <label for="c_phoneNumber" class="text-black">주문자 전화번호<span class="text-danger">*</span></label>
              <div class="form-group row">
                <div class="col-md-4">                              
	                <input type="text" readonly="readonly" class="form-control" id="mphone" name="mphone" value="<%=phoneArr[0] %>" >
                </div>                
                <div class="col-md-4">
                  <label class="sr-only" for="checkoutInputPhone2">휴대폰 번호</label>
                  <input type="text" readonly="readonly" class="form-control" id="mphone2" name="mphone2" maxlength="4" value="<%=phoneArr[1] %>">
                </div> 
                <div class="col-md-4">
                  <label class="sr-only" for="checkoutInputPhone2">휴대폰 번호</label>
                  <input type="text" readonly="readonly" class="form-control" id="mphone3" name="mphone3"  maxlength="4" value="<%=phoneArr[2] %>">
                </div>                                  
                <span id="mphoneMsg" class="text-danger"></span>                
              </div>
              
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="c_name"  class="text-black">주문자 이름 <span class="text-danger">*</span></label>
                  <input type="text" readonly="readonly" class="form-control" id="mname" name="mname" value="<%=member.getName() %>">
                  <span id="mnameMsg" class="text-danger"></span>
                </div>
              </div>
              <input id="check" type="checkbox"><span>주문자와 받는사람이 동일</span>
              <br>
              <br>
              <label for="c_phoneNumber" class="text-black">받는사람 전화번호<span class="text-danger">*</span></label>
              <div class="form-group row">
                <div class="col-md-4">                              
	                <select id="ophone" name="ophone" class="form-control">
	                  <option value="010">010</option>    
	                  <option value="011">011</option>    
	                  <option value="016">016</option>    
	                  <option value="017">017</option> 	                 
	                </select>
                </div>                
                <div class="col-md-4">
                  <label class="sr-only" for="checkoutInputPhone2">휴대폰 번호</label>
                  <input type="text" class="form-control" id="ophone2" name="ophone2"  maxlength="4">
                </div>
                <div class="col-md-4">
                  <label class="sr-only" for="checkoutInputPhone2">휴대폰 번호</label>
                  <input type="text" class="form-control" id="ophone3" name="ophone3"  maxlength="4">
                </div>                                   
                <span id="ophoneMsg" class="text-danger">휴대폰 번호를 입력해 주세요.</span>                
                <span id="ophoneRegMsg" class="text-danger">숫자만 입력해 주세요.</span>                
              </div>
              
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="oname" class="text-black">받는사람 이름 <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="orname" name="orname">
                  <span id="ornameMsg" class="text-danger">이름을 입력해주세요.</span>
                </div>
              </div>
              <div class="form-group row">
	            <div class="col-md-4">
	              <label for="oaddress" class="text-black">배송지 주소 <span class="text-danger"></span></label>
	            </div>
	          </div>
	           <div class="form-group row"> 
	             <div class="col-md-4">
	                <input type="text" class="form-control" id="oaddress" name="oaddress" placeholder="ZipCode">
	             </div>
	          
	             <div class="col-md-4">  
	               	<input class="btn btn-outline-dark btn-block btn-sm" type="button" onclick="daumPostcode()" value="우편번호 찾기">
	             </div>
	           </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_address" class="text-black"> <span class="text-danger"></span></label>
                  <input type="text" class="form-control" id="oaddress2" name="oaddress2" placeholder="Address1">
                </div>
                <div class="col-md-12">
                  <label for="c_address" class="text-black"> <span class="text-danger"></span></label>
                  <input type="text" class="form-control" id="oaddress3" name="oaddress3" placeholder="Address2">
                  <span id="oaddressMsg" class="text-danger">상세주소를 입력해주세요.</span>
                </div>                
              </div>

              <div class="form-group">
                <label for="c_order_notes" class="text-black">배송 요청사항</label>
                <textarea name="orequire" id="orequire" cols="30" rows="5" class="form-control" placeholder="요청사항을 적어주세요..."></textarea>
              </div>

            </div>
          </div>
          
          <div class="col-md-5">           
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">주문 정보</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>상품</th>
                      <th>합계</th>
                    </thead>
                    <tbody>
                      
                      <%
                      	
                      
                      	
                      	int plus = 0;
                		
                		DecimalFormat decFormat = new DecimalFormat("###,###");

                      	int size = orderList.size();
                      	for(int i=0; i<size; i++) {
                      		// i=0 
                      		//orderList.get(0)
                      		
                      		plus = plus + ( orderList.get(i).getPrice() * orderList.get(i).getCount());
                      %>
                                         
                      <tr>
                        <td><%=orderList.get(i).getName() %><strong class="mx-2">x</strong><%=orderList.get(i).getCount() %></td>
                        <td id="price"><%=decFormat.format(orderList.get(i).getPrice()*orderList.get(i).getCount()) %></td>
                      </tr>                     
                          
                      <%
                      	}
                      %>
                        
                        <td class="text-black font-weight-bold"><strong>주문 총 합계</strong></td>
                        <td class="text-black font-weight-bold" ><strong>￦<%=decFormat.format(plus) %></strong></td>
                      </tr>
                    </tbody>
                  </table>

                  <input type="hidden" name="totalPrice" value="<%=plus%>">
                  

                  <div class="form-group">
                    <button class="btn btn-outline-dark btn-lg btn-block" type="submit" id="orderBtn">결제하기</button>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div>
         
      </div>
    </div>

    
  </div>
 </form>   
  
  
  
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <script type="text/javascript">
  
  
  //우편번호 찾기
  function daumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  //document.getElementById("sample6_extraAddress").value = extraAddr;
              
              } else {
                  //document.getElementById("sample6_extraAddress").value = '';
              }
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('oaddress').value = data.zonecode;
              document.getElementById("oaddress2").value = addr;              
              // 커서를 상세주소 필드로 이동한다.
              //document.getElementById("sample6_detailAddress").focus();
          }
      }).open();
  }
  
  //유효성 검사
  $("#ophone2").focus();
    $("#orderBtn").click(function() {
		
    	var  submitResult=true;
    	
    	$(".text-danger").css("display","none");
    	
    	var ophoneReg=/\d{3,4}/;
    	var ophone2Reg=/\d{4}/;
    	if($("#ophone2").val()=="" || $("#ophone3").val()==""){
    		$("#ophoneMsg").css("display","block");
    		submitResult=false;
    	} else if(!ophoneReg.test($("#ophone2").val()) || !ophone2Reg.test($("#ophone3").val())){
    		$("#ophoneRegMsg").css("display","block");
    		submitResult=false;
    	}
    	
    	if($("#orname").val()==""){
    		$("#ornameMsg").css("display","block");
    		submitResult=false;
    	};
    	
    	if($("#oaddress2").val()==""){
    		$("#oaddressMsg").css("display","block");
    		submitResult=false;
    	}
    	return submitResult;
	});
    
    $("#check").change(function() {
    	if($(this).is(":checked")) {
    		var orname = $("#mname").val();
    		var mphone = $("#mphone").val();
    		var mphone2 = $("#mphone2").val();
    		var mphone3 = $("#mphone3").val();
    		
    		$("#orname").val(orname);
    		$("#ophone").val(mphone);
    		$("#ophone2").val(mphone2);
    		$("#ophone3").val(mphone3);
    		$("#oaddress").val("<%=member.getZipcode()%>");
    		$("#oaddress2").val("<%=member.getMainAddress()%>");
    		$("#oaddress3").val("<%=member.getDetailAddress()%>");
    	}else {
    		$("#orname").val("");
    		$("#oaddress").val("");
    		$("#oaddress2").val("");
    		$("#oaddress3").val("");
    		$("#ophone").val("");
    		$("#ophone2").val("");
    		$("#ophone3").val("");
    	}
    })
  
  
  </script>

<div>

  <jsp:include page="../template/footer.jsp"></jsp:include>
  
  
    </div>

  </body>
  </html>
	