<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="/TfCSS/Link.CSS">
</head>
<body class="linkbody">
<header>
  <table border="0" width="100%">
    <tr>
      <td align="center">
        <%-- 홈으로 가는 링크 --%>
        <a href="../TfBottle/MainPage.jsp">home</a>
        <%-- 로그인 여부에 따른 메뉴 변화 --%>
        <% if (session.getAttribute("User") == null) { %>
        <a href="../TfBottle/Login.jsp">로그인</a><%-- 로그아웃 상태면 [로그인]링크를 출력 --%>
        <% }else { %>
        <a href="../TfBottle/Logout.jsp">로그아웃</a><%-- 로그인 상태면 [로그아웃]링크를 출력 --%>
        <% } %>
          <%-- 회원가입으로 가는 링크 --%>
        <a href="../TfBottle/SignUp.jsp">회원가입</a>
      </td>
    </tr>
  </table>
</header>
</body>
</html>
