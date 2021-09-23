<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/sofalist.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="script/sofalist.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="item_wrap">
        <div class="category_name">스툴</div>
        <p>의자가 더 필요할 때 간편하게 가져다 쓸 수 있고, 일부 제품은 잡지나 여분의 쿠션을 넣어둘 수납공간이 숨겨져 있어요.<br>
        	스툴 하나로 새로운 분위기의 연출도 가능하답니다.</p><br>
        <hr><br>
        <div class="best_wrap">
	        <c:forEach var="items" items="${requestScope.Items_ReviewDto}">
	        <c:if test="${items.items_category == '스툴'}" >
	            <div class="bestitem">
	                <div class="imgbox" onclick="location.href='ItemPage.do?items_idx=${items.items_idx}'">
	                <c:set var="i" value="${items.items_img.split('//') }" />
	                    <div class="changeimg"><img src="img/items/${i[0]}"></div>
	                    <div class="firstimg"><img src="img/items/${i[1]}"></div>
	                    <br> 
	                </div>
	                <div class="item_infobox">
	                    <div class="info_left">
	                        <div class="title_name">${items.items_name}</div>
	                        <div>￦ <fmt:formatNumber value="${items.price}" pattern="#,###,###"/></div>
	                        <div class="star">
	                        <c:set var="star" value="${items.items_star_avg }" />
	                        	<c:forEach var="cnt" begin="1" end="5">
	                        		<c:choose>
	                        			<c:when test="${star >= 1 }">
	                        				<i class="fas fa-star"></i>
	                        				<c:set var="star" value="${star - 1 }"/>			 
	                        			</c:when>
	                        			<c:when test="${star < 1 && star > 0 }">
	                        				<i class="fas fa-star-half-alt"></i>
	                        				<c:set var="star" value="0" />			
	                        			</c:when>
	                        			<c:when test="${star <= 0 }">
	                        				<i class="far fa-star"></i>
	                        			</c:when>
	                        		</c:choose>
	                        	</c:forEach>
	                        	<span class="review_cnt">(${items.items_review_cnt })</span>
	                        </div>
	                   </div>
	                    <div class="itemradius"><i class="fas fa-shopping-cart"></i></div>
	                </div>
	            </div>
	            </c:if>
	        </c:forEach>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>