<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/mypage.css" type="text/css">
    <link rel="stylesheet" href="css/table.css" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="script/admin.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>
<c:if test="${sessionScope.memberInfo == null || sessionScope.memberInfo.lv < 10}"> 
	<script>
		alert("잘못된 접근입니다.");
		location.href="Home.do";
	</script>
</c:if>

<jsp:include page="header.jsp" />
<div class="mypage_wrap">
        <div class="mypage_fixed">
            <div class="fixed_top">
                <div class="mypage_hi">Hi, 관리자</div>
                <div class="mypage_point">
                    <div>(주) SOFAS KOREA</div>
                </div>
            </div>
            <div class="fixed_bottom">
                <ul>
                    <li><a href="AdminPage.do?pg=member">회원관리</a></li>
                    <li><a href="AdminPage.do?pg=goods">상품관리</a></li>
                    <li><a href="AdminPage.do?pg=order">주문관리</a></li>
                </ul>
            </div>
        </div>

        <div>
            <div class="mypage_changed">
                <div class="page_div">
                <!--여기서 부터 페이지에 맞게 갈아끼우기-->
                <c:set var="pg" value="${param.pg}" />
                <c:choose>
                	<c:when test="${pg == null || pg == 'order'}"> 
                		<jsp:include page="admin_order.jsp" />
                	</c:when>
                	<c:when test="${pg == 'orderinfo'}"> 
	                	<jsp:include page="admin_orderinfo.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'member'}"> 
	                	<jsp:include page="admin_member.jsp" />    
                	</c:when>
                	<c:when test="${pg == 'memberinfo'}"> 
	                	<jsp:include page="admin_memberinfo.jsp" /> 
                	</c:when>
                	<c:when test="${pg == 'goods'}"> 
	                	<jsp:include page="admin_goods.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'goodsinfo'}"> 
	                	<jsp:include page="admin_goodsinfo.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'goodsadd'}"> 
	                	<jsp:include page="admin_goodsadd.jsp" />    
                	</c:when>
                	<c:when test="${pg == 'goodsupdate'}"> 
	                	<jsp:include page="admin_goodsupdate.jsp" />     
                	</c:when>
                </c:choose>
                <!--여기까지 페이지에 맞게 갈아끼우기-->
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>