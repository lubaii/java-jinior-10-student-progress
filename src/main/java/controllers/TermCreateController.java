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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Discipline> disciplines = DBManager.getAllActiveDisciplines(); // подключается к базе ланных, достает все дисциплины

        req.setAttribute("disc", disciplines); //устанавливает атрибуты дициплины

        List<Term> terms = DBManager.getAllActiveTerm();
        req.setAttribute("terms",terms);

        req.setAttribute("currentPage", "/WEB-INF/jsp/termCreating.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameOfDisc = req.getParameter("terms"); //вытягивает в джаву в jsp страницуб вытянит то что ввел пользователь
        String[] discP = req.getParameterValues("discP");

        List<String> disci = Arrays.asList(discP);
        List<Integer>listInt = new ArrayList<Integer>();
        List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
        for(Discipline d :disciplines){
            for(String s : disci){
                String dd = d.getDiscipline();
                if(dd.equals(s)){
                    System.out.println("прошло");
                    int item= d.getId();
                    listInt.add(item);
                }
            }
        }
        List<Term>termList=DBManager.getAllActiveTerm();
        for(Term t :termList) {
           String ss= t.getDuration();
            if (ss.equals(nameOfDisc)) {
                int ttt = t.getId();
                DBManager.insertNewDisciplineandTerm(ttt, listInt);
                break;
            }

        }


        resp.sendRedirect("/terms-list"); // перенаправляем на контроллеру disciplines
    }
}
