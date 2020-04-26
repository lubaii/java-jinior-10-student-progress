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
    private static PreparedStatement getAllActiveTermStud;


    static {
        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
            modifyDiscipline =con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);");
            getAccountByLoginPasswordRole = con.prepareStatement("SELECT * FROM user_role\n" +
                    "left join user on user_role.id_user = user.id\n" +
                    "where user.login = ? and user.password = ? and user_role.id_role = ?;");
            getAllActiveTerm = con.prepareStatement("SELECT * FROM term_discipline as td\n" +
                    "left join term as t on td.id_term = t.id\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where t.status = 1 and d.status = 1 order by td.id_term");
            modifySrudent = con.prepareStatement("UPDATE `student` SET `first_name` = ?, `last_name` = ?, `group` = ?, `date` = ? WHERE (`id` = ?);");
            getAllActiveTermStud = con.prepareStatement("SELECT * FROM student_crm.mark\n" +
                    "left join student on mark.id_student=student.id\n" +
                    "left join term_discipline on mark.id_term_discipline=term_discipline.id\n" +
                    "left join term on term_discipline.id_term=term.id\n" +
                    "left join discipline on term_discipline.id_discipline = discipline.id\n" +
                    "where discipline.status=1 and term.status=1;");
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static List<Discipline> getAllActiveDisciplines(){
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try{
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1");
            while (rs.next()){
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return disciplines;


    }
    public static Discipline getDisciplineById(String id){
        Discipline discipline = new Discipline();
        try{
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1 AND id = " + id);
            while (rs.next()){
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return discipline;


    }




    public static void insertNewDiscipline(String newDiscipline){
        try{
            Statement stm = con.createStatement();
            stm.execute("INSERT INTO `discipline` (`discipline`) VALUES ('"+newDiscipline+"');");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void modifyDiscipline(String newDiscipline,String id){
        try{
            //Statement stm = con.createStatement(); //
            //stm.execute(""UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);"");
          //  PreparedStatement stm = con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);"); // подготовили запрос

            // заменили запрос
            modifyDiscipline.setString(1,newDiscipline); //первый параметр ?,
            modifyDiscipline.setString(2,id);
            modifyDiscipline.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void deleteDisciplines(String ids){
        try{
            Statement stm = con.createStatement();
            stm.execute("UPDATE `discipline` SET `status` = '0' WHERE (`id` in ("+ids+"));");
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public static boolean getAccountByLoginPasswordRole (String login,String password,String role){
        try{
            getAccountByLoginPasswordRole.setString(1,login);
            getAccountByLoginPasswordRole.setString(2,password);
            getAccountByLoginPasswordRole.setString(3,role);
            ResultSet rs = getAccountByLoginPasswordRole.executeQuery(); //попдает выборка на resultSet
            while (rs.next()){
            return  true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;


    }

   // public static void insertNewStudent(String newStudent){
    public static void insertNewStudent(String newStudent,String name, String group,String date){
        try{
            Statement stm = con.createStatement();
          //  stm.execute("INSERT INTO `student` (`date`) VALUES ('"+newStudent+"');");
            stm.execute("INSERT INTO `student` (`first_name`, `last_name`, `group`, `date`) VALUES ('"+newStudent+"', '"+name+"', '"+group+"', '"+date+"');");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public  static List<Term> getAllActiveTerm(){
        LinkedList<Term> terms = new LinkedList<Term>();
        int lastTermId=-1;
        try{
            ResultSet rs = getAllActiveTerm.executeQuery();
            while (rs.next()){
                if(lastTermId==-1) {
                    Term term = new Term();
                    term.setId(rs.getInt("id_term"));
                    term.setName(rs.getString("name"));
                    term.setDuration(rs.getString("duration"));

                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));

                    term.addDiscipline(discipline);
                    terms.add(term);
                    lastTermId=rs.getInt("id_term");
                }
                else {
                    int currentTermId = rs.getInt("id_term");
                    if(currentTermId  == lastTermId){
                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        Term lastTerm = terms.removeLast();
                        lastTerm.addDiscipline(discipline);
                        terms.add(lastTerm);
                        lastTermId = rs.getInt("id_term");

                    }
                    else {
                        Term term = new Term();
                        term.setId(rs.getInt("id_term"));
                        term.setName(rs.getString("name"));
                        term.setDuration(rs.getString("duration"));

                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        term.addDiscipline(discipline);
                        terms.add(term);
                        lastTermId=rs.getInt("id_term");
                    }
                }

            }
        }catch (Exception e){e.printStackTrace();}
        return  terms;
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

        public static void modifySrudent(String newFirstSt, String newLastSt, String newGroupSt, String newDateSt, String id){
            try{
              // modifySrudent = con.prepareStatement("UPDATE `student` SET `first_name` = ?, `last_name` = ?, `group` = ? WHERE (`id` = ?);");
                // заменили запрос
                modifySrudent.setString(1,newFirstSt); //первый параметр ?,
                modifySrudent.setString(2,newLastSt); //первый параметр ?,
                modifySrudent.setString(3,newGroupSt); //первый параметр ?,
                modifySrudent.setString(4,newDateSt); //первый параметр ?,
                modifySrudent.setString(5,id); //первый параметр ?,
                modifySrudent.execute();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    public static Student getStudentById(String id){
        Student student = new Student();
        try{
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from student WHERE status = 1 AND id = " + id);
            while (rs.next()){
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("last_name"));
                student.setFirstname(rs.getString("first_name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getString("date"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return student;


    }

    public static void deleteStudents(String ids){
        try{
            Statement stm = con.createStatement();
            stm.execute("UPDATE `student` SET `status` = '0' WHERE (`id` in ("+ids+"));");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public  static List<Term> getAllActiveTermStud(){
        LinkedList<Term> terms = new LinkedList<Term>();
        int lastTermId=-1;
        try{
            ResultSet rs = getAllActiveTermStud.executeQuery();
            while (rs.next()){
                if(lastTermId==-1) {
                    Term term = new Term();
                    term.setId(rs.getInt("id_term"));
                    term.setName(rs.getString("name"));
                    term.setDuration(rs.getString("duration"));

                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));

                    Mark mark = new Mark();
                    mark.setId(rs.getInt("id"));
                    mark.setGraduate(rs.getString("graduate"));

                    term.addDiscipline(discipline);
                    term.addMark(mark);
                    terms.add(term);

                    lastTermId=rs.getInt("id_term");
                }
                else {
                    int currentTermId = rs.getInt("id_term");
                    if(currentTermId  == lastTermId){

                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        Mark mark = new Mark();
                        mark.setId(rs.getInt("id"));
                        mark.setGraduate(rs.getString("graduate"));

                        Term lastTerm = terms.removeLast();
                        lastTerm.addDiscipline(discipline);
                        lastTerm.addMark(mark);
                        terms.add(lastTerm);
                        lastTermId = rs.getInt("id_term");

                    }
                    else {
                        Term term = new Term();
                        term.setId(rs.getInt("id_term"));
                        term.setName(rs.getString("name"));
                        term.setDuration(rs.getString("duration"));

                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        Mark mark = new Mark();
                        mark.setId(rs.getInt("id"));
                        mark.setGraduate(rs.getString("graduate"));

                        term.addDiscipline(discipline);
                        term.addMark(mark);
                        terms.add(term);
                        lastTermId=rs.getInt("id_term");
                    }
                }

            }
        }catch (Exception e){e.printStackTrace();}
        return  terms;
    }


}
