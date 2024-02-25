package Controller;

import PtUser.UserDAO;
import PtUser.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/pro/login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String userPw = req.getParameter("user_pw");
        String remember = req.getParameter("remember-check");

        UserDAO dao = new UserDAO();
        UserDTO dto = dao.getUserDTO(userId, userPw);

        // 로그인 로직 수행
        if (dto.getUser_id() != null) {
            // 로그인 성공
            req.getSession().setAttribute("user_id", dto.getUser_id());
            req.getSession().setAttribute("name", dto.getName());

            // "아이디 저장하기"가 체크되었을 경우 쿠키 생성
            if (remember != null) {
                Cookie cookie = new Cookie("user_id", userId);

                // 경로 설정
                cookie.setPath("/");

                // 쿠키의 유효기간 설정 (1년)
                cookie.setMaxAge(60 * 60 * 24 * 365);

                // 응답에 쿠키 추가
                resp.addCookie(cookie);

                // 세션에 쿠키의 이름과 값을 저장
                req.getSession().setAttribute(cookie.getName(), cookie.getValue());
            }

            resp.sendRedirect("/TfBottle/MainPage.jsp");
        } else {
            req.setAttribute("LoginErrMsg", "로그인 실패!");
            req.getRequestDispatcher("/TfBottle/Login.jsp").forward(req, resp);
        }
    }
}