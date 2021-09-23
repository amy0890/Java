<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.err != null && param.err == 0}"> 
	<script>
		alert("에러가 발생하였습니다");
	</script>		
</c:if>

<p>회원 관리</p><br>
<table class="type09">
    <thead>
        <tr>
            <td class="member_tag">회원번호</td>
            <td class="member_tag">이름</td>
            <td class="member_tag">아이디</td>
            <td class="member_tag">등급</td>
            <td class="member_tag">권한</td>                                
            <td class="member_tag">가입일</td>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="i" items="${requestScope.memberlist }">
    	<tr class="line_pointer" onclick="location.href='AdminPage.do?pg=memberinfo&idx=${i.member_idx}'">
            <td>${i.member_idx }</td>
            <td>${i.member_name }</td>
            <td>${i.id }</td>
            <td>${i.grade }</td>
            <td>${i.lv }</td>
            <td>${i.regdate.substring(0, 10) }</td>
    	</tr>
    </c:forEach>
    </tbody>
</table>