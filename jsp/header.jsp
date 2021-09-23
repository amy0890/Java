<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="logo_wrap">
        <div class="logo_category">
            <ul>
                <li><a href="Sofalist.do">소파</a></li>
                <li><a href="Acclist.do">악세서리</a></li>
                <li><a href="Stoollist.do">스툴</a></li>
            </ul>
        </div>
        <div class="logo">
            <div class="logoimg" onclick="location.href='Home.do'"><img src="img/home/logo.png"></div>
        </div>
        <div class="logo_homemenu">
            <ul>
            	<c:choose>
            		<c:when test="${empty sessionScope.memberInfo}">
	                    <li><a href="Login.do">로그인</a></li>
	                    <li><a href="SignUp.do">회원가입</a></li>                		
            		</c:when>
            		<c:when test="${sessionScope.memberInfo.lv >= 10}">
               			<li><a href="AdminPage.do">관리자</a></li>
	                    <li><a href="Logout.do">로그아웃</a></li>                		
            		</c:when>
            		<c:when test="${sessionScope.memberInfo.lv >= 5}">
               			<li><a href="MyPage.do">마이페이지</a></li>
	                    <li><a href="Logout.do">로그아웃</a></li>                		
            		</c:when>
            	</c:choose>
                <li><a href="HelpPage.do">고객지원</a></li>
                <li><a href="CartPage.do">장바구니</a></li>
            </ul>
        </div>
    </div>
</header>
  	