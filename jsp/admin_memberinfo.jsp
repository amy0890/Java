<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p>회원 관리</p><br>
<c:set var="data" value="${requestScope.memberdata }" />
<button class="delete_goods" onclick="memberblock_proc(${data.member_idx}, ${data.lv })">차단</button>
<table class="type09">
    <tr>
        <td class="memberinfo_tag">회원번호</td>
        <td>${data.member_idx }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">회원아이디</td>
        <td>${data.id }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">회원명</td>
        <td>${data.member_name }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">이메일</td>
        <td>${data.email }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">주소</td>
        <td>
            ${data.address.split("//")[0]}<br>
			${data.address.split("//")[1]}<br>
            ${data.address.split("//")[2]}
		</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">연락처</td>
        <td>${data.phone.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})","$1-$2-$3")}</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">등급</td>
        <td>${data.grade }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">권한</td>
        <td>${data.lv }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">포인트</td>
        <td>${data.point }</td>
    </tr>
    <tr>
        <td class="memberinfo_tag">가입일</td>
        <td>${data.regdate }</td>
    </tr>     
</table>