<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SOFAS KOREA</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/cart.css" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="script/cart.js" defer></script>
</head>
<body>

<jsp:include page="header.jsp" />
<c:if test="${empty sessionScope.memberInfo}">
	<script>location.href="Login.do"</script>
</c:if>
	
<div class="cart_wrap">
	<div class="cart_title">
		<div>장바구니</div>
	</div>
	<form class="cart_form" action="PaymentPage.do">
	<div class="cart_aside"> 
		<div class="cart_itemInfo partision">
			<div id="cart_font">상품 목록</div>
			
			<c:if test="${not empty requestScope.itemInfo }">
				<c:forEach var="itemInfo" items="${requestScope.itemInfo }">
		            <c:set var="items_cnt" value="${items_cnt + 1 }" />
		            <div class="cart_itemList">
		                <img src="img/items/${itemInfo.items_img.split('//')[0] }">
		                <div>
		                    <div>
		                    	${itemInfo.items_name }
		                    </div>
		                    <div class="grey">
		                       	${itemInfo.items_category } 
		                    </div>
		                    <div style="display: flex;">
		                        <div class="grey" style="margin-top: 6px;"> 
		                           	 수량
		                        </div> 
		                        <div>
		                            <input type="text" name="quantity${items_cnt}" class="item_count" value="${itemInfo.quantity}" 
		                            	maxlength="1" style="border-radius: 5px;">
		                            <input type="hidden" name="items_idx${items_cnt}" class="item_idx" value="${ itemInfo.items_idx }">
		                        </div>
		                        <div>
		                            <input type="button" value="+" class="plus_btn" style="font-weight: bolder; border-radius: 5px;">
		                            <input type="button" value="-" class="minus_btn" style="font-weight: bolder; border-radius: 5px;">
		                        </div>
		                    </div>
		                    <div style="display: flex;  justify-content:space-between; width: 400px;">
		                        <div class="getPrice">
									￦ <fmt:formatNumber value="${itemInfo.price * itemInfo.quantity}" pattern="#,###" />
		                        </div>
	                        	<input type="hidden" value="${itemInfo.price * itemInfo.quantity }" class="getPrice_val">
		                        <input class="price" type="hidden" value="${itemInfo.price }">
		                        <div>
		                           	<button type="button" class="delete_cart_item" onclick="delete_cart(this, ${itemInfo.items_idx})">삭제</button>
		                        </div>       
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
		        <input type="hidden" name="items_cnt" value="${items_cnt }">
        	</c:if>
    	</div><!--cart_itemInfo 끝-->
         
	</div> <!-- cart_aside 끝 -->

    <div class="cart_section">
        <div class="cart_side_stickybox">
        <div class="cart_side">
            <div class="cart_side_box1">
				주문내역
            </div>
            <div class="cart_side_box2">
				 전체 서비스 이 금액에는 배송비가 포함되어 있지 않으며, 배송지에 따라 구매가 불가능할 수 있습니다.
            </div>
            <div class="cart_side_box3">
                <div>
                    <Strong style="font-size: 30px;">Total</Strong> 
                </div>
                <div class="totalPrice" >
                </div>
            </div>
            <input type="submit" class="cart_side_box4" value="결제하기">
        
        </div><!--cart_side 끝 -->
        
        <hr><br>

        <div class="cart_under">
            <div style="padding-left: 30px;">
                <div style="font-size:large; margin-bottom: 30px;"><strong><i class="far fa-heart"></i></strong> &nbsp; 반품 정책 365일 이내에 제품 환불 가능</div>
            </div>
        </div>
        </div>
      
    </div> <!--cart_section 끝 -->
        
     
</form>
</div><!--cart_wrap 끝-->

<jsp:include page="footer.jsp" />
</body>
</html>