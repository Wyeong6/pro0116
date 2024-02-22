<%--
  Created by IntelliJ IDEA.
  User: qudgn
  Date: 2024-02-19
  Time: 오후 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Title</title>
    <style>
        .container {
            padding: 20px;
            background-color: #f2f2f2;
        }

        h2 {
            margin-bottom: 20px;
        }

        .form-horizontal {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button.findbtn {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button.findbtn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>아이디 찾기</h2>
    <form class="form-horizontal" role="form" method="POST" action="/01/find.do">
        <label for="name">이름 :</label>
        <input type="text" name="name" class="form-control" id="name" placeholder="이름" required autofocus></br>


        <label for="email">이메일:</label>
        <input type="text" name="email" class="form-control" id="email" placeholder="이메일" required >
    <button type="submit" class="findbtn">찾기</button>
    </form>
</div>
<h1>아이디 결과</h1>
<p>결과 : <%= request.getAttribute("message") %></p></br>

<%--<div class="container">--%>
<%--    <h2>비밀번호 찾기</h2>--%>
<%--    <form class="form-horizontal" role="form" method="post">--%>
<%--        <h2>비밀번호 찾기</h2>--%>
<%--        <label for="username">아이디:</label>--%>
<%--        <input type="text" id="username" name="username" required>--%>
<%--        <label for="findemai2">이메일:</label>--%>
<%--        <input type="email" id="findemai2" name="findemai2" required>--%>
<%--        <button type="submit">비밀번호 찾기</button>--%>
<%--    </form>--%>
<%--</div>--%>
</body>
</html>
