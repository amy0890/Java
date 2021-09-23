<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p>주문내역</p>
<br>
<table class="orderlist_table">
	<tbody>
		<c:choose>
			<c:when	test="${requestScope.orderlist ne null && requestScope.orderlist.size() > 0}">
				<c:forEach var="i" items="${requestScope.orderlist}">
					<tr>
						<td style="width: 100px; height: 100px;" class="orderlist_imgtd" style="cursor: pointer" onclick="location.href='MyPage.do?pg=orderDetails&order_num=${i.order_num}'">
							<div class="orderlist_imgdiv">
								<img src="img/items/${i.items_img.split('//')[0]}">
							</div>
						</td>
						<td style="cursor: pointer" onclick="location.href='MyPage.do?pg=orderDetails&order_num=${i.order_num}'">
							<div>주문번호 ${i.order_num}</div>
							<div>${i.items_name}외 ${i.order_items_cnt}</div>
							<div>${i.order_date.substring(0, 10)}</div>
							<div>
								￦ <fmt:formatNumber value="${i.payment}" pattern="#,###,###" />
							</div>
						</td>
						<td>${i.order_state}
							<div>
								<c:if test="${i.order_state == '상품준비중' || i.order_state == '결제완료' }"> 
								<input type="button" value="주문취소" class="cancel_btn" onclick="orderManage2(1,${i.order_num})">
								</c:if>
							</div>
							<div>
								<c:if test="${i.order_state == '배송중'}"> 
								<input type="button" value="구매확정" class="ok_btn" onclick="orderManage2(2,${i.order_num})">
								</c:if>
							</div>
					    </td>
					</tr>
				</c:forEach>
					
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">주문 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<script>
	function orderManage2(type,order_num){
		location.href="MyPage.do?pg=order_state_update&type="+type+"&order_num="+order_num;
	}
</script>