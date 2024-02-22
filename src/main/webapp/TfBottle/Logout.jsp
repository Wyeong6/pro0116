<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // invalidate() : 세션 자체를 무효화 하는 메서드(session 영역의 모든 속성을 한거번에 삭제)
    session.invalidate();

    // 속성 삭제 후 페이지 이동
    response.sendRedirect("Login.jsp");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>

</body>
</html>
