package Controller;

import PtBoard.BoardDAO;
import PtBoard.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/mvcboard/write.do")
public class WriteController  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String board_id = req.getParameter("board_id");
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(board_id);

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/TfBottle/Write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String contents = req.getParameter("contents");

        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");

        BoardDTO dto = new BoardDTO();
        dto.setTitle(title);
        dto.setContents(contents);
        dto.setUser_id(user_id);

        BoardDAO dao = new BoardDAO();
        int result = dao.insertWrite(dto);

        dao.close();

        if(result == 1){ // 성공
            resp.sendRedirect("../mvcboard/list.do?user_id="+user_id);
        }else{ // 실패
            JSFunction.alertBack(resp, "글쓰기 실패");
        }
    }
}
