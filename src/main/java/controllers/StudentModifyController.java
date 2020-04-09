package controllers;


import datebase.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify") // отображается в базе

public class StudentModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStud = req.getParameter("idModifyStuds");
        Student student = DBManager.getStudentById(idStud);
        req.setAttribute("studs",student);

        req.setAttribute("currentPage", "/WEB-INF/jsp/studentModifying.jsp"); // отдали ответ
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifyStuds = req.getParameter("idModifyStuds");
        String surname = req.getParameter("surname");
        String name= req.getParameter("name");
        String group = req.getParameter("group");
        String receiptDate = req.getParameter("receiptDate");
        DBManager.modifySrudent(idModifyStuds,surname,name,group,receiptDate);
        resp.sendRedirect("/students"); //url поменялся у пользователя

    }
}
