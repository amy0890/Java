<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/payment.css" type="text/css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="script/payment.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:if test="${empty sessionScope.memberInfo}">
		<script>location.href="Login.do"</script>
	</c:if>
				      
	<div class="payment_wrap">
		<div class="payment_title">
			<div>결제하기</div>
		</div>
		<form class="payment_form" onsubmit="return submit_check(this)" action="PaymentProc.do">
			<div class="payment_aside"> 
				<div class="payment_itemInfo partision">
					<div id="payment_font">주문 상품 정보</div>
					<c:forEach var="iteminfo" items="${requestScope.itemsInfo }">
						<c:set var="items_cnt" value="${items_cnt +1 }" />
						<input type="hidden" name="items_idx${items_cnt }" value="${iteminfo.items_idx }">
						<input type="hidden" name="quantity${items_cnt }" value="${iteminfo.quantity }">
						<div class="payment_itemList">
			  				<img src="img/items/${iteminfo.items_img.split('//')[0] }">
			  				<div>
					      		<div>
					         		${iteminfo.items_name }<br>
					      		</div>
					      		<div class="grey">
					         		수량 : ${iteminfo.quantity }
					      		</div>
								<div>
								  <fmt:formatNumber value="${iteminfo.price*iteminfo.quantity}" pattern="#,###" /> 원
								</div>
							</div>
						</div>
						<c:set var="total_price" value="${total_price + iteminfo.price*iteminfo.quantity }" />
					</c:forEach>
					<input type="hidden" name="items_cnt" value="${items_cnt }">
				</div><!--payment_itemInfo 끝-->
				<c:set var="memberinfo" value="${sessionScope.memberInfo }" />
          		<div class="payment_userInfo partision">
            		<div id="payment_font" >주문자 정보</div>
                		<div class="payment_userInfo1">
		                    <input type="text" class="order_name"  placeholder="이름" value="${memberinfo.member_name }">
		                    <input type="text" class="order_phone" placeholder="연락처" value="${memberinfo.phone }">
		                    <input type="hidden" class="order_address" value="${memberinfo.address }">
                		</div>
		                <div class="payment_userInfo2">
		                    <input type="text" name="order_email" placeholder="이메일" value="${ memberinfo.email }">
		                </div>
          			</div>
          			<div class="payment_shipInfo partision">
            			<div id="payment_font">배송 정보</div>
						<div class="payment_shipInfo_box1">
			                <div>
			                    <input type="checkbox" name="check_memberInfo" onclick="same_info()">
			                </div>
			                <div>
			                    	주문자 정보 동일
			                </div>
        				</div>

			            <div class="payment_shipInfo_box2">
			                <input type="text" placeholder="수령인" name="order_name" >
			                <input type="text" placeholder="연락처" name="order_phone">
			         		
			            </div>

			            <div class="payment_shipInfo_box3">
			                <div>
			                    <input type="text" placeholder="우편번호" id="zip" name="addr1" >
			                </div>
			                <div>
			                    <input type="button" value="검색" id="btnAddr">
			                </div>
			            </div>

			            <div class="payment_shipInfo_box4">
			                <input type="text" placeholder="주소"  id="addr1" name="addr2">
			            </div>

			            <div class="payment_shipInfo_box5">
			                <input type="text" placeholder="상세주소" id="addr2" name="addr3">
			            </div>
				
			            <div class="payment_shipInfo_box6">
			                <input type="text" placeholder="배송메모" name="order_memo">
			            </div>
		            </div>
			    </div> <!-- payment_userInfo 끝 -->

        	<div class="payment_section"> 
          
            	<div class="payment_total partision ">
                	<div id="payment_font">최종 결제금액</div>
                	<div style="display: flex; justify-content: space-between; margin-bottom:10px;">
                    	<div class="grey">상품가격</div> 
                    	<div style="text-align: right;">￦ <fmt:formatNumber value="${total_price}" pattern="#,###" /> 원</div>
                    	<input type="hidden" name="total_price" value="${total_price}">
                	</div>
	                <div style="display: flex; justify-content: space-between; margin-bottom:10px;">
	                    <div class="grey">사용가능 포인트</div> 
	                    <div style="text-align: right;">${memberinfo.point}</div>
	                </div>
	                <div style="display: flex; justify-content: space-between; margin-bottom:10px;">
	                    <div class="grey">포인트 사용</div>
	                    <div style="text-align: right;">
	                    	<input type="number" name="use_point" value="0" style="border: none; width: 100%; text-align:right; font-size:16px">
	                    </div>
                	</div>
                	<hr><br>
	                <div style="display: flex; justify-content: space-between; margin-bottom:10px;">
	                    <div style="font-weight: bold;">총 결제금액</div> 
	                    <div style="text-align: right;">￦ <fmt:formatNumber value="${total_price}" pattern="#,###" /> 원</div>
	                    <input type="hidden" name="payment" value="${total_price}">
	                </div>
	            </div>

            	<div class="agree partision">
                	<div class="agree1">
						<input type="checkbox" id="all_ck"> 
	                    <div>
                        	전체동의<br>
                    	</div>
                	</div>
                	<div class="agree2">
                    	<div>ㄴ </div>
                    	<div><input type="checkbox" class="sub_ck essential"></div> 
                    	<div>개인정보 수집 및 이용 동의 <a class="view_agree2_text">약관보기</a>(필수)</div>
                    
                	</div>
	                <div class="agree2_text grey">
	                    1. 개인정보 수집 및 이용 목적<br><br>
	                    &nbsp;&nbsp;(1) 비회원 구매 서비스 제공<br>
	                    &nbsp;&nbsp;비회원 구매에 따른 본인 확인, 물품배송, 서비스 제공, 요금결제 및 정산, 서비스 부정이용 방지, 각종 고지.통지 등의 목적<br><br>
	
	                    (2) 고충처리<br>
	                    &nbsp;&nbsp;민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등<br><br>
	
	                    2. 수집하는 개인정보 항목<br>
	                    &nbsp;&nbsp;주문자 이름·연락처 및 이메일, 수령자 이름·연락처 및 주소, 결제 정보<br><br>
	
	                    3. 개인정보 보유 및 이용기간<br>
	                    &nbsp;&nbsp;전자상거래법 등 관계 법령에 의거 구매 후 5년간 보관<br><br>
	
	                    	※ 동의를 거부할 수 있으나 거부시 비회원 구매 서비스 이용이 불가합니다.<br><br>
	                </div>

	                <div class="agree3">
	                    <div>ㄴ </div>
	                    <div><input type="checkbox"class="sub_ck essential"></div> 
	                    <div>구매조건 확인 및 결제진행에 동의(필수)</div>
	                </div>
	                <div class="agree3">
	                    <div>ㄴ </div>
	                    <div><input type="checkbox" class="sub_ck"></div> 
	                    <div>마케팅 정보 활용 동의(선택)</div>
	                </div>
    
            	</div>
	            <div class="payment_button">
	                <div class="payment_button_box1">
	                    <div>
	                        <input type="submit" value="결제하기">
	                    </div>
	                    <div>
	                        <input type="button" value="뒤로가기" onclick="location.href='CartPage.do'">
	                    </div>
	                </div>
	            </div>
	        </div> <!--payment_section 끝 -->
        
		</form>
	</div><!--payment_wrap 끝-->

<jsp:include page="footer.jsp" />
</body>
</html>