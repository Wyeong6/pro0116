<%@ page import="PtBoard.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <title> 게시판</title>
</head>
<body>

<h2>게시판 - 상세 보기(View)</h2>
<table border="1" width="90%">
  <colgroup>
    <col width="15%"/> <col width="35%"/>
    <col width="15%"/> <col width="*"/>
  </colgroup>

  <!-- 게시글 정보 -->
  <tr>
    <td>번호</td> <td>${ dto.board_id }</td>
    <td>작성자</td> <td>${ dto.user_id }</td>
  </tr>
  <tr>
    <td>작성일</td> <td>${ dto.post_date }</td>
  </tr>
  <tr>
    <td>제목</td>
    <td colspan="3">${ dto.title }</td>
  </tr>
  <tr>
    <td>내용</td>
    <td colspan="3" height="100">
      ${ dto.contents }
    </td>
  </tr>
  <!-- 하단 메뉴(버튼) -->
  <tr>
    <td colspan="4" align="center">
      <%-- 로그인 했을때 session 영역에 저장된 아이디와 게시판 장석자 아이디와 동일하면 보이기 --%>
      <%
        BoardDTO dto = (BoardDTO) request.getAttribute("dto");
        if (session.getAttribute("user_id") != null &&
                session.getAttribute("user_id").toString().equals(dto.getUser_id())) {
      %>
      <%-- 게시글 수정 클릭시 edit.do에 get방식으로 보내기 --%>
      <button type="button" onclick="location.href = '/mvcboard/edit.do?board_id=${ dto.board_id }';">
        게시글 수정
      </button>
      <%-- 게시글 삭제 클릭시 스크립트 confirmDelete 함수 수행 --%>
      <button type="button" onclick="confirmDelete('${ dto.board_id }');">
        게시글 삭제
      </button>
      <%
        }
      %>
      <%-- 목록 바로가기 버튼 클릭시 list.do 로 매핑 --%>
      <button type="button" onclick="location.href='../mvcboard/list.do';">
        목록 바로가기
      </button>
    </td>
  </tr>
</table>
<%--버튼 클릭시 정말 삭제할꺼냐고 물어보는 스크립트--%>
<script>
  function confirmDelete(board_id) {
    if (confirm('정말 삭제하시겠습니까?')) {
      // 삭제되면 get 방식으로 delete.do 매핑
      location.href = '../mvcboard/delete.do?board_id=' + board_id;
    }
  }
</script>
</body>
</html>
