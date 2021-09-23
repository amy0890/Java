$(function() {
    $(".iteminfo_haeder").click(function() {
        $(this).next(".iteminfo_haeder_content").stop().slideToggle(250);
    });
    $(".review_contentbox").click(function() {
        var open = $(this).children().children(".review_content").height();
            var el = $(this).children().children(".review_content"),
                curHeight = el.height(),
                autoHeight = el.css('height', 'auto').height();
            
            if(autoHeight < 60) {
                autoHeight = 60;
            }
            if( open == 60){
                el.height(curHeight).animate({height: autoHeight}, 100);
                $(this).children().children(".review_img_mini").css('display', 'none');
            }else{
                el.animate({height: '60px'}, 100);
                $(this).children().children(".review_img_mini").css('display', 'block');
            }
    });
    
    $(".aside_rating").click(function() {
    	var offset = $(".review_container").offset();
    	$('html, body').animate({scrollTop : offset.top}, 400);    	
    });
    
    $(".aside_btn_plus").on(
    	"click",
    	function() {
    		var quantity = $(".aside_quantity");
    		quantity.val(Number(quantity.val()) + 1);
    		if(quantity.val() > 9) {
    			quantity.val(9);
    		}
    	}
    );
    $(".aside_btn_minus").on(
    		"click",
    		function() {
    			var quantity = $(".aside_quantity");
    			quantity.val(Number(quantity.val()) - 1);
    			if(quantity.val() < 1) {
    				quantity.val(1);
    			}
    		}
    );
});

function btn_cart(idx) {
	$.ajax({
		type: "post",
		url: "AjaxProc.do?pg=cookie_proc",
		data: "item_idx="+idx,
		dataType: "json",
		success:function(args){
			alert("장바구니에 담겼습니다.");
		},					
		error:function(args){	
		}
	});
}