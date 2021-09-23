$(function() {
	var idx = 0;
	$(document).on(
		"click",
		"input.file_add_btn",
		function() {
			idx++;
			$("input[name=file_num]").val(idx);
			var input = $('<tr><td>이미지</td><td class="items_img_inputbox"><input type="file" name="items_img'+ idx +'"></td></tr>');
			$(this).parent().parent().parent().append(input);
		}
	);
	$(document).on(
		"click",
		"input.file_del_btn",
		function() {
			if(idx > 0) {
				$('input[name=items_img'+ idx +']').parent().parent().remove();
				idx--;				
				$("input[name=file_num]").val(idx);
			}
		}
	);
	$(document).on(
			"click",
			"input.img_del_btn",
			function() {
				$(this).parent().parent().remove();
			}
	);
});

function memberblock_proc(idx, lv) {
	var block_con = confirm("차단하시겠습니까?");
	if(block_con) {
		if(lv >= 10) {
			alert("관리자는 차단할 수 없습니다.");
		}else {
			location.href='AdminPage.do?pg=memberblock_proc&idx='+idx;			
		}
	}
}

function goodsdelete_proc(idx) {
	var del_con = confirm("삭제하시겠습니까?");
	if(del_con) {
		location.href='AdminPage.do?pg=goodsdelete_proc&idx='+idx;			
	}
}