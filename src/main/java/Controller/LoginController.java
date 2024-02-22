package Controller;

import PtUser.UserDAO;
import PtUser.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/pro/Login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String userPw = req.getParameter("user_pw");

        UserDAO dao = new UserDAO();
        UserDTO dto = dao.getUserDTO(userId, userPw);

        // 로그인 로직 수행
        if (dto.getUser_id() != null) {
            // 로그인 성공
            req.getSession().setAttribute("User", dto);
            req.getSession().setAttribute("Name", dto.getName());
            resp.sendRedirect("/TfBottle/MainPage.jsp");
        } else {
            req.setAttribute("LoginErrMsg", "로그인 실패!");
            req.getRequestDispatcher("/TfBottle/Login.jsp").forward(req, resp);
        }
    }
}
