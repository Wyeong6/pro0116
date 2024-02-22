<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
</head>
<body>
<jsp:include page="../link/Link.jsp"></jsp:include>
<%= request.getAttribute("LoginErrMsg") == null ?
        "" : request.getAttribute("LoginErrMsg") %>
<%
    // session 영역에 사용자 아이디가 저장되어 있는지 확인
    if (session.getAttribute("User") == null) {
%>
<script>
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!form.user_pw.value) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
    }
</script>
<form action="/pro/Login.do" method="post" name="loginFrm"
      onsubmit="return validateForm(this);">
    아이디 : <input type="text" name="user_id" /><br/>
    패스워드 : <input type="password" name="user_pw"/><br/>
    <input type="submit" value="로그인"/>
</form>
<%
} else {
%>
<%-- session 영역에 사용자 아이디가 저장되어 있는 경우 실행 --%>
<%= session.getAttribute("name") %> 회원님, 로그인하셨습니다.<br />
<a href="Logout.jsp">[로그아웃]</a>
<%
    }
%>
</body>
</html>
