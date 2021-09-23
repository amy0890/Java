<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/sofalist.css" type="text/css">
    <script src="script/sofalist.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>
  <jsp:include page="header.jsp" />
    <div class="item_wrap">
        <div class="category_name">소파 액세서리</div>
        <p>
        	SOFAS 소파는 편안하고, 실용적이며, 아름다운 디자인을 자랑합니다. 또 소파의 활용도를 높일 수 있는 폭넓은 소파 액세서리를 갖추고 있죠.<br>
			목을 받쳐주는 머리받침과 같은 추가형 제품이 있는가 하면 액세서리 정리용품과 푹신한 쿠션 같이 모든 SOFAS 소파 제품에 활용할 수 있는 아이템도 있답니다.
		</p><br>
        <hr><br>
        <div class="best_wrap">
	        <c:forEach var="items" items="${requestScope.Items_ReviewDto}">
	        <c:if test="${items.items_category == '악세서리'}" >
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