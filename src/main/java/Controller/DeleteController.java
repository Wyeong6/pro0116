package Controller;

import PtBoard.BoardDAO;
import PtBoard.BoardDTO;
import util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// View.jsp 에서 삭제하기 클릭시 get 방식으로 delete.do 매핑
@WebServlet("/mvcboard/delete.do")
public class DeleteController extends HttpServlet {

    // 받아온 get 방식으로 수행
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 매개변수 저장
        String board_id = req.getParameter("board_id");

        // 세션에서 아이디 가져오기
        HttpSession session = req.getSession();
        String sessionId = (String) session.getAttribute("User");

        BoardDAO dao = new BoardDAO();

        // dao에 selectView 쿼리문 메서드 (조인한 상태) 호출
        BoardDTO dto = dao.selectView(board_id);

        if (sessionId != null && sessionId.equals(dto.getUser_id())) { // 아이디 검증 성공
            int result = dao.deletePost(board_id); // 게시물 삭제
            dao.close();

            if (result == 1) { // 게시물 삭제 성공
                JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
            } else { // 게시물 삭제 실패
                JSFunction.alertBack(resp, "삭제 실패");
            }
        } else { // 아이디 검증 실패
            JSFunction.alertBack(resp, "본인만 삭제 가능");
        }
    }
}
