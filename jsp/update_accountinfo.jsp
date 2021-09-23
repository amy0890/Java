<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>프로필</p><br>
<table class="update_accountinfo_table">
    <tr>
        <td class="contents privacy_info">
            <div class="info_title">개인 정보</div>
            <table class="content privacy_info_table">
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" autocomplete="off" value="test"></td>
                    <td>
                        <div class="label label_name"></div>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="tel" autocomplete="off" value="1231123124"></td>
                    <td>
                        <div class="label label_tel"></div>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" autocomplete="off" value="test@test.test">
                    </td>
                    <td>
                        <div class="label label_email"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="contents addr_info">
            <div class="info_title">주소</div>
            <table class="content addr_info_table">
                <tr>
                    <td><button type="button" class="find_postcode" onclick="findPostcode()">우편번호 찾기</button></td>
                    <td><input type="text" name="postcode" id="postcode" value="11111" readonly>
                    </td>
                </tr>
                <tr>
                    <td>도로명주소</td>
                    <td><input type="text" name="roadAddress" id="roadAddress"
                            value="부산광역시 부산스러운 부산아침" readonly></td>
                </tr>
                <tr>
                    <td>상세주소</td>
                    <td><input type="text" name="detailAddress" autocomplete="off" value="test">
                    </td>
                    <td>
                        <div class="label label_detailAddress"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="contents id_info">
            <div class="info_title">아이디</div>
            <div class="content_div">아이디</div>
        </td>
    </tr>
    <tr>
        <td class="contents pw_info">
            <div class="info_title">비밀번호<span>수정<i class="fas fa-angle-down"></i></span></div>
            <table class="content pw_info_table">
                <tr>
                    <td>현재 비밀번호</td>
                    <td><input type="password" name="pw" autocomplete="off" placeholder="현재 비밀번호">
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td><input type="password" name="new_pw" autocomplete="off"
                            placeholder="새 비밀번호"></td>
                    <td>
                        <div class="label label_new_pw"></div>
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td><input type="password" name="new_pw_chk" autocomplete="off"
                            placeholder="새 비밀번호 확인"></td>
                    <td>
                        <div class="label label_new_pw_chk"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="contents grade_info">
            <div class="info_title">회원등급</div>
            <div class="content_div">등급</div>
        </td>
    </tr>
    <tr>
        <td class="contents date_info">
            <div class="info_title">가입일</div>
            <div class="content_div">가입일</div>
        </td>
    </tr>
</table>
<button type="button" class="update_info" onclick="location.href='MyPage.do?pg=account'">수정완료</button>