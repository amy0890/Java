<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.Qna_board_joinDto"%>
<%@page import="com.dao.Qna_boardDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\r\n");
%>
<c:if test="${param.err != null && param.err == 0}">
	<script>
		alert("에러가 발생하였습니다");
	</script>
</c:if>
<p>문의하기</p>
<br>
<c:choose>
	<c:when test="${requestScope.jDto.get(0) ne null }">
		<c:if
			test="${ sessionScope.memberInfo.member_idx == requestScope.jDto.get(0).member_idx || (sessionScope.memberInfo.lv >= 10)}">
			<button class="update_goods"
				onclick="location.href='HelpPage.do?pg=qna_update&qna_idx=${requestScope.jDto.get(0).qna_idx}'">수정</button>
			<button class="delete_goods"
				onclick="location.href='HelpPage.do?pg=qna_delete&qna_idx=${requestScope.jDto.get(0).qna_idx}'">삭제</button>
		</c:if>
		<table class="type09">


			<tr>
				<td class="qnashow_tag">구분</td>
				<td>${requestScope.jDto.get(0).qna_category}</td>
			</tr>
			<tr>
				<td class="qnashow_tag">제목</td>
				<td>${requestScope.jDto.get(0).qna_title}</td>
			</tr>
			<tr>
				<td class="qnashow_tag">작성자</td>
				<td>${requestScope.jDto.get(0).member_name}(${requestScope.jDto.get(0).id})</td>
			</tr>
			<tr>
				<td class="qnashow_tag">작성일</td>
				<td>${requestScope.jDto.get(0).qna_date}</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 250px;">${fn:replace(requestScope.jDto.get(0).qna_content, newLineChar, "<br>")}</td>
			</tr>
			<c:forEach var="repl" items="${requestScope.jDto }">
			<c:if test="${repl.qna_repl_idx > 0 }" >
				<tr>
					<td class="qnashow_tag">답변</td>
					<td class="repl_box">
						<c:if test="${sessionScope.memberInfo.lv >= 10 }">
							<button class="repl_update_btn"	onclick="location.href='HelpPage.do?pg=qna_repl_update&qna_repl_idx=${repl.qna_repl_idx}&qna_idx=${repl.qna_idx }'">수정</button>
							<button class="repl_delete_btn" onclick="qna_repl_delete_proc(${repl.qna_repl_idx}, ${ repl.qna_idx})">삭제</button>
						</c:if>
						<div class="qna_repl_member_name">${repl.qna_repl_member_name}</div>
						<div class="repl_date">${repl.repl_date}</div>
						<div>${fn:replace(repl.repl_content, newLineChar, "<br>")}</div></td>
				</tr>
			</c:if>
			</c:forEach>

		</table>
	</c:when>
	<c:otherwise>
		<script>
			alert("에러");
		</script>
	</c:otherwise>
</c:choose>
<c:if test="${sessionScope.memberInfo.lv >= 10}">
	<form action="HelpPage.do" method="post">
	<input type="hidden" value="qna_repl_write_proc" name="pg" >
	<input type="hidden" value="${sessionScope.memberInfo.member_idx}" name="member_idx" >
	<input type="hidden" value="${requestScope.jDto.get(0).qna_idx}" name="qna_idx" >
		<table class="type09">
			<tr>
				<td><textarea placeholder="[관리자] 답변하실 내용을 입력하세요." name="repl_content"></textarea></td>
			</tr>
		</table>
		<div class="btn_box">
			<input type="submit" value="답변하기" class="answer_qna">
		</div>
	</form>
</c:if>

