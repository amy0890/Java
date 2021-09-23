<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/common.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/footer.css" type="text/css">
    <link rel="stylesheet" href="css/mypage.css" type="text/css">
    <link rel="stylesheet" href="css/faq.css" type="text/css">
    <link rel="stylesheet" href="css/table.css" type="text/css">
    <link rel="stylesheet" href="css/qnawrite.css" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="script/help.js" defer></script>
    <title>SOFAS KOREA</title>
</head>
<body>

<jsp:include page="header.jsp" />
<div class="mypage_wrap">
        <div class="mypage_fixed">
            <div class="fixed_top">
                <div class="mypage_hi">고객지원</div>
                <div class="mypage_point">
                    <div>(주) SOFAS KOREA</div>
                </div>
            </div>
            <div class="fixed_bottom">
                <ul>
                    <li><a href="HelpPage.do?pg=notice">공지사항</a></li>
                    <li><a href="HelpPage.do?pg=faq">FAQ</a></li>
                    <li><a href="HelpPage.do?pg=qna">Q&A</a></li>
                </ul>
            </div>
        </div>

        <div>
            <div class="mypage_welcome">
                 <span>SOFAS</span> 고객지원센터 <br>
                 <p>도움이 필요하신가요?
                 궁금한 사항은 저희가 해결해드릴게요.</p>
            </div>
            <div class="mypage_changed">
                <div class="page_div">
                <!--여기서 부터 페이지에 맞게 갈아끼우기-->  
                <c:set var="pg" value="${param.pg}" />
                <c:choose>
                	<c:when test="${pg == null || pg == 'notice'}"> 
                    	<jsp:include page="help_notice.jsp" />    
                	</c:when>
                	<c:when test="${pg == 'faq'}"> 
	                	<jsp:include page="help_faq.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'qna'}"> 
	       				<jsp:include page="help_qna.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'notice_write'}"> 
	                	<jsp:include page="help_notice_write.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'notice_show'}"> 
	                	<jsp:include page="help_notice_show.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'qna_write'}"> 
	                	<jsp:include page="help_qna_write.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'qna_show'}"> 
	                	<jsp:include page="help_qna_show.jsp" />   
                	</c:when>
                	<c:when test="${pg == 'qna_update'}"> 
	                	<jsp:include page="help_qna_update.jsp" />    
                	</c:when>
                	<c:when test="${pg == 'notice_update'}"> 
	                	<jsp:include page="help_notice_update.jsp" />     
                	</c:when>
                	<c:when test="${pg == 'notice_update_proc'}"> 
	                	<jsp:include page="help_notice_show.jsp" />     
                    </c:when>
                	<c:when test="${pg == 'qna_repl_update'}"> 
	                	<jsp:include page="help_qna_repl_update.jsp" />     
                    </c:when>
                </c:choose>
         
            
                <!--여기까지 페이지에 맞게 갈아끼우기-->
            </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>