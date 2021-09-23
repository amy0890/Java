<%@page import="java.util.Vector"%>
<%@page import="com.dto.Items_ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <div class="category_name">소파</div>
        <p>전통적인 스타일의 소파든 합리적인 가격의 편안한 소파든, SOFAS의 소파 제품은 모두 편히 쉴 수 있는 아늑한 공간을 선사합니다.
        <br>SOFAS 에서 다양한 소파를 만나보세요.</p><br>
        <hr><br>
        <div class="best_wrap">
        
	        <c:forEach var="items" items="${requestScope.Items_ReviewDto}">
	        <c:if test="${items.items_category == '소파'}" >
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