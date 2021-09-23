$(function(){  
	$(".rev_star1").on(
			"click",
			function() {
				rev_star(1);
			}
	);
	$(".rev_star2").on(
			"click",
			function() {
				rev_star(2);
			}
	);
	$(".rev_star3").on(
			"click",
			function() {
				rev_star(3);
			}
	);
	$(".rev_star4").on(
			"click",
			function() {
				rev_star(4);
			}
	);
	$(".rev_star5").on(
			"click",
			function() {
				rev_star(5);
			}
	);
	
	function rev_star(star) {
		for (var i = 1; i <= 5; i++) {
			if(i <= star) {
				$(".rev_star" + i).html('<i class="fas fa-star"></i>');
			}else {
				$(".rev_star" + i).html('<i class="far fa-star"></i>');				
			}
		}
		$("input[name=review_star]").val(star);
	}
	
	
	var idx = 0;
	$(document).on(
		"click",
		"input.file_add_btn",
		function() {
			idx++;
			$("input[name=file_num]").val(idx);
			var input = $('<tr><td>이미지</td><td class="items_img_inputbox"><input type="file" name="review_img'+ idx +'"></td></tr>');
			$(this).parent().parent().parent().append(input);
		}
	);
	$(document).on(
		"click",
		"input.file_del_btn",
		function() {
			if(idx > 0) {
				$('input[name=review_img'+ idx +']').parent().parent().remove();
				idx--;				
				$("input[name=file_num]").val(idx);
			}
		}
	);
}); 
