<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="err" value="${param.err}" />
<c:if test="${!empty err and err eq '0'}">
	<script>alert("Error : 회원탈퇴에 실패하였습니다.");</script>
</c:if>

<p>탈퇴하기</p><br>
<form name="withdrawal_form" method="post">
	<input type="hidden" name="idx" value="${sessionScope.memberInfo.member_idx}">
	<input type="password" name="pw" autocomplete="off" placeholder="비밀번호를 입력하세요.">
	<div class="withdrawal_pw_check"></div>
	<button type="button" class="withdrawal_submit">확인</button>
</form>