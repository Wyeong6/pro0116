<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>

<head>
    <%--부트스트랩 추가--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/TfCSS/MainPage.css">
    <title>메인 페이지</title>
</head>
<body>
    <jsp:include page="../link/Link.jsp"></jsp:include>


    <div class="mainslide">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02" checked>
        <input type="radio" name="slide" id="slide03" checked>

        <div class="slidewrap">
            <ul class="slidelist">
                <li>
                    <a>
                        <label for="slide03" class="left"></label>
                        <img src="/img/slidetest1.png">
                        <label for="slide02" class="right"></label>

                    </a>
                </li>
                <li>
                    <a>
                        <label for="slide01" class="left"></label>
                        <img src="/img/slidetest2.png">
                        <label for="slide03" class="right"></label>
                    </a>
                </li>
                <li>
                    <a>
                        <label for="slide02" class="left"></label>
                        <img src="/img/slidetest3.png">
                        <label for="slide01" class="right"></label>
                    </a>
                </li>
                <div class="slide-control">
                    <div class="control01">
                        <label for="slide03" class="left"></label>
                        <label for="slide02" class="right"></label>
                    </div>
                    <div class="control02">
                        <label for="slide01" class="left"></label>
                        <label for="slide03" class="right"></label>
                    </div>
                    <div class="control03">
                        <label for="slide02" class="left"></label>
                        <label for="slide01" class="right"></label>
                    </div>
                </div>
            </ul>
        </div>
    </div>





    <%
        boolean canReceiveLetter = true; //캔 리시브 레터 (편지를읽을수있음)변수선언 값은 true
        Cookie[] cookies = request.getCookies(); // 쿠키 배열을 생성함 이름은 cookies로 생성된 쿠키들을 전부 배열에담음
        if (cookies != null) {  //if 쿠키가 있으면 (널이아니면)
            for (Cookie cookie : cookies) { //for문으로 cookie에 cookies를 하나씩 담는다
                if (cookie.getName().equals("receiveCooldown")) { //담는와중에 쿠키의 이름이 "reciveCooldown" 인 쿠키가 나왔을경우!
                    canReceiveLetter = false; // 캔 리시브 레터 (편지읽을수있는) 변수의값이 false가된다
                    break; // 즉 reciveCooldown 이라는 쿠키를 찾을때까지 계속 무한반복(for문)이 돈다
                }
            }
        }
    %>
    <script>
        function createCookie(){
            // 쿠키 생성
            var date = new Date();
            date.setTime(date.getTime() + (1 * 60 * 60 * 1000)); // 1시간
            var expires = "expires=" + date.toUTCString();
            document.cookie = "receiveCooldown=true; " + expires + "; path=/";
        } // 클릭을했을때 "reciveCooldown"이라는 이름의 쿠키를 만드는 함수(자바스크립트)
    </script>



    <div class="button-container">
        <div class="birtstrike">
        <form action="Write.jsp" method="post">
            <button class="birdbutton" type="submit" name="action" value="login">
                편지쓰기
            </button>
        </form>
        </div>
         <%--쿠키를 이용한 편지 받기 버튼--%>
        <% if (canReceiveLetter) { %>
        <form action="/mvcboard/ViewController.do" method="post">
                <button class="picbutton" type="submit" name="action" value="receive"
            onclick="createCookie()">편지받기</button>
        </form>
        <% } else { %>
        <button class="picbutton" type="submit" onclick="alert('편지는 1시간마다 한 번씩 받을 수 있습니다')">편지받기</button>
        <% } %>

        </button>
        <form action="/mvcboard/list.do" method="get">
            <button type="submit" name="action" value="login">편지목록</button>
        </form>
    </div>
</body>
</html>