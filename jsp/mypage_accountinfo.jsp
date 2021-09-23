<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p>프로필</p><br>
<table class="accountinfo_table">
    <tbody>
        <tr>
            <td>
                <div class="info_title">개인정보</div>
                <ul class="info_content">
                    <li>${sessionScope.memberInfo.member_name}</li>
                    <li>${sessionScope.memberInfo.phone.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})","$1-$2-$3")}</li>
                    <li>${sessionScope.memberInfo.email}</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <div class="info_title">주소</div>
                <ul class="info_content">
                    <li>${sessionScope.memberInfo.address.split("//")[0]}</li>
                    <li>${sessionScope.memberInfo.address.split("//")[1]}</li>
                    <li>${sessionScope.memberInfo.address.split("//")[2]}</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <div class="info_title">아이디</div>
                <div class="info_content">${sessionScope.memberInfo.id}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="info_title">회원등급</div>
                <div class="info_content">${sessionScope.memberInfo.grade}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="info_title">가입일</div>
                <div class="info_content">${sessionScope.memberInfo.regdate}</div>
            </td>
        </tr>
    </tbody>
</table>
<button class="accountbtn" onclick="location.href='MyPage.do?pg=updateAccount'">수정하기</button>
<button class="withdrawalbtn" onclick="location.href='MyPage.do?pg=withdrawal'">탈퇴하기</button>