<%@page import="com.dto.Announce_joinDto"%>
<%@page import="com.dao.AnnounceDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>

<p>공지사항</p><br>       				
<c:choose>
	<c:when test="${requestScope.announceDto ne null }">
    	<c:if test="${sessionScope.memberInfo.member_name eq requestScope.announceDto.member_name}">
            <button class="update_goods"  onclick="location.href='HelpPage.do?pg=notice_update&anno_idx=${requestScope.announceDto.anno_idx}'">수정</button>
        	<button class="delete_goods" onclick="location.href='HelpPage.do?pg=notice_delete&anno_idx=${requestScope.announceDto.anno_idx}'">삭제</button>
    	</c:if>
        <table class="type09">
            <tr>
                <td class="noticeshow_tag">제목</td>
                <td>${requestScope.announceDto.anno_title}</td>
            </tr>
            <tr>
                <td class="noticeshow_tag">작성자</td>
                <td>${requestScope.announceDto.member_name}</td>
            </tr>
            <tr>
                <td  class="noticeshow_tag">작성일</td>
                <td>${requestScope.announceDto.anno_date}</td>
            </tr>
            <tr>
                <td colspan="2" style="height: 250px;">${fn:replace(requestScope.announceDto.anno_content, newLineChar, "<br>")}</td>
            </tr>
        </table>
     </c:when>
     <c:otherwise>
		<script>alert("에러");</script>
	</c:otherwise>
</c:choose>