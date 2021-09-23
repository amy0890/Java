<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<p>Q&A</p>
<br>
<form action="HelpPage.do" method="post">
	<input type="hidden" name="pg" value="qna_write_proc">
	<table class="type09">
		<tr>
			<td>구분</td>
			<td><select name="qna_category">
					<option value="상품문의">상품문의</option>
					<option value="취소문의">취소문의</option>
					<option value="배송문의">배송문의</option>
			</select>
			<td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" placeholder="제목을 입력하세요." name="qna_title"></td>
		</tr>

		<tr>
			<td colspan="2"><textarea placeholder="문의할 내용을 입력하세요."
					name="qna_content"></textarea></td>
		</tr>
	</table>
	<div class="btn_box">
		<input type="submit" value="등록" class="answer_qna">
	</div>
</form>