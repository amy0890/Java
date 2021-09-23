<%@page import="com.dto.Announce_joinDto"%>
<%@page import="com.dto.MemberDto"%>
<%@page import="com.dto.AnnounceDto"%>
<%@page import="java.util.Vector"%>
<%@page import="com.dao.AnnounceDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<p>공지사항</p><br>
<c:if test="${sessionScope.memberInfo.lv eq 10}">
	<button class="write_btn" onclick="location.href='HelpPage.do?pg=notice_write'">글쓰기</button>
</c:if>
<table class="type09">
	<thead>
	    <tr>
	        <td class="notice_long">제목</td>
	        <td class="notice_tag">작성자</td>
	        <td class="notice_tag">작성일</td>
	    </tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${requestScope.announceDto ne null && requestScope.announceDto.size() > 0}">
		    <c:forEach var="i" items="${requestScope.announceDto}">
		        <tr>
		            <td onclick="location.href='HelpPage.do?pg=notice_show&anno_idx=${i.anno_idx}'" class="notice_long">${i.anno_title}</td>
		            <td>${i.member_name}</td>
		            <td>${i.anno_date.substring(0, 10)}</td>
		        </tr>
		    </c:forEach>
		</c:when>
		<c:otherwise>
				<tr>
					<td colspan="3">게시글이 없습니다.</td>
				</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>