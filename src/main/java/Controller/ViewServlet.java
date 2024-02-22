package Controller;

import PtBoard.BoardDAO;
import PtBoard.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// List.jsp에서 get방식으로 받아옴
@WebServlet("/mvcboard/viewServlet.do")
public class ViewServlet extends HttpServlet {

    // 수정한 글 장석후 띄어쓰기(줄바꿈) 처리하기
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String board_id = req.getParameter("board_id");
        BoardDAO dao = new BoardDAO(); // dao 객체 생성
        // dao에 selectView 쿼리문 메서드 생성후 매개변수로 게시물 번호 받고 dto에 저장
        BoardDTO dto = dao.selectView(board_id);
        // dto에 게시글 띄어쓰기(줄바꿈) 처리
        dto.setContents(dto.getContents().replaceAll("\r\n", "<br/>"));

        // request 영역에 dto 저장
        req.setAttribute("dto", dto);
        // 포워드로 View.jsp로 보내기
        req.getRequestDispatcher("/TfBottle/View.jsp").forward(req, resp);
    }
}