<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <style>
        /* 폼 요소 스타일 */
        form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="checkbox"],
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        /* 링크 스타일 */
        .join,
        .searchIdAndPwd {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #4caf50;
        }
    </style>
    <script>
        function sendMember() {
            var name = document.getElementById("name").value;
            var id = document.getElementById("id").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var country = document.getElementById("country").value;
            var email = document.getElementById("email").value;

            if (!name) return alert("이름을 입력해주세요");
            if (!id) return alert("아이디를 입력해주세요");
            if (!password) return alert("비밀번호를 입력해주세요");
            if (!confirmPassword) return alert("비밀번호를 입력해주세요");
            if (password !== confirmPassword) return alert("비밀번호가 일치하지않습니다.");
            if (!country) return alert("나라를 입력해주세요");
            if (!email) {
                return alert("이메일을 입력해주세요");
            }else {
                frmMember.method = "post";
                frmMember.action = "/01/SignUp.do"
                frmMember.submit();
            }
        }
    </script>

    <jsp:include page="../link/Link.jsp"></jsp:include>
</head>
<body>
<h1>회원가입</h1>
<form name="frmMember">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name"><br>

    <label for="id">아이디:</label>
    <input type="text" id="id" name="id"><br>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password"><br>

    <label for="confirmPassword">비밀번호 확인:</label>
    <input type="password" id="confirmPassword" name="confirmPassword"><br>

    <label for="country">나라</label>
    <select name="country" id="country">
        <option value="대한민국">대한민국</option>
        <option value="日本">日本</option>
        <option value="中国">中国</option>
        <option value="Российская">Российская</option>
        <option value="USA">USA</option>
        <option value="UK">UK</option>
    </select>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" ><br>

    <input type="button" value="회원가입하기" onclick="sendMember()">
    <input type="hidden" name="command" value="addMember">
</form>

</body>
</html>
