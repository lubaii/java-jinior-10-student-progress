package controllers;

import datebase.DBManager;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermsListControllers", urlPatterns = "/terms-list")
public class TermsListControllers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selTerm = req.getParameter("selTerm");
        List<Term> terms = DBManager.getAllActiveTerm();
        req.setAttribute("terms",terms);
        if(selTerm!=null) {
            for (Term t : terms) {
                String cur = t.getId() + "";
                if (cur.equals(selTerm)) {
                    req.setAttribute("selectedTerm", t);
                }
            }
        }
        else
        {
            req.setAttribute("selectedTerm",terms.get(0));
        }

        req.setAttribute("currentPage", "/WEB-INF/jsp/termsList.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public static void main(String[] args) {
        List<Term> terms = DBManager.getAllActiveTerm();
    }
}
