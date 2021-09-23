$(document).ready(function() {
	$(".withdrawal_submit").on({
		click: function() {
			var pw = $("form[name=withdrawal_form] input[name=pw]");
			var idx = $("form[name=withdrawal_form] input[name=idx]");
    		$.ajax({
    			type: "post",
    			url: "AjaxProc.do?pg=pw_check",
    			data: {"idx":idx.val(),"pw":pw.val()},
    			dataType: "json",
				success:function(args){
					// 비밀번호 불일치
					if(args.rtn == 0) {	
						$(pw).focus();
						$(pw).blur();
						$(".withdrawal_pw_check").text("비밀번호가 일치하지 않습니다.");
					} 
					// 비밀번호 일치
					else {	
						document.withdrawal_form.action="WithdrawalProc.do";
						document.withdrawal_form.submit();
					}	
				},					
				error:function(args){	
					$(".withdrawal_pw_check").text(args.responseText+" 에러!");
				}
    		});
		}
	});
	
    $(".withdrawal_form input[name=pw]").on({
    	focus: function() {
    		$(".withdrawal_pw_check").text("");
    	}
    });
});