
$(document).ready(function(){ 
    $("#btnAddr").on("click",function(){
        new daum.Postcode({ 
            oncomplete: function(data) { 
                
                var fullAddr = '';
                var extraAddr = '';
                
                if (data.userSelectedType === 'R') { 
                    fullAddr = data.roadAddress; 
                } else { 
                    fullAddr = data.jibunAddress; 
                } 
                
                if(data.userSelectedType === 'R'){      
                    if(data.bname !== ''){ 
                        extraAddr += data.bname; 
                    }           
                    if(data.buildingName !== ''){ 
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
                    } 
                
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
                } 
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다. 
                document.getElementById('zip').value = data.zonecode; //5자리 우편번호
                document.getElementById('addr1').value = fullAddr; // 커서를 상세주소로 이동한다. 
                document.getElementById('addr2').focus(); 
            } 
        }).open(); 
    });
    
	$("#all_ck").click(function(){
		var chk = $(this).is(":checked");
		
		if(chk) {
		    $(".sub_ck").prop('checked', true); 
		
		}else{ 
		    $(".sub_ck").prop('checked', false); 
		}
   });

	$(".sub_ck").click(function(){
		var chk = $(this).is(":checked");

		if(chk) {
			$("#all_ck").prop('checked',false);
		}else{ 
			$("#all_ck").prop('checked', false); 
		}
	});
	
	$("a").click(function(){
		$(this).parent().parent().next().stop().slideToggle(250);
	});
});


function same_info(){ 
	var chk = document.getElementsByName("check_memberInfo")[0].checked;
	var name = document.getElementsByClassName("order_name")[0].value;
	var phone = document.getElementsByClassName("order_phone")[0].value;
	var address = document.getElementsByClassName("order_address")[0].value;
	var addr = address.split("//");
 
	if(chk==""){
		document.getElementsByName("order_name")[0].value = "";
		document.getElementsByName("order_phone")[0].value = "";
		document.getElementsByName("addr1")[0].value = "";
		document.getElementsByName("addr2")[0].value = "";
		document.getElementsByName("addr3")[0].value = "";
	}else{
		document.getElementsByName("order_name")[0].value = name;
		document.getElementsByName("order_phone")[0].value = phone;
		document.getElementsByName("addr1")[0].value = addr[0];
		document.getElementsByName("addr2")[0].value = addr[1];
		document.getElementsByName("addr3")[0].value = addr[2];
	}
}
   
function keyup_mh(){
	document.getElementsByClassName("name1_err")[0].value = "";
}
       
       
function submit_check(){
	var chk1 = document.getElementsByClassName("essential")[0].checked;
	var chk2 = document.getElementsByClassName("essential")[1].checked;
	
	var name1 = document.getElementsByClassName("order_name")[0].value;
	var name2 = document.getElementsByName("order_name")[0].value;
	
	var phone1 = document.getElementsByClassName("order_phone")[0].value;
	var phone2 = document.getElementsByName("order_phone")[0].value;
	
	var email = document.getElementsByName("order_email")[0].value;
	
	var addr1 = document.getElementsByName("addr1")[0].value;
	var addr2 = document.getElementsByName("addr2")[0].value;
	
	
	// 약관동의 체크
	if(chk1==""){
		alert("개인정보 수집 및 이용약관에 동의해주세요");
		return false;
	}
	else if(chk2==""){
		alert("구매조건 확인 및 결제진행 약관에 동의해주세요");
		return false;     
	
	
	}
	
	// 이름   
	if(name1 == ""){
		alert("주문자 성함을 기재하세요");
		document.getElementsByClassName("order_name")[0].focus();
		
		return false;
	}
	
	else if(name2 == ""){
		alert("수령인 성함을 기재하세요")
		document.getElementsByName("order_name")[0].focus();
		return false;
	}
	
	// 전화번호  
	else if(phone1 == ""){
		alert("주문자 전화번호를 기재하세요");
		document.getElementsByClassName("order_phone")[0].focus();
		return false;
		
	}
	else if(phone2 == ""){
		alert("수령인 휴대폰 번호를 입력하셈");
		document.getElementsByName("order_phone")[0].focus();
		return false;
	}
	
	//email
	else if(email == ""){
		alert("이메일을 입력하셈");
		document.getElementsByName("order_email")[0].focus();
		return false;
	}
	else if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email)){
		alert("제대로된 이메일 형식이 아님 ");
  		document.getElementsByName("order_email")[0].focus();
		return false;
	}
	
	// address 
	else if(addr1 == "" || addr2 == ""){
		alert("우편번호와 주소를 입력해주세요");
		document.getElementsByName("addr1")[0].focus();
		return false;
	}else{
		return true;
	}

}
        