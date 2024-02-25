<jsp:useBean id="dto" scope="request" type="PtBoard.BoardDTO"/>
<%@ page import="PtBoard.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/TfCSS/LetterView.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap" rel="stylesheet">
    <title>편지 보기</title>
</head>
<body>
<%--로고--%>
<nav class="linavbar">
    <div class="linavbar_logo">
        <%--<img src="경로" alt="예시 이미지">--%>
        <i class="lifab fa-accusoft"></i>
        <a href="../TfBottle/MainPage.jsp">1일 1편지</a>
    </div>
    <%--메뉴--%>
    <ul class="linavbar_menu">
        <li><a href="../TfBottle/MainPage.jsp">Home</a></li>
        <%--로그인 상태에 따라--%>
        <% if (session.getAttribute("user_id") == null) { %>
        <li><a href="../TfBottle/Login.jsp">로그인</a></li>
        <% }else { %>
        <li><a href="../TfBottle/Logout.jsp">로그아웃</a></li>
        <% } %>
        <li><a href="../TfBottle/SignUp.jsp">회원가입</a></li>
    </ul>
</nav>
<body>
    <div class="letter">
        <div class="lettertitle">
            <table>
                <tr>
                    <th>${dto.title}</th>
                </tr>
            </table>
        </div>
        <div class="letterwirter">
            <table>
                <tr>
                    <td>from. ${dto.user_id}</td>
                </tr>
            </table>
        </div>
        <div class="lettercontents">
            <table>
                <tr>
                    <td>${dto.contents}</td>
                </tr>
            </table>
        </div>
        <div class="letterdate">
            <table>
            <tr class="letterdate">
                <td>${dto.post_date}</td>
            </tr>
            </table>
        </div>
    </div>
<footer>
    <div class="footer-wrapper">
        <div class="footer-section">
            상호명 : 랜덤편지(RANDOM)<br/>
            대표자 : 구준모<br/>
            사업자등록번호 : 111-22-12345<br/>
            통신판매업번호 : 제1234-부산수영구-1234호<br/>
        </div>
        <div class="footer-section">
            메일 : rnwnsah8686@naver.com<br/>
            사업장 : 부산광역시 부산구 부산동 11, 국비지원 503호<br/>
            전화 : 123-1234-5678<br/>
        </div>
        <div class="footer-section">
            <a href="#">이용약관</a><br/>
            <a href="#">개인정보취급방침</a><br/>
            <a href="#">운영정책</a><br/>
            <a href="#">PartnerCenter</a><br/>
        </div>
        <div class="footer-section">
            호스팅제공 KooJunMo소프웨어<br/>
        </div>
    </div>
    <p class="footerp">Copyright © 2024 랜덤 편지. All right reserved.</p><br/>
</footer>
</body>

</html>




