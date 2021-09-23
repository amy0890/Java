$(function(){
    $(".faq_table td").click(function(){
        $(this).children().stop().slideToggle(250);
    });
    
});  