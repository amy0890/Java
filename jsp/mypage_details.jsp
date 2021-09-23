<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p>상세주문내역</p>
<br>
<c:set var="info" value="${requestScope.orderinfo.get(0)}" />
<div class="order_unm">주문번호 : ${info.order_num} (Total ${info.order_items_cnt})</div>
<table class="orderlist_table">
	<tbody>
		<c:forEach var="items_info" items="${requestScope.orderinfo }">
			<tr>
				<td style="width: 100px; height: 100px;">
					<div class="orderlist_imgdiv">
						<img src="img/items/${items_info.items_img.split('//')[0]}">
					</div>
				</td>
				<td>
					<div>제품명: ${items_info.items_name}</div>
					<div>주문일: ${items_info.order_date.substring(0, 10)}</div>
					<div>
						가격:
						 ￦ <fmt:formatNumber value="${items_info.price}" pattern="#,###,###" />
					</div>
					<div>개수: ${items_info.quantity}</div>
					<c:if test="${items_info.review_cnt == 0 }" >
					<div>
						<input type="button" value="리뷰 쓰기" class="write_review"
							onclick="location.href='MyPage.do?pg=review&items_idx=${items_info.items_idx}&items_name=${items_info.items_name}'">
					</div>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>