<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>상품 관리</p><br>
<form action="GoodsAddProc.do" method="post" enctype="multipart/form-data">
	<table class="type09">
        <tr>
            <td>제품명</td>
            <td><input type="text" name="items_name" placeholder="제품명을 입력하세요."></td>
        </tr>
        <tr>
            <td>카테고리</td>
            <td>
            	<select name="items_category">
            		<option value="소파">소파</option>
            		<option value="악세서리">악세서리</option>
            		<option value="스툴">스툴</option>
            	</select>
            </td>
        </tr>
        <tr>
            <td>제품가격</td>
            <td><input type="number" name="price" placeholder="제품 가격을 입력하세요."></td>
        </tr>
        <tr>
            <td>재고수량</td>
            <td><input type="number" name="stock" placeholder="재고 수량을 입력하세요."></td>
        </tr>                      
        <tr>
            <td>제품설명</td>
            <td><textarea name="items_info1" placeholder="제품 설명을 입력하세요." ></textarea></td>
        </tr>
        <tr>
            <td>상세설명</td>
            <td><textarea name="items_info2" placeholder="소재를 입력하세요."></textarea></td>
        </tr>
        <tr>
            <td>소재/관리</td>
            <td><textarea name="items_info3" placeholder="상세 설명을 입력하세요."></textarea></td>
        </tr>
        <tr>
            <td>제품크기</td>
            <td><textarea name="items_info4" placeholder="제품 크기를 입력하세요."></textarea></td>
        </tr>
        <tr>	
            <td>이미지</td>
            <td class="items_img_inputbox">
            	<input type="file" name="items_img0">
            	<input type="button" value="추가" class="file_add_btn"> 
            	<input type="button" value="삭제" class="file_del_btn"> 
            </td>
        </tr>
    </table>
    <div class="addbtn_box">
     	<input type="hidden" value="0" name="file_num">
     	<input type="submit" value="상품 등록" class="add_btn">
    </div>
</form>
                    