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


@WebServlet(name = "StudentsListController", urlPatterns = "/students")
public class StudentsListController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = DBManager.getAllActiveStudents();
        req.setAttribute("studs",students);
        req.setAttribute("currentPage", "/WEB-INF/jsp/studentsList.jsp"); //текущая страница, этот пусть отображается в include в tamplate с ${}
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String ids = req.getParameter("idsDeleteStudent");
        DBManager.deleteStudents(ids);
        resp.sendRedirect("/students");

    }
}

