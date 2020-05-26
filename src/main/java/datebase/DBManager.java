package datebase;

import entity.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class DBManager {
    private static Connection con;
    private static PreparedStatement modifyDiscipline; // переменная статик не может использована в статик блоке
    private static PreparedStatement getAccountByLoginPasswordRole;
    private static PreparedStatement getAllActiveTerm;
    private static PreparedStatement modifySrudent;
    private static PreparedStatement getMarksbyStudandTerm;
    private static PreparedStatement getAllActiveMarkStud;
    private static PreparedStatement deleteDisciplineandinTerm;


    static {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
            modifyDiscipline = con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);");
            getAccountByLoginPasswordRole = con.prepareStatement("SELECT * FROM user_role\n" +
                    "left join user on user_role.id_user = user.id\n" +
                    "where user.login = ? and user.password = ? and user_role.id_role = ?;");
            getAllActiveTerm = con.prepareStatement("SELECT * FROM term_discipline as td \n" +
                    "left join term as t on td.id_term = t.id\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where td.status_dis = 1 and  t.status = 1 and d.status = 1 group by  td.id_discipline, td.id_term;");
            /*getAllActiveTerm = con.prepareStatement("SELECT * FROM term_discipline as td\n" +
                    "left join term as t on td.id_term = t.id\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where td.status_dis = 1 and t.status = 1 and d.status = 1 order by td.id_term");*/
            modifySrudent = con.prepareStatement("UPDATE `student` SET `first_name` = ?, `last_name` = ?, `group` = ?, `date` = ? WHERE (`id` = ?);");
            getMarksbyStudandTerm = con.prepareStatement("SELECT * FROM student_crm.mark\n" +
                    "left join student on mark.id_student=student.id\n" +
                    "left join term_discipline on mark.id_term_discipline=term_discipline.id\n" +
                    "left join term on term_discipline.id_term=term.id\n" +
                    "left join discipline on term_discipline.id_discipline = discipline.id\n" +
                    "where discipline.status=1 and term.status=1 and student.id=? and term.id=? group by id_term_discipline;");
            getAllActiveMarkStud = con.prepareStatement("SELECT mark.*,discipline.id l2,discipline.discipline,discipline.status,student.*,term.* from student_crm.mark \n" +
                    "left join discipline on mark.id=discipline.id \n" +
                    "left join student on mark.id_student=student.id \n" +
                    "left join term on mark.id_term_discipline = term.id\n" +
                    "where  term.status=1 and student.status=1 order by term.id; ");
            //deleteDisciplineandinTerm=con.prepareStatement("UPDATE `student_crm`.`term_discipline` SET `id_discipline` = NULL WHERE (`id_term` = ? and `id_discipline` = ?);");
            deleteDisciplineandinTerm=con.prepareStatement("UPDATE `student_crm`.`term_discipline` SET `status_dis` = '0' WHERE (`id_term` = ? and `id_discipline` = ?);");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static List<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1");
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;


    }

    public static Discipline getDisciplineById(String id) {
        Discipline discipline = new Discipline();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1 AND id = " + id);
            while (rs.next()) {
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;


    }


    public static void insertNewDiscipline(String newDiscipline) {
        try {
            Statement stm = con.createStatement();
            stm.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + newDiscipline + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insertNewDisciplineandTerm(int term, List<Integer> disciplines) {
        int i = disciplines.size();
        while (i > 0) {
            for (Integer s : disciplines) {
                try {
                    Statement stm = con.createStatement();
                    stm.execute("INSERT INTO `term_discipline` (`id_term`, `id_discipline`) VALUES ('" + term + "', '" + s + "');");
                    //  INSERT INTO `student_crm`.`term_discipline` (`id_term`, `id_discipline`) VALUES ('3', '4');
                } catch (Exception e) {
                    e.printStackTrace();
                }
                i--;
            }

        }
    }

    public static void deleteDisciplineandinTerm(String id,List<String> disciplines) {
        int i = disciplines.size();
        while (i>0) {
            for(String s : disciplines) {
                try {
                    //Statement stm = con.createStatement();
                    //deleteDisciplineandinTerm.setString(1,"0");

                    deleteDisciplineandinTerm.setString(1,id);
                    deleteDisciplineandinTerm.setString(2,s);
                    deleteDisciplineandinTerm.execute();
                   // stm.execute("UPDATE `student_crm`.`term_discipline` SET `id_discipline` = '0' WHERE (`id_term` = '"+id+"' and `id_discipline` = '" + s + "');");
                    // stm.execute("UPDATE `student_crm`.`term_discipline` SET `id_discipline` = '" + s + "' WHERE (`id` = '?');");
                    // stm.execute("INSERT INTO `term_discipline` (`id_term`, `id_discipline`) VALUES ('" + term + "', '" + s + "');");
                    //  INSERT INTO `student_crm`.`term_discipline` (`id_term`, `id_discipline`) VALUES ('3', '4');
                } catch (Exception e) {
                    e.printStackTrace();
                }
                i--;
            }
        }

    }

    public static void deleteDiscTerm(int id_discipline, int disciplin) {
        try {
            Statement stm = con.createStatement();
            // stm.execute("UPDATE `student` SET `status` = '0' WHERE (`id` in ("+ids+"));");
            //UPDATE `student_crm`.`term_discipline` SET `id_discipline` = '6' WHERE (`id` = '1776');
            // stm.execute("UPDATE `student_crm`.`term_discipline` SET `id_term` = ?, `id_discipline` = ? WHERE (`id` = '1776')");
            stm.execute("UPDATE `student_crm`.`term_discipline` SET `id_discipline` = '" + id_discipline + "' WHERE (`id` = '" + disciplin + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void modifyDiscipline(String newDiscipline, String id) {
        try {
            //Statement stm = con.createStatement(); //
            //stm.execute(""UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);"");
            //  PreparedStatement stm = con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);"); // подготовили запрос

            // заменили запрос
            modifyDiscipline.setString(1, newDiscipline); //первый параметр ?,
            modifyDiscipline.setString(2, id);
            modifyDiscipline.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteDisciplines(String ids) {
        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE `discipline` SET `status` = '0' WHERE (`id` in (" + ids + "));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static boolean getAccountByLoginPasswordRole(String login, String password, String role) {
        try {
            getAccountByLoginPasswordRole.setString(1, login);
            getAccountByLoginPasswordRole.setString(2, password);
            getAccountByLoginPasswordRole.setString(3, role);
            ResultSet rs = getAccountByLoginPasswordRole.executeQuery(); //попдает выборка на resultSet
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;


    }

    // public static void insertNewStudent(String newStudent){
    public static void insertNewStudent(String newStudent, String name, String group, String date) {
        try {
            Statement stm = con.createStatement();
            //  stm.execute("INSERT INTO `student` (`date`) VALUES ('"+newStudent+"');");
            stm.execute("INSERT INTO `student` (`first_name`, `last_name`, `group`, `date`) VALUES ('" + newStudent + "', '" + name + "', '" + group + "', '" + date + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Term> getAllActiveTerm() {
        LinkedList<Term> terms = new LinkedList<Term>();
        int lastTermId = -1;
        try {
            ResultSet rs = getAllActiveTerm.executeQuery();
            while (rs.next()) {
                if (lastTermId == -1) {
                    Term term = new Term();
                    term.setId(rs.getInt("id_term"));
                    term.setName(rs.getString("name"));
                    term.setDuration(rs.getString("duration"));

                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));

                    term.addDiscipline(discipline);
                    terms.add(term);
                    lastTermId = rs.getInt("id_term");
                } else {
                    int currentTermId = rs.getInt("id_term");
                    if (currentTermId == lastTermId) {
                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        Term lastTerm = terms.removeLast();
                        lastTerm.addDiscipline(discipline);
                        terms.add(lastTerm);
                        lastTermId = rs.getInt("id_term");

                    } else {
                        Term term = new Term();
                        term.setId(rs.getInt("id_term"));
                        term.setName(rs.getString("name"));
                        term.setDuration(rs.getString("duration"));

                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        term.addDiscipline(discipline);
                        terms.add(term);
                        lastTermId = rs.getInt("id_term");
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;
    }

    public static List<Student> getAllActiveStudents() {
        ArrayList<Student> students = new ArrayList<Student>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from student WHERE status = 1");
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setFirstname(rs.getString("first_name"));
                student.setLastname(rs.getString("last_name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getString("date"));
                students.add(student);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public static void modifySrudent(String newFirstSt, String newLastSt, String newGroupSt, String newDateSt, String id) {
        try {
            // modifySrudent = con.prepareStatement("UPDATE `student` SET `first_name` = ?, `last_name` = ?, `group` = ? WHERE (`id` = ?);");
            // заменили запрос
            modifySrudent.setString(1, newFirstSt); //первый параметр ?,
            modifySrudent.setString(2, newLastSt); //первый параметр ?,
            modifySrudent.setString(3, newGroupSt); //первый параметр ?,
            modifySrudent.setString(4, newDateSt); //первый параметр ?,
            modifySrudent.setString(5, id); //первый параметр ?,
            modifySrudent.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudentById(String id) {
        Student student = new Student();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from student WHERE status = 1 AND id = " + id);
            while (rs.next()) {
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("last_name"));
                student.setFirstname(rs.getString("first_name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getString("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;


    }

    public static void deleteStudents(String ids) {
        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE `student` SET `status` = '0' WHERE (`id` in (" + ids + "));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static List<Mark> getMarksbyStudandTerm(String idTerm, String idStudent) {
        LinkedList<Mark> marks = new LinkedList<Mark>();
  //getMarksbyStudandTerm = con.prepareStatement("SELECT * FROM student_crm.mark\n" +
        //                    "left join student on mark.id_student=student.id\n" +
        //                    "left join term_discipline on mark.id_term_discipline=term_discipline.id\n" +
        //                    "left join term on term_discipline.id_term=term.id\n" +
        //                    "left join discipline on term_discipline.id_discipline = discipline.id\n" +
        //                    "where discipline.status=1 and term.status=1 and student.id=? and term.id=?;");
        try {
            getMarksbyStudandTerm.setString(1,idStudent);
            getMarksbyStudandTerm.setString(2,idTerm);

            ResultSet rs = getMarksbyStudandTerm.executeQuery();
            while (rs.next()) {

                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));

                    Mark mark = new Mark();
                    mark.setDiscipline(discipline);
                    mark.setMark(rs.getInt("graduate"));
                    marks.add(mark);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return marks;
    }



    //public static List<Term> getTermById(String id){
    public static List<Term> getTermById() {
        LinkedList<Term> terms = new LinkedList<Term>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT id, name FROM student_crm.term WHERE status = 1");
            // ResultSet rs = stm.executeQuery("SELECT id, name FROM student_crm.term"+id);
            //ResultSet rs = stm.executeQuery("SELECT * FROM student_crm.term WHERE status = 1 AND id = " + id);
            //ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1 AND id = " + id);
            while (rs.next()) {

                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setName(rs.getString("name"));
                terms.add(term);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;


    }



    public static List<Semestr> getSemestrById() {
        LinkedList<Semestr> semestrs = new LinkedList<Semestr>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT id, name FROM student_crm.term WHERE status = 1");

            while (rs.next()) {

                Semestr semestr = new Semestr();
                semestr.setId(rs.getInt("id"));
                semestr.setName(rs.getString("name"));
                semestrs.add(semestr);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return semestrs;

    }
    public static List<Discipline> getDisceplinesinTerm(String idTerm) {
        LinkedList<Discipline> disinTerm = new LinkedList<Discipline>();
        try {
            Statement stm = con.createStatement();
           // ResultSet rs = stm.executeQuery("SELECT * FROM student_crm.term_discipline where id_term=" + idTerm + ";");
            ResultSet rs = stm.executeQuery("SELECT * FROM student_crm.term_discipline\n" +
                    "left join discipline on term_discipline.id_discipline=discipline.id\n" +
                    "where id_term=" + idTerm + " and status_dis=1 and status=1;");

            while (rs.next()) {
             Discipline discipline = new Discipline();
             discipline.setDiscipline(rs.getString("discipline"));
               /* TermDiscipline term = new TermDiscipline();
                term.setId(rs.getInt("id"));
                term.setId_term(rs.getString("id_term"));
                term.setId_discipline(rs.getString("id_discipline"))*/;
                disinTerm.add(discipline);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disinTerm;}

    public static List<TermDiscipline> getTermDisciplineById() {
        LinkedList<TermDiscipline> termdisciplines = new LinkedList<TermDiscipline>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM student_crm.term_discipline;");

            while (rs.next()) {

                TermDiscipline termDiscipline =new TermDiscipline();


                termDiscipline.setId(rs.getInt("id"));
                termDiscipline.setId_term(rs.getString("id_term"));
                termDiscipline.setId_discipline(rs.getString("id_discipline"));
                termdisciplines.add(termDiscipline);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return termdisciplines;

    }


}