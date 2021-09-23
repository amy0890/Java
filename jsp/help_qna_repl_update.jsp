<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>
 <p>답변수정</p><br>
<form action="HelpPage.do" method="post">
	<input type="hidden" name="pg" value="qna_repl_update_proc">
	<input type="hidden" name="qna_repl_idx" value="${param.qna_repl_idx }">
	<input type="hidden" name="qna_idx" value="${param.qna_idx }">
    <table class="type09">
		<tr>
			<td><textarea name="repl_content">${fn:replace(requestScope.qrdata.repl_content , newLineChar, "<br>")}</textarea></td>
		</tr>
	</table>
	<div class="btn_box">
		<input type="submit" value="수정완료" class="answer_qna">
	</div>
</form>