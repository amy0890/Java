<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/itempage.css?ver=3" type="text/css">
    <link rel="stylesheet" href="css/bestitem.css" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="script/itempage.js" defer></script>
    <script src="script/sofalist.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>
<jsp:include page="header.jsp" />
    <section>
    <c:set var="info" value= "${requestScope.items_infoDto }" />
        <div class="itempage_wrap">
            <div class="item_container">
                <div class="itemimg_container">
                <c:forEach var="items_img" items="${info.items_img.split('//') }"  >
                    <div class="itemimg_box">
                        <img src="img/items/${items_img}" alt="">
                    </div>
                </c:forEach>
                </div>
                <div class="iteminfo_container">
                    <div class="iteminfo_haeder">
                        <span class="iteminfo_haeder_title">제품 설명</span>
                        <span class="iteminfo_haeder_btnicon"><i class="fas fa-angle-down"></i></span>
                    </div>
                    <div class="iteminfo_haeder_content">
                      	${fn:replace(info.items_info2, newLineChar, "<br>")}
                    </div>  
                    <div class="iteminfo_haeder">
                        <span class="iteminfo_haeder_title">소재&관리</span>
                        <span class="iteminfo_haeder_btnicon"><i class="fas fa-angle-down"></i></span>
                    </div>
                    <div class="iteminfo_haeder_content">
                       	${fn:replace(info.items_info3, newLineChar, "<br>")}
                    </div>
                    <div class="iteminfo_haeder">
                        <span class="iteminfo_haeder_title">제품 크기</span>
                        <span class="iteminfo_haeder_btnicon"><i class="fas fa-angle-down"></i></span>
                    </div>
                    <div class="iteminfo_haeder_content">
                       	${fn:replace(info.items_info4, newLineChar, "<br>")}
                    </div>
                </div>
            </div>
            <aside>
                <div class="aside_title">
                    <div class="aside_itemname">${info.items_name }</div>
                    <div class="aside_itemprice">
                        <div class="aside_itemprice_simbol">￦</div>
                        <div class="aside_itemprice_integer"><fmt:formatNumber value="${info.price}" pattern="#,###,###"/></div>
                    </div>
                </div>
                <div class="aside_rating">
                    <div class="aside_star">
                        <c:set var="star" value="${info.items_star_avg }" />
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
                    </div>
                    <div class="aside_reviewcnt">
                        (${info.items_review_cnt })
                    </div>
                </div>
                <div class="iteminfo_summary">
                    <p class="iteminfo_summary_description">
                      	${info.items_info1 }
                    </p>
                </div>
                <form action="PaymentPage.do">
                <div class="aside_quantitybox">
                	<span class="aside_quantity_tag">수량 </span>
                	<span class="aside_btn_plus"><i class="fas fa-plus-circle"></i></span>
                	<input type="text" class="aside_quantity" readonly name="quantity1" value="1">
                	<span class="aside_btn_minus"><i class="fas fa-minus-circle"></i></span>
                </div>
                <div class="aside_btnbox">
                	<input type="hidden" name="items_idx1" value="${info.items_idx }">
                	<input type="hidden" name="items_cnt" value="1">
                    <input type="submit" class="aside_btn_pay" value="구매하기">
                    <div class="aside_btn_cart" onclick="btn_cart(${info.items_idx})"><i class="fas fa-shopping-cart"></i></div>
                </div>
                </form>
                <div class="aside_stockchk">
                    <div class="aside_stockchk_icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="aside_stockchk_text">
                       	배송 여부는 결제 단계에서 확인하실 수 있습니다. 
                    </div>
                </div>
                <div class="aside_stockchk">
                    <div class="aside_stockchk_icon">
                        <i class="fas fa-warehouse"></i>
                    </div>
                    <div class="aside_stockchk_text">
                       	매장 재고 및 재입고 날짜 확인    
                    </div>
                </div>
            </aside>
        </div>

        <div class="review_container">
            <div class="review_header">
                <span class="review_title">상품평</span>
            </div>
            <c:choose>
            	<c:when test="${requestScope.items_Rdto ne null && requestScope.items_Rdto.size() > 0}">
            <c:forEach var="review" items="${requestScope.items_Rdto }">
            <div class="review_box">
                <div class="review_contentbox">
                    <div class="review_star">
                        <c:set var="rev_star" value="${review.review_star }" />
	                        	<c:forEach var="cnt" begin="1" end="5">
	                        		<c:choose>
	                        			<c:when test="${rev_star >= 1 }">
	                        				<i class="fas fa-star"></i>
	                        				<c:set var="rev_star" value="${rev_star - 1 }"/>			 
	                        			</c:when>
	                        			
	                        			<c:when test="${rev_star <= 0 }">
	                        				<i class="far fa-star"></i>	
	                        			</c:when>
	                        		</c:choose>
	                        	</c:forEach>
                    </div>
                    <div class="review_content_flex">
                        <div class="review_content">
                            <div class="review_content_text">
                            	${fn:replace(review.review_content, newLineChar, "<br>")}
                            </div>
                            <c:forEach var="review_img" items="${review.review_img.split('//')}">
                            <div class="review_content_img">
                                <img src="img/review/${review_img }" alt="">
                            </div>
                            </c:forEach>
                        </div>
                        <c:if test="${review.review_img.length() > 0}"> 
                        <div class="review_img_mini">
                            <img alt="" src="img/review/${review.review_img.split('//')[0] }" >
                        </div>
                        </c:if>
                    </div>
                </div>
                <div class="review_infobox">
                    <div class="review_id">
                        ${review.review_write_id }                     
                    </div>
                    <div class="review_date">
                       ${review.review_date }
                    </div>
                </div>
            </div>
            </c:forEach>
            </c:when>
            <c:otherwise>
            	<div class="review_nullbox">
            		상품평이 없습니다.
            	</div>
            </c:otherwise>
            </c:choose>
           
        </div>
        <jsp:include page="bestitem.jsp" />
    </section>
    
    <jsp:include page="footer.jsp" />
</body>
</html>