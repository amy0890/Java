$(document).ready(function() {
	total_price();
	var num = 0;
    $(".plus_btn").on({
    	click: function() {
	        num = $(this).parent().prev().children(".item_count").val();
	        num = parseInt(num) + 1;
	        if(num > 9) {
	        	num = 9;
	        }
	        $(this).parent().parent().next().children(".getPrice").text("￦ "+($(this).parent().parent().next().children(".price").val()*num).toString().replace(/\B(?=(\d{3})+(?!\d))/g,","));
	        $(this).parent().parent().next().children(".getPrice_val").val($(this).parent().parent().next().children(".price").val()*num);
	        
	        total_price();
	        $(this).parent().prev().children(".item_count").val(num);
	        
	        btn_proc( $(this).parent().prev().children(".item_idx").val(), $(this).parent().prev().children(".item_count").val());
    	}
    });   
    $(".minus_btn").on({
    	click: function() {
	        num = $(this).parent().prev().children(".item_count").val();
	        num = parseInt(num) - 1;
	        if(num < 1) {
	        	num = 1;
	        }        
	        $(this).parent().parent().next().children(".getPrice").text("￦ "+($(this).parent().parent().next().children(".price").val()*num).toString().replace(/\B(?=(\d{3})+(?!\d))/g,","));
	        $(this).parent().parent().next().children(".getPrice_val").val($(this).parent().parent().next().children(".price").val()*num);
	        
	        total_price();
	        $(this).parent().prev().children(".item_count").val(num);
	        
	        btn_proc($(this).parent().prev().children(".item_idx").val(), $(this).parent().prev().children(".item_count").val());
    	}
    });
        
    function total_price() {
    	let sum = 0; 
    	$('.getPrice_val').each(function(){
    		// type으로 시작하는 input을 순차적으로 loop 
    		if(!isNaN($(this).val())){ 
    			// CASE 값에 문자가 없는 경우 (숫자인 경우만 합산) 
    			sum += parseInt($(this).val());
    		}
    	});
		// 합산한 값을 name="sum"인 input에 넣어줌
		$(".totalPrice").text("￦ "+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,","));
    }

});

function btn_proc(itemIdx, itemCnt) {
	$.ajax({
		type: "post",
		url: "AjaxProc.do?pg=cart_cnt",
		data: {"idx":itemIdx, "cnt":itemCnt},	
		dataType: "json",
		success:function(args){
		},					
		error:function(args){	
		}
	});
}

function delete_cart(this_, idx) {
	$(this_).parent().parent().parent().parent().remove();
	$.ajax({
		type: "post",
		url: "AjaxProc.do?pg=delete_cart",
		data: "item_idx="+idx,
		dataType: "json",
		success:function(args){
		},					
		error:function(args){	
		}
	});
}

