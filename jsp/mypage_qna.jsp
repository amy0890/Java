<%@page import="com.dto.Qna_board_joinDto"%>
<%@page import="com.dao.Qna_boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>문의내역</p>
<br>
<c:if test="${sessionScope.memberInfo != null}">
	<button class="write_btn"
		onclick="location.href='HelpPage.do?pg=qna_write'">글쓰기</button>
</c:if>
<table class="type09">
	<thead>
		<tr>
			<td class="qnalist_short">구분</td>
			<td class="qnalist_long">제목</td>
			<td class="qnalist_tag">작성자</td>
			<td class="qnalist_tag">작성일</td>
			<td class="qnalist_short">답변상태</td>
		</tr>
	</thead>
	<c:choose>
		<c:when
			test="${requestScope.qnalist ne null && requestScope.qnalist.size() > 0}">
	<tbody>
		<c:forEach var="i" items="${requestScope.qnalist}">

			<tr>
				<td>${i.qna_category}</td>
				<td
					onclick="location.href='HelpPage.do?pg=qna_show&qna_idx=${i.qna_idx}'"
					class="qnalist_long">${i.qna_title}</td>
				<td>${i.member_name}(${i.id})</td>
				<td>${i.qna_date.substring(0, 10)}</td>
				<td>${i.qna_repl_state}</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>

	</tbody>
</table>