<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <p>상품 리뷰</p><br>
<form action="ReviewWriteProc.do" method="post" enctype="multipart/form-data">
	<table class="type09">
	    <tr>
	        <td>제품명</td>
	        <td>${param.items_name}</td>
	    </tr>
	    <tr>
	         <td>평점</td>
	        <td>
	        	<span class="pointer rev_star1"><i class="fas fa-star"></i></span>
	        	<span class="pointer rev_star2"><i class="far fa-star"></i></span>
	        	<span class="pointer rev_star3"><i class="far fa-star"></i></span>
	        	<span class="pointer rev_star4"><i class="far fa-star"></i></span>
	        	<span class="pointer rev_star5"><i class="far fa-star"></i></span>
	        	<input type="hidden" name="review_star" value="1">
	        <td>
	    </tr>
	    <tr>
	        <td colspan="2"><textarea placeholder="상품평을 입력하세요." name="review_content"></textarea></td>
	    </tr>
	    <tr>	
		    <td>사진</td>
		    <td class="items_img_inputbox">
		    	<input type="file" name="review_img0">
		    	<input type="button" value="추가" class="file_add_btn"> 
		    	<input type="button" value="삭제" class="file_del_btn"> 
		    </td>
		</tr>
	</table>
	<div class="addbtn_box">
		<input type="hidden" value="${param.items_idx }" name="items_idx">
		<input type="hidden" value="0" name="file_num">
	    <input type="submit" class="review_save" value="등록">
	</div>
</form>