$(document).ready(function () {
    $(".privacy_info_table input[name=name]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_name");
            // 이름 양식 조건
            if (input_val == "") {
                $(label).text("필수 입력사항입니다.");
            } else if (/\s/g.test(input_val) || /[`~!@#$%^&*()|\\\'\";:\/?]/gi.test(input_val)) {
                $(label).text("공백 문자, 특수 문자는 사용할 수 없습니다.");
            } else {
                $(label).text("");
            }
        }
    });
    $(".privacy_info_table input[name=tel]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_tel");
            // 전화번호 양식 조건
            if (input_val == "") {
                $(label).text("필수 입력사항입니다.");
            } else if (!/^\d{10,11}$/.test(input_val) || !/^01[01679]/.test(input_val)) {
                $(label).text("휴대폰 번호가 올바르지 않습니다. ( - 를 제외한 10~11자)");
            } else {
                $(label).text("");
            }
        }
    });
    $(".privacy_info_table input[name=email]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_email");
            // 이메일 양식 조건
            if (input_val == "") {
                $(label).text("필수 입력사항입니다.");
            } else if (!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(input_val)) {
                $(label).text("이메일 형식이 올바르지 않습니다.");
            } else {
                $(label).text("");
            }
        }
    });
    $(".addr_info_table input[name=detailAddress]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_detailAddress");
            // 상세주소 양식 조건
            if (input_val == "") {
                $(label).text("필수 입력사항입니다.");
            } else if (/[//]/gi.test(input_val)) {
                $(label).text("// 문자는 사용할 수 없습니다.");
            } else {
                $(label).text("");
            }
        }
    });
    $(".pw_info_table input[name=new_pw]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_new_pw");
            // 새 비밀번호 양식 조건
            if (input_val == "") {
                $(label).text("");
            } else if (!/^[a-zA-Z0-9]{6,18}$/.test(input_val)) {
                $(label).text("비밀번호는 영문/숫자 조합 6~18자리여야 합니다.");
            } else if (input_val.search(/[0-9]/g) < 0 || input_val.search(/[a-z]/ig) < 0) {
                $(label).text("비밀번호는 영문자와 숫자를 혼용하여야 합니다.");
            } else {
                $(label).text("");
            }
            if (input_val != "") {
                if (input_val == $("input[name=new_pw_chk]").val()) {
                    $(".label_new_pw_chk").css("color", "green");
                    $(".label_new_pw_chk").text("비밀번호가 일치합니다.");
                } else {
                    $(".label_new_pw_chk").css("color", "red");
                    $(".label_new_pw_chk").text("비밀번호가 일치하지 않습니다.");
                }
            } else {
                if ($("input[name=new_pw_chk]").val() == "") {
                    $(".label_new_pw_chk").text("");
                } else {
                    $(".label_new_pw_chk").css("color", "red");
                    $(".label_new_pw_chk").text("비밀번호가 일치하지 않습니다.");
                }
            }
        }
    });
    
    $(".pw_info_table input[name=new_pw_chk]").on({
        focus: function () { this.select() },
        blur, keyup: function () {
            var input_val = $(this).val();
            var label = $(".label_new_pw_chk");
            // 새 비밀번호 확인 양식 조건
            if ($("input[name=new_pw]").val() == "") {
                if (input_val != "") {
                    $(label).css("color", "red");
                    $(label).text("비밀번호가 일치하지 않습니다.");
                } else {
                    $(label).text("");
                }
            } else {
                if (input_val != $("input[name=new_pw]").val()) {
                    $(label).css("color", "red");
                    $(label).text("비밀번호가 일치하지 않습니다.");
                } else {
                    $(label).css("color", "green");
                    $(label).text("비밀번호가 일치합니다.");
                }
            }
        }
    });

    $(".update_accountinfo_table .pw_info span").on({
        click: function () {
            $(this).parent().next().stop().slideToggle(250);	// 
            if ($(this).text() == "취소") {
                $(this).text("수정").append("<i class='fas fa-angle-down'></i>");
                $(".pw_info_table input").val("");
                $(".pw_info_table .label").text("");
            } else {
                $(this).text("취소").append("<i class='fas fa-angle-up'></i>");
            }
        }
    });
    
    $(".member_info_update_submit").on({    
    	click: function() {
    		var pw = $("input[name=pw]");
    		var pw_label = $(".label_pw");
    		var pw_success_chk = false;
        	$.ajax({
        		type: "post",
    			url: "AjaxProc.do?pg=pw_check",
    			data: {"idx":$("input[name=idx]").val(), "pw":pw.val()},
    			dataType: "json",
				success:function(args){
					// 비밀번호 미변경 시
					if(pw.val() == "") {
						if(new_pw.val() == "" && new_pw_chk.val() == "") {
				   	        new_pw_success_chk = true;
				   	        pw_success_chk = true;
				   	        update_info_submit();
						} else {
							$(pw).focus();
						}
					}
					// 로그인 정보 불일치
					else if(args.rtn == 0) {	
						pw_success_chk = false;
						$(pw).focus();
						$(pw).blur();
						$(pw_label).text("비밀번호가 일치하지 않습니다.");
					} 
					// 로그인 정보 일치
					else {	
						$(pw_label).text("");
						pw_success_chk = true;
						update_info_submit();
					}					
				},					
				error:function(args){	
					$(pw_label).text(args.responseText+" 에러!");
				}
        	});
        	
    		// password
    	    var new_pw = $(".pw_info_table input[name=new_pw]");
    	    var new_pw_chk = $(".pw_info_table input[name=new_pw_chk]");
    	    var new_pw_success_chk = false;
    	    if (/^[a-zA-Z0-9]{6,18}$/.test(new_pw.val()) && new_pw.val().search(/[0-9]/g) != -1 && new_pw.val().search(/[a-z]/ig) != -1) {
    	        // 비밀번호 조건이 만족할때
    	        if(new_pw.val() == new_pw_chk.val()) {
    	            new_pw_success_chk = true;
    	        } else if(new_pw.val() != new_pw_chk.val()){
    	        	$(new_pw_chk).focus();
    	        } else {
    	            $(new_pw_chk).focus();
    	        }
    	    } else {
    	    	$(new_pw).focus();    	    		
    	    }
    	    
    		// detailAddress
    	    var detailAddress = $(".addr_info_table input[name=detailAddress]");
    	    var detailAddress_success_chk = false;
    	    if (detailAddress.val() == "" || /[//]/gi.test(detailAddress.val())) {
    	        $(detailAddress).focus();
    	    } else {
    	        detailAddress_success_chk = true;
    	    }

    	    // email
    	    var email = $(".privacy_info_table input[name=email]");
    	    var email_success_chk = false;
    	    if (email.val() == "" || !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email.val())) {
    	        $(email).focus();
    	    } else {
    	        email_success_chk = true;
    	    }

    	    // tel
    	    var tel = $(".privacy_info_table input[name=tel]");
    	    var tel_success_chk = false;
    	    if (tel.val() == "" || !/^\d{10,11}$/.test(tel.val())) {
    	        $(tel).focus();
    	    } else {
    	        tel_success_chk = true;
    	    }

    	    // name
    	    var name = $(".privacy_info_table input[name=name]");
    	    var name_success_chk = false;
    	    if (name.val() == "" || /\s/g.test(name.val()) || /[`~!@#$%^&*()|\\\'\";:\/?]/gi.test(name.val())) {
    	        $(name).focus();
    	    } else {
    	        name_success_chk = true;
    	    }  
    	    
    	    // submit function
    	    function update_info_submit() {
    	    	if (pw_success_chk && new_pw_success_chk && detailAddress_success_chk 
    	    			&& email_success_chk && tel_success_chk && name_success_chk) {
    	    		document.update_info_form.action = "MyPage.do?pg=updateAccount_proc";
    	    		document.update_info_form.submit();
    	    	}
    	    }
    	}
    });
    
    $(".pw_info_table input[name=pw]").on({
    	focus: function() {
    		$(".label_pw").text("");
    	}
    });
});


// 우편번호 찾기
function findPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행 코드.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
        }
    }).open();
}
