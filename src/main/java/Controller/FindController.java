package Controller;

import PtUser.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/01/find.do")
public class FindController extends HttpServlet {
    private static final long serialVersionUID = 1L;


    //아이디 찾기
    @Override
    protected void service(HttpServletRequest req ,HttpServletResponse resp)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String id = dao.findld(name, email);
        req.setAttribute("id", id);

//        System.out.println(id);
//        System.out.println(req.getParameter("id"));
//        System.out.println(req.getParameter("email"));

        //다시 보기
        if (id == null ) {
            String message = "입력한 아이디와 이메일이 등록되지 않았습니다.";
            req.setAttribute("message", message);
            req.getRequestDispatcher("./find.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("./FindIdAfter.jsp").forward(req, resp);
        }
    }

}
