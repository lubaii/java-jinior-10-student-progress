package controllers;

import datebase.DBManager;
import entity.Discipline;
import entity.Mark;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idStud = req.getParameter("idProgressStuds");
        Student student = DBManager.getStudentById(idStud);
        req.setAttribute("stuD", student);
        String selTerm = req.getParameter("selTerm");

        List<Mark> marks = DBManager.getAllActiveMarkStud();

        if (idStud != null) {
         //   String ss=student.getId()+"";
            for(Mark t : marks){
                List<Term> terms=t.getTerms();
                req.setAttribute("terms",terms);

                    List<Student> listStuds = t.getStudents();
                    for (Student s :listStuds){
                        String s1 = s.getId()+"";
                        if(s1.equals(idStud)){
                            if(selTerm!=null) {
                                for (Term ts : terms) {
                                    String cur = ts.getId() + "";
                                    if (cur.equals(selTerm)) {
                                        req.setAttribute("selectedTerm", ts);
                                    }
                                }
                            } else
                            {
                                req.setAttribute("selectedTerm",terms.get(0));
                            }
                    }

                }
            }

        }


        req.setAttribute("currentPage", "/WEB-INF/jsp/studentProgress.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selTerm = req.getParameter("selTerm");

        String idStud = req.getParameter("idProgressStuds");
        List<Term> terms = DBManager.getAllActiveTermStud();
        req.setAttribute("terms",terms);
        if (idStud != null) {
            Student student = DBManager.getStudentById(idStud);
            String ss=student.getId()+"";
            for(Term t : terms){
                List<Student> listStuds = t.getStudents();
                for (Student s :listStuds){
                    String s1 = s.getId()+"";
                    if(s1.equals(ss)){
                       // req.setAttribute("selectedTerm",t);
                        req.setAttribute("terms",terms);

                    }
                    break;
                }
            }

        } else
        {
            req.setAttribute("selectedTerm",terms.get(0));
        }

        req.setAttribute("currentPage", "/WEB-INF/jsp/studentProgress.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);

    }
}