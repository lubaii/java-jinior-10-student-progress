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

@WebServlet(name = "DiscipineModifyController", urlPatterns = "/discipline-modify")

public class DiscipineModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String idDisc = req.getParameter("idModifyDisc");
        //System.out.println(idDisc);
        Discipline discipline = DBManager.getDisciplineById(idDisc);

        req.setAttribute("disc",discipline);

        req.setAttribute("currentPage", "/WEB-INF/jsp/disciplineModifying.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }
}
