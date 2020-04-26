package controllers;

import datebase.DBManager;

import java.sql.*;

public class Main {
    public static void main(String[] args) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        DBManager.getAllActiveTerm();
        DBManager.getAllActiveTermStud();
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "qsz9267188558d27");
//
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from discipline WHERE status = 1");
//            while (rs.next()){
//                System.out.println(rs.getString("discipline"));
//            }
//            con.close();
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }
}
