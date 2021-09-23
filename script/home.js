$(function(){
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			$('#toTop').fadeIn(500);
		} else {
			$('#toTop').fadeOut('slow');
		}
	});
	
	$('#toTop').click(function (e) {
		e.preventDefault();
		$('html, body').animate({scrollTop: 0}, 200);
    });
	
	$(".twitter").click(function(){
		location.href = "https://twitter.com/";
	});
	$(".facebook").click(function(){
		location.href = "https://www.facebook.com/login/";
	});
	$(".instagram").click(function(){
		location.href = "https://www.instagram.com/accounts/login/";
	});
	$(".youtube").click(function(){
		location.href = "https://www.youtube.com/";
	});
});

