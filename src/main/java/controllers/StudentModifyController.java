package controllers;


import com.google.protobuf.TextFormat;
import datebase.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify") // отображается в базе

public class StudentModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStud = req.getParameter("idModifyStuds");

        Student student = DBManager.getStudentById(idStud);

        req.setAttribute("studs", student);

        req.setAttribute("currentPage", "/WEB-INF/jsp/studentModifying.jsp"); // отдали ответ
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifyStuds = req.getParameter("idModifyStuds");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String group = req.getParameter("group");
        String receiptDate = req.getParameter("date");

        SimpleDateFormat fromUser = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            String reforStudsdate = myFormat.format(fromUser.parse(receiptDate));
            DBManager.modifySrudent(surname, name, group, reforStudsdate, idModifyStuds);
            resp.sendRedirect("/students"); //url поменялся у пользователя
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
