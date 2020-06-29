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

        String namestud = req.getParameter("idProgressStuds");// данные студента
        String selTerm = req.getParameter("sel");// получение выбранного семестра семестра
        Student student = DBManager.getStudentByIdProgress(namestud);
        req.setAttribute("stuD", student);// установление в браузере данные студента

        List<Semestr> semestrs = DBManager.getSemestrById();
        req.setAttribute("terms",semestrs); // установления списка семестра
        List<Mark> marks = DBManager.getMarksbyStudandTerm(selTerm,namestud);

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

    }
}