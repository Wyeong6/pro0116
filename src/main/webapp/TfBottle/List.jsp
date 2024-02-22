<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <style>
        a{text-decoration: none;}
    </style>
</head>
<body>
<%--Link.jsp 파일을 현재 파일에 include 해서 포함시킴--%>
<jsp:include page="../link/Link.jsp"></jsp:include>
    <h2>게시판 - 목록</h2>
    <%--검색 폼--%>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>

    <%--게시물 목록 테이블--%>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="15%">작성일</th>
        </tr>
        <c:choose>
            <c:when test="${empty boardList}"><%--게시글이 없을때--%>
                <tr>
                    <td colspan="4" align="center">
                        등록된 게시물이 없습니다.
                    </td>
                </tr>
            </c:when>
            <c:otherwise> <%--게시글이 있을때--%>
                <c:forEach items="${boardList}" var="dto" varStatus="loop">
                    <%-- 현재 페이지의 목록에서 각 항목의 역순 번호를 계산하는 데 사용 --%>
                    <tr align="center">
                        <td>${map.totalCount - (((map.pageNum-1)*map.pageSize) + loop.index)}</td>
                        <td align="left">
                            <%-- 게시글 제목 클릭스 viewServlet.do로 매핑 --%>
                            <a href="../mvcboard/viewServlet.do?board_id=${dto.board_id}">${dto.title}</a>
                        </td>
                        <td>${dto.user_id}</td>
                        <td>${dto.post_date}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
    <table border="1" width="90%">

        <tr align="center">
            <td>
                ${map.pagingImg}
            </td>
        </tr>
    </table>
</body>
</html>
