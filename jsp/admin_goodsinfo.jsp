<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>
<p>상품 관리</p><br>
<c:set var="info" value="${requestScope.iteminfo }"/>
<button class="update_goods"  onclick="location.href='AdminPage.do?pg=goodsupdate&idx=${info.items_idx}'">수정</button>
<button class="delete_goods" onclick="goodsdelete_proc(${info.items_idx})">삭제</button>
<table class="type09">
        <tr>
            <td class="goodsinfo_tag">제품번호</td>
            <td>${info.items_idx}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">제품명</td>
            <td>${info.items_name}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">카테고리</td>
            <td>${info.items_category}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">제품가격</td>
            <td><fmt:formatNumber value="${info.price}" pattern="#,###" /></td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">재고수량</td>
            <td>${info.stock}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">제품설명</td>
            <td>${fn:replace(info.items_info1, newLineChar, "<br>")}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">상세설명</td>
            <td>${fn:replace(info.items_info2, newLineChar, "<br>")}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">소재/관리</td>
            <td>${fn:replace(info.items_info3, newLineChar, "<br>")}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">제품크기</td>
            <td>${fn:replace(info.items_info4, newLineChar, "<br>")}</td>
        </tr>
        <tr>
            <td class="goodsinfo_tag">이미지</td>
            <td>
            	<div class="goodsinfo_img_container">
            	<c:forEach var="i" items="${info.items_img.split('//') }">
            		<div class="goodsinfo_img_box">
                		<img alt="" src="img/items/${i}">                                		
            		</div>
            	</c:forEach>
            	</div>
            </td>
        </tr>
      
</table>