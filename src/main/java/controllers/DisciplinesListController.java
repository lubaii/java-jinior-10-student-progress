package controllers;

import datebase.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisciplinesListController", urlPatterns = "/disciplines")
public class DisciplinesListController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // отображает данные при нажатии на конпку
        List<Discipline> disciplines = DBManager.getAllActiveDisciplines(); // подключается к базе ланных, достает все дисциплины

        req.setAttribute("disces", disciplines); //устанавливает атрибуты дициплины

        req.setAttribute("currentPage", "/WEB-INF/jsp/disciplinesList.jsp"); //текущая страница, этот пусть отображается в include в tamplate с ${}
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp); //перенаправляетм на template
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("idsDeleteDiscipline");
        System.out.println(ids);
        DBManager.deleteDisciplines(ids);
        resp.sendRedirect("/disciplines");

    }
}
