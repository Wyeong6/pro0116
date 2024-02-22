<jsp:useBean id="dto" scope="request" type="PtBoard.BoardDTO"/>
<%@ page import="PtBoard.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>편지 보기</title>
    <jsp:include page="../link/Link.jsp"></jsp:include>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .letter {
            max-width: 600px;
            background-color: black;
            border: 1px solid black;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .letter h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .letter p {
            margin: 10px 0;
        }

        .letter-image {
       /*     background-image: url('letter-background.jpg');*/
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            padding: 40px;
            text-align: center;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="letter">
    <div class="letter-image">
        <h1>편지 보기</h1>
        <p>게시판 ID: ${dto.board_id}</p>
        <p>제목: ${dto.title}</p>
        <p>내용: ${dto.contents}</p>
        <p>작성자: ${dto.user_id}</p>
        <p>작성일: <fmt:formatDate value="${dto.post_date}" pattern="yyyy-MM-dd" /></p>
    </div>
</div>
</body>
</html>

