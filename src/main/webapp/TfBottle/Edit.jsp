<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script>
        function validateForm(form){
            if(form.title.value == ""){
                alert("제목을 입력 하세요");
                form.title.focus();
                return false;
            }
            if(form.contents.value == ""){
                alert("내용을 입력 하세요");
                form.contents.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<%--Link.jsp 파일을 현재 파일에 include 해서 포함시킴--%>
<jsp:include page="../link/Link.jsp"></jsp:include>
<h2> 게시판 - 수정하기</h2>
<%-- 내용 수정후 submit으로 form값을 post 방식으로 edit.do 매핑된곳으로 보내기 --%>
<form name="writeFrm" method="post" action="/mvcboard/edit.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="board_id" value="${dto.board_id}"/>
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td><input name="user_id" style="width: 150px;" value="${dto.user_id}" disabled/></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" style="width: 90%;" value="${dto.title}"/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="contents" style="width: 90%; height: 100px;">${ dto.contents}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='/mvcboard/list.do';">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
