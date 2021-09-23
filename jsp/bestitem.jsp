<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="item_wrap">
	<div class="category_name">베스트 제품</div>
        <div class="best_wrap">
	        <c:forEach var="items" items="${requestScope.Items_ReviewDto}">
	            <div class="bestitem">
	                <div class="imgbox" onclick="location.href='ItemPage.do?items_idx=${items.items_idx}'">
	                	<c:set var="i" value="${items.items_img.split('//') }" />
	                    <div class="changeimg"><img src="img/items/${i[0]}"></div>
	                    <div class="firstimg"><img src="img/items/${i[1]}"></div> 
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
        </c:forEach>
	</div>
</div>

    