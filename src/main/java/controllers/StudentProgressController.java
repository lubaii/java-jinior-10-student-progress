package controllers;

import datebase.DBManager;
import entity.Student;

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

       String stud = req.getParameter("idProgressStuds");
       Student student = DBManager.getStudentById(stud);
        req.setAttribute("stuD", student);

        req.setAttribute("currentPage", "/WEB-INF/jsp/studentProgress.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStud = req.getParameter("idStud");
        List<Student> students = DBManager.getAllActiveStudents();
        if (idStud != null) {
            for (Student s : students) {
                String s1 = s.getId() + "";
                if (idStud.equals(s1)) {
                    DBManager.getAllActiveTermStud();
                    resp.sendRedirect("/student-progress");
                }
            }
        }

    }
}