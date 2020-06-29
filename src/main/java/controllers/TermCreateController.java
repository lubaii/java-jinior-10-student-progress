package controllers;

import datebase.DBManager;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "TermCreateController", urlPatterns = "/term-create")
public class TermCreateController extends HttpServlet {
    String selTerm;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        selTerm = req.getParameter("term");

        List<Term> terms = DBManager.getAllActiveTerm();
        if (selTerm != null) {
            for (Term t : terms) {
                String cur = t.getId() + "";
                if (cur.equals(selTerm)) {
                    req.setAttribute("select", t); // отображение семестров
                }
            }
        }

        List<Discipline> disciplines = DBManager.getAllActiveDisciplines(); // подключается к базе ланных, достает все дисциплины
        req.setAttribute("disc", disciplines); //устанавливает атрибуты дициплины

        req.setAttribute("currentPage", "/WEB-INF/jsp/termCreating.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] discP = req.getParameterValues("idAdddisciplines");

        List<String> strListDisc = new ArrayList<String>();
        String str = Arrays.toString(discP);
        str = str.replace("]", "");
        str = str.replace("[", "");
        for (String s : str.split(",")) {
            strListDisc.add(s);
        }


        List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
        List<Integer> listInt = new ArrayList<Integer>(); // хранение id диссциплин
        for (Discipline d : disciplines) {
            for (String s : strListDisc) {
                String dd = d.getDiscipline();
                if (dd.equals(s)) {
                    int item = d.getId();
                    listInt.add(item);
                }
            }
        }

        List<Term> termList = DBManager.getAllActiveTerm();
        for (Term t : termList) {
            String s = t.getId() + "";
            if (s.equals(selTerm)) {
                int term = t.getId();
                DBManager.insertNewDisciplineandTerm(term, listInt);
                break;
            }

        }


        resp.sendRedirect("/terms-list"); // перенаправляем на контроллеру
    }
}
