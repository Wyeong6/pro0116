<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="IsLoggedIn.jsp"%>

<html>
<head>
     <title>회원제 게시판</title>

     <style>
         /* 전체 테이블 스타일 */
         table {
             width: 90%;
             border-collapse: collapse;
             margin-bottom: 20px;
         }

         /* 테이블 헤더 스타일 */
         th {
             background-color: #f2f2f2;
             padding: 10px;
             text-align: center;
         }

         /* 테이블 셀 스타일 */
         td {
             padding: 10px;
             text-align: left;
         }

         /* 입력 필드 스타일 */
         input[type="text"],
         textarea {
             width: 100%;
             padding: 5px;
             border: 1px solid #ccc;
             border-radius: 5px;
             box-sizing: border-box;
             font-family: Arial, sans-serif;
         }

         /* 버튼 스타일 */
         button {
             padding: 10px 20px;
             background-color: #4caf50;
             color: #fff;
             border: none;
             border-radius: 5px;
             cursor: pointer;
             font-family: Arial, sans-serif;
         }

         /* 버튼 호버 효과 */
         button:hover {
             background-color: #45a049;
         }

         /* 버튼 그룹 */
         .button-group {
             text-align: center;
             margin-top: 20px;
         }
     </style>
     <%--유효성 검증 스크립트--%>
     <script type="text/javascript">
         function validateForm(form){
             if(!form.title.value){
                 alert("제목을 입력 하세요");
                 form.title.focus();
                 return false;
             }
             if(!form.contents.value){
                 alert("내용을 입력 하세요");
                 form.contents.focus();
                 return false;
             }
         }
     </script>
</head>
<body>
<meta charset="UTF-8">
<h2>회원제 게시판 - 글쓰기</h2>
<form name="writeFrm" method="post" action="/mvcboard/write.do" onsubmit="return validateForm(this)">
     <table border="1" width="90%">
          <tr>
               <td>제목</td>
               <td><input type="text" name="title" /></td>
          </tr>
          <tr>
               <td>내용</td>
               <td><textarea name="contents" ></textarea></td>
          </tr>
     </table>
          <div class="button-group">
               <button type="button" onclick="location.href='/mvcboard/list.do';">목록 보기</button>
               <button type="reset">다시 입력</button>
               <button type="submit">작성 완료</button>
          </div>
</form>
</body>
</html>