<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.memberInfo.lv ne 10}"> 
	<script>
		alert("잘못된 접근입니다.");
		location.href="HelpPage.do?pg=notice";
	</script>
</c:if>

<p>공지사항</p><br>
<form action="HelpPage.do" method="post">
	<input type="hidden" name="pg" value="notice_write_proc">
	<table class="type09">
        <tr>
            <td>제목</td>
            <td><input type="text" name="anno_title" placeholder="[구분] 제목을 입력하세요."></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="anno_content" placeholder="내용을 입력하세요."></textarea></td>
        </tr>
	</table>
	<input type="submit" value="작성" class="save_btn">
</form>
