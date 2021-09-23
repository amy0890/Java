<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.err != null && param.err == 0}"> 
	<script>
		alert("에러가 발생하였습니다");
	</script>		
</c:if>

<p>상품 관리</p><br>
<button class="write_btn" onclick="location.href='AdminPage.do?pg=goodsadd'">상품추가</button>
<table class="type09">
    <thead>
        <tr>
            <td class="goods_short">제품번호</td>
            <td class="goods_tag">제품명</td>
            <td class="goods_middle">카테고리</td>
            <td class="goods_middle">가격</td>
            <td class="goods_short">판매수량</td>
            <td class="goods_short">재고</td>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="i" items="${requestScope.itemlist}">
    	<tr class="pointer" onclick="location.href='AdminPage.do?pg=goodsinfo&idx=${i.items_idx}'">
            <td>${i.items_idx}</td>
            <td>${i.items_name}</td>
            <td>${i.items_category}</td>
            <td><fmt:formatNumber value="${i.price}" pattern="#,###" /></td>
            <td>${i.sales_cnt}</td>
            <td>${i.stock}</td>
    	</tr>
    	</c:forEach>
    </tbody>
</table>