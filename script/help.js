$(function(){
    $(".faq_table td").click(function(){
        $(this).children().stop().slideToggle(250);
    });
    
});  

function qna_repl_delete_proc(qna_repl_idx, qna_idx ) {
	var del_con = confirm("삭제하시겠습니까?");
	if(del_con) {
		location.href='HelpPage.do?pg=qna_repl_delete_proc&qna_repl_idx=' + qna_repl_idx + '&qna_idx=' + qna_idx;		
	}
}