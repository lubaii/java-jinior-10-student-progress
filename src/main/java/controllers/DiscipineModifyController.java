package controllers;

import com.sun.net.httpserver.HttpsParameters;
import datebase.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscipineModifyController", urlPatterns = "/discipline-modify") // полуили HTTP запрос /discipline-modify

public class DiscipineModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //respons заполняет  HTML код
     String idDisc = req.getParameter("idModifyDisc");
        //System.out.println(idDisc);
        Discipline discipline = DBManager.getDisciplineById(idDisc);

        req.setAttribute("disc",discipline);

        req.setAttribute("currentPage", "/WEB-INF/jsp/disciplineModifying.jsp"); // отдали ответ
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifyDisc = req.getParameter("idModifyDisc");
        String modifyDisc = req.getParameter("modifyDisc");

        DBManager.modifyDiscipline(modifyDisc,idModifyDisc);
        resp.sendRedirect("/disciplines"); //url поменялся у пользователя
    }
}
