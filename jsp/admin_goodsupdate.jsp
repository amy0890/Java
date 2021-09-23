<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p>상품 관리</p><br>
<form action="GoodsUpdateProc.do" method="post" enctype="multipart/form-data">
	<c:set var="info" value="${requestScope.iteminfo }"/>
	<input type="hidden" name="items_idx" value="${info.items_idx}">
	<table class="type09">
        <tr>
            <td>제품명</td>
            <td><input type="text" name="items_name" value="${info.items_name}"></td>
        </tr>
        <tr>
            <td>카테고리</td>
            <td>
            	<select name="items_category">
            		<option value="소파" <c:if test="${info.items_category == '소파'}">selected</c:if>>소파</option>
            		<option value="스툴" <c:if test="${info.items_category == '스툴'}">selected</c:if>>스툴</option>
            		<option value="악세서리" <c:if test="${info.items_category == '악세서리'}">selected</c:if>>악세서리</option>
            	</select>
            </td>
        </tr>
        <tr>
            <td>제품가격</td>
            <td><input type="number" name="price" value="${info.price }"></td>
        </tr>
        <tr>
            <td>재고수량</td>
            <td><input type="number" name="stock" value="${info.stock }"></td>
        </tr>                      
        <tr>
            <td>제품설명</td>
            <td><textarea name="items_info1">${info.items_info1 }</textarea></td>
        </tr>
        <tr>
            <td>상세설명</td>
            <td><textarea name="items_info2">${info.items_info2 }</textarea></td>
        </tr>
        <tr>
            <td>소재/관리</td>
            <td><textarea name="items_info3">${info.items_info3 }</textarea></td>
        </tr>
        <tr>
            <td>제품크기</td>
            <td><textarea name="items_info4">${info.items_info4 }</textarea></td>
        </tr>
      	<c:forEach var="i" items="${info.items_img.split('//') }">
      	<c:set var="cnt" value="${cnt + 1 }" />
        <tr>
            <td>이미지</td>
            <td class="items_update_box">
            	<div class="items_update_img_box">
                	<img alt="" src="img/items/${i}">
            	</div>
            	<input type="hidden" value="${i }" name="img${cnt }">
            	<input type="button" value="삭제" class="img_del_btn">
            </td>
        </tr>
       	</c:forEach>	
        <tr>	
            <td>이미지</td>
            <td class="items_img_inputbox">
            	<input type="file" name="items_img0">
            	<input type="button" value="추가" class="file_add_btn"> 
            	<input type="button" value="삭제" class="file_del_btn"> 
            </td>
        </tr>
    </table>
    <div class="addbtn_box">
     	<input type="hidden" value="0" name="file_num">
     	<input type="hidden" value="${info.items_img }" name="oldfile_list">
     	<input type="submit" value="수정완료" class="add_btn">
    </div>
</form>