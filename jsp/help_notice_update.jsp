<%@page import="com.dto.Announce_joinDto"%>
<%@page import="com.dto.AnnounceDto"%>
<%@page import="com.dao.AnnounceDao"%>
<%@page import="com.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>공지사항</p><br>
<c:choose>
	<c:when test="${requestScope.announceDto ne null }">
		<form action="HelpPage.do" method="post">
			<input type="hidden" name="pg" value="notice_update_proc">
			<input type="hidden" name="anno_idx" value="${requestScope.announceDto.anno_idx}">
			<table class="type09">
			    <tr>
			        <td>제목</td>
			        <td><input type="text"  style="width: 300px;" name="anno_title" value="${requestScope.announceDto.anno_title}"></td>
				</tr>
				<tr>
				    <td>내용</td>
				    <td><textarea name="anno_content">${requestScope.announceDto.anno_content}</textarea></td>
				</tr>
    		</table>
    		<input type="submit" value="수정" class="update_notice">
		</form>
	</c:when>
	<c:otherwise>
		<script>alert("error");</script>
	</c:otherwise>
</c:choose>