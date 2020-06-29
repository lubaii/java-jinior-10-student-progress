package controllers;

import datebase.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = "/login")

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("currentPage", "/WEB-INF/jsp/login.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("pass");
        String role = req.getParameter("role");

        boolean access = DBManager.getAccountByLoginPasswordRole(login, password, role);
        if (access) {
            req.getSession().setAttribute("isLogin", "1"); // islogin  неизвестно кто
            req.getSession().setAttribute("role", role); // администратор, учитель...
            req.getSession().setAttribute("user", login);
            resp.sendRedirect("/"); // выйти на общую страницу

        } else {
            req.setAttribute("errorMessage", "1"); // если пользователь веедет неправильные данные
            req.setAttribute("currentPage", "/WEB-INF/jsp/login.jsp");
            req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
        }

    }
}