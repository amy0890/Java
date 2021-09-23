<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p>주문 관리</p>
<br>
<c:set var="info" value="${requestScope.orderinfo.get(0)}" />
<div class="orderinfo_box">
	
	<input type="button" value="주문접수" class="orderinfo_btn" <c:if test="${info.order_state == '결제완료'}">onclick="orderManage(1)"</c:if>> 
	<input type="button" value="배송접수" class="orderinfo_btn" <c:if test="${info.order_state == '상품준비중'}">onclick="orderManage(2)"</c:if>> 
	<input type="button" value="주문취소" class="orderinfo_btn" <c:if test="${info.order_state != '배송완료'}">onclick="orderManage(3)"</c:if>>
</div>
<script>
	function orderManage(type) {
		location.href = "AdminPage.do?pg=update_state_proc&type=" + type + "&order_num=" + ${info.order_num};
	}
</script>
<table class="type09">
	<tr>
		<td class="orderinfo_tag">주문번호</td>
		<td>${info.order_num}</td>
	</tr>
	<c:forEach var="items_info" items="${requestScope.orderinfo }">
		<tr>
			<td rowspan="4" class="orderinfo_tag">주문상세</td>
		</tr>
		<tr>
			<td>제품번호: ${items_info.items_idx}</td>
		</tr>
		<tr>
			<td>제품명: ${items_info.items_name}</td>
		</tr>
		<tr>
			<td>주문수량: ${items_info.quantity}</td>
		</tr>
	</c:forEach>
	<tr>
		<td class="orderinfo_tag">주문상태</td>
		<td>${info.order_state}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">고객명</td>
		<td>${info.order_name}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">연락처</td>
		<td>${info.order_phone}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">이메일</td>
		<td>${info.order_email}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">주소</td>
		<td>${info.order_address}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">주문일자</td>
		<td>${info.order_date}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">메모</td>
		<td>${info.order_memo}</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">가격(포인트)</td>
		<td>￦ <fmt:formatNumber value="${info.total_price}"
				pattern="#,###,###" />(-${info.use_point}P 사용)
		</td>
	</tr>
	<tr>
		<td class="orderinfo_tag">결제금액</td>
		<td>￦ <fmt:formatNumber value="${info.payment}"
				pattern="#,###,###" /></td>
	</tr>

</table>