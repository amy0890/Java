<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>문의하기</p><br>
<c:choose>
	<c:when test="${requestScope.jDto.get(0) ne null }">
		<form action="HelpPage.do" method="post">
			<input type="hidden" name="pg" value="qna_update_proc">
			<input type="hidden" name="qna_idx" value="${requestScope.jDto.get(0).qna_idx}">
			<table class="type09">
				<tr>
				    <td>구분</td>
				    <td>
				        <select name="qna_category">
				            <option value="상품문의" <c:if test="${requestScope.jDto.get(0).qna_category eq '상품문의'}">selected</c:if>>상품문의</option>
				    		<option value="취소문의" <c:if test="${requestScope.jDto.get(0).qna_category eq '취소문의'}">selected</c:if>>취소문의</option>
				    		<option value="배송문의" <c:if test="${requestScope.jDto.get(0).qna_category eq '배송문의'}">selected</c:if>>배송문의</option>
				    	</select>
					<td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="qna_title" value="${requestScope.jDto.get(0).qna_title}"></td>
				</tr>
				<tr>
					<td colspan="2" style="height: 250px;"><textarea name="qna_content">${requestScope.jDto.get(0).qna_content}</textarea></td>
				</tr>
			</table>
		<input type="submit" class="update_goods" value="수정완료">
		</form>
	</c:when>
	<c:otherwise>
		<script>alert("error");</script>
	</c:otherwise>
</c:choose>