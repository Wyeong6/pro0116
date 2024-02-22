package Controller;

import PtBoard.BoardDAO;
import PtBoard.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;

import java.io.IOException;

@WebServlet("/mvcboard/Write.do")
public class WriteController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            BoardDTO dto = new BoardDTO();

            dto.setUser_id(req.getParameter("user_id"));
            dto.setTitle(req.getParameter("title"));
            dto.setContents(req.getParameter("contents"));

            System.out.println(req.getParameter("user_id"));
            System.out.println(req.getParameter("title"));
            System.out.println(req.getParameter("contents"));

            BoardDAO dao = new BoardDAO();
            int result = dao.insertWrite(dto);

            dao.close();

            if (result == 1) {
                resp.sendRedirect("/TfBottle/MainPage.jsp");
            } else {
                JSFunction.alertLocation(resp, "글쓰기 실패", "./TfBottle/MainPage.do");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("doPost 오류발생");
        }

    }
}
