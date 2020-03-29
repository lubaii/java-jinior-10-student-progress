package controllers;

import datebase.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineCreateController", urlPatterns = "/discipline-create") // отображается в базе
public class DisciplineCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // отображает только // получить информацию для чтения лекция 29
 // если метод doPost отправлено засекречено, не будет видно в строке браузера 29 лекциям, https://www.google.com/search?q=%D0BA, метод doGet
        //HttpServletRequest req, HttpServletResponse resp
        req.setAttribute("currentPage", "/WEB-INF/jsp/disciplineCreating.jsp");
        // jsp сервлет, в тело ответа идет из базы...
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //

        String nameOfDisc = req.getParameter("discName"); //вытягивает в джаву в jsp страницуб вытянит то что ввел пользователь
        DBManager.insertNewDiscipline(nameOfDisc); // доступ к базбе данных  nameOfDisc то что ввел пользователь
        resp.sendRedirect("/disciplines"); // перенаправляем на контроллеру disciplines

    }
}
