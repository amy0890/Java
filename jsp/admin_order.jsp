<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.err != null && param.err == 0}"> 
	<script>
		alert("에러가 발생하였습니다");
	</script>		
</c:if>
<p>주문 관리</p><br>
<table class="type09">
    <thead>
        <tr>
            <td class="order_tag">주문번호</td>
            <td class="order_tag">회원아이디</td>
            <td class="order_long">상품이름</td>
            <td class="order_short">주문일</td>
        </tr>
    </thead>
    <tbody>
      <c:choose>
		<c:when test="${requestScope.orderlist ne null && requestScope.orderlist.size() > 0}">
    	<c:forEach var="i" items="${requestScope.orderlist}">
    	<tr style="cursor:pointer" onclick="location.href='AdminPage.do?pg=orderinfo&order_num=${i.order_num}'">
                <td>${i.order_num}</td>
                <td>${i.id}</td>
                <td class="order_long">${i.items_name} 외 ${i.order_items_cnt}</td>
                <td>${i.order_date.substring(0, 10)}</td>
        </tr>
        </c:forEach>
         </c:when>
	 <c:otherwise>
	<tr>
		<td colspan="4">주문 내역이 없습니다.</td>
	</tr>
	</c:otherwise>
	</c:choose>
    </tbody>
</table>