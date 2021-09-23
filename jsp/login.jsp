<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="script/login.js" defer></script>
    <script type="text/javascript" src="script/href_util.js" defer></script>
    <title>SOFAS KOREA</title>
</head>

<body>
<script>
</script>
	<c:set var="err" value="${param.err}" />
	<c:if test="${!empty err and err eq '0'}">
		<script>alert("Error : 로그인에 실패하였습니다.");</script>
	</c:if>
	
	<c:if test="${not empty sessionScope.memberInfo}">
		<script>location.href="Home.do"</script>
	</c:if>
	
    <aside class="page_back" onclick="go_prevPage()"><i class="fas fa-arrow-left"></i></aside>
    <section class="login_scr_wrap">
        <article class="img_area">
            <img src="img/home/login_img.webp" alt="login_img">
        </article>
        <article class="login_area">
            <form class="login_form" method="post" name="login_form"> 
                <h1>로그인</h1>
                <div class="login_info">
                    <i class="fas fa-user"></i>
                    <input type="text" name="id" id="id" autocomplete="off">
                    <label for="id" class="label_id">아이디를 입력하세요.</label>
                </div>
                <div class="login_info">
                    <i class="fas fa-unlock-alt"></i>
                    <input type="password" name="pw" id="pw" autocomplete="off">
                    <label for="pw" class="label_pw">비밀번호를 입력하세요.</label>
                </div>
                <div class="login_info_check"></div>
                <button type="button" class="login_submit">로그인</button>
                <button type="button" class="sign_up" onclick="go_signUpPage()">회원가입</button>
            </form>
        </article>
    </section>
</body>

</html>