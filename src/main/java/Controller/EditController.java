package Controller;

import PtBoard.BoardDAO;
import PtBoard.BoardDTO;
import util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String board_id = req.getParameter("board_id");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(board_id);

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/TfBottle/Edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 수정 내용을 매개변수에서 얻어옴
        String board_id = req.getParameter("board_id");
        String title = req.getParameter("title");
        String contents = req.getParameter("contents");

        // DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setBoard_id(board_id);
        dto.setTitle(title);
        dto.setContents(contents);

        // DB에 수정 내용 반영
        BoardDAO dao = new BoardDAO();
        int result = dao.updateEdit(dto);
        dao.close();

        // 성공 or 실패?
        if (result == 1) { // 수정 성공
            resp.sendRedirect("../mvcboard/viewServlet.do?board_id="+board_id);
        } else { // 수정 실패
            JSFunction.alertLocation(resp, "작성자 아이디와 맞지않습니다. 검증을 다시 진행해주세요.",
                    "../mvcboard/viewServlet.do?board_id="+board_id);
        }
    }
}