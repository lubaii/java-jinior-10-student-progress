package controllers;

import datebase.DBManager;
import entity.Discipline;
import entity.Term;
import entity.TermDiscipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@WebServlet(name = "TermModifyControl", urlPatterns = "/term-modify")

public class TermModifyControl extends HttpServlet {
    String termDB;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selTerm = req.getParameter("sel");

        List<Discipline> disciplines = DBManager.getDisceplinesinTerm(selTerm);
        req.setAttribute("disc", disciplines);

        List<Term> terms = DBManager.getAllActiveTerm();
        if (selTerm != null) {
            for (Term t : terms) {
                String cur = t.getId() + "";
                if (cur.equals(selTerm)) {
                    req.setAttribute("select", t); // отображение семестров
                    termDB = cur;
                }
            }
        }

        req.setAttribute("currentPage", "/WEB-INF/jsp/termModifying.jsp"); // отдали ответ
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] discP = req.getParameterValues("idModifyTerm"); // переменная для хранение дисциплин, вытащенная из браузера

        List<String> modList = new ArrayList<String>();// модификация дисциплин для записили в БД
        String str = Arrays.toString(discP);
        str = str.replace("]", "");
        str = str.replace("[", "");
        for (String s : str.split(",")) {
            modList.add(s);
        }
        String disId;
        List<Discipline> disciplineList = DBManager.getAllActiveDisciplines();
        List<String> sendDb = new ArrayList<String>();
        for (Discipline d : disciplineList) {
            for (String s : modList) {
                String sd = d.getDiscipline() + "";
                if (sd.equals(s)) {
                    disId = d.getId() + "";
                    sendDb.add(disId);
                }
            }

        }

        DBManager.deleteDisciplineandinTerm(termDB, sendDb);

        resp.sendRedirect("/terms-list");

    }

}