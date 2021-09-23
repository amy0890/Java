$(document).ready(function () {
    $(".login_area #id").on({
        focus: function () {
            $(".label_id").stop().animate({
                top: 0, left: 50, zoom: 0.75
            }, 500);
            this.select()
        },
        blur: function () {
            if ($(".login_area #id").val() == "") {
                $(".label_id").stop().animate({
                    top: 26, left: 34, zoom: 1
                    // 아이콘 위치로 인해 간격 조정
                }, 500);
            }
        }
    });
    $(".login_area #pw").on({
        focus: function () {
            $(".label_pw").stop().animate({
                top: 0, left: 50, zoom: 0.75
            }, 500);
            this.select()
        },
        blur: function () {
            if ($(".login_area #pw").val() == "") {
                $(".label_pw").stop().animate({
                    top: 26, left: 34, zoom: 1
                }, 500);
            }
        }
    }); 
    
    // 로그인
    $(".login_submit").on({
       	click: function() {
    		var id = $(".login_info input[name=id]");
    		var pw = $(".login_info input[name=pw]");
    		$.ajax({
    			type: "post",
    			url: "AjaxProc.do?pg=login",
    			data: {"id":id.val(), "pw":pw.val()},
    			dataType: "json",
				success:function(args){
					if(args.rtn_lv == 1) {
						alert("관리자에 의해 차단된 계정입니다.");
						blurProcess()
					} else if(args.rtn_lv == 2) {
						alert("탈퇴한 계정입니다.");
						blurProcess()
					} else if(args.rtn > 0) {	// 로그인 정보 일치
						document.login_form.action = "LoginProc.do";
						document.login_form.submit();
					} else {	// 로그인 정보 불일치
						$(".login_info_check").css("display","block");
						$(".login_info_check").text("죄송합니다. 로그인에 실패했습니다.")
						$(".login_info_check").append("<br><span style='color:blue'>아이디(ID)와 비밀번호</span>를");
						$(".login_info_check").append("<span style='color:red'>확인</span>하고 다시 로그인해주세요.");
						blurProcess()
					}					
				},					
				error:function(args){	
					$(".login_info_check").text(args.responseText+" 에러!");
				}
    		});
    	}
    });
});

function blurProcess() {
	$(".login_info input[name=id]").val("");
	$(".login_info input[name=pw]").val("");
    $(".label_id").stop().animate({
        top: 26, left: 34, zoom: 1
    }, 500);
    $(".label_pw").stop().animate({
        top: 26, left: 34, zoom: 1
    }, 500);
}