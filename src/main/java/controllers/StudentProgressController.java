package controllers;

import datebase.DBManager;
import entity.*;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String stud = req.getParameter("idProgressStuds");
        String selTerm = req.getParameter("sel");
        Student student = DBManager.getStudentById(stud);
        req.setAttribute("stuD", student);

        List<Semestr> semestrs = DBManager.getSemestrById(); // переимено
        req.setAttribute("terms",semestrs);
        List<Mark> marks = DBManager.getMarksbyStudandTerm(selTerm,stud);

        double sumMarks =0;
        for(Mark m :marks){
         int i= m.getMark();
            sumMarks=sumMarks+i;

        }
        double everegmarks= sumMarks/marks.size();

        req.setAttribute("marks",marks);
        req.setAttribute("selectedTerm",selTerm);
        req.setAttribute("evereg",everegmarks);

        req.setAttribute("currentPage", "/WEB-INF/jsp/studentProgress.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selTerm = req.getParameter("selTerm");
/*
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
*/
    }
}