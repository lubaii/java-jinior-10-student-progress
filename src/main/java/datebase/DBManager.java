package datebase;

import entity.Discipline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static Connection con;

    static {
        try{

           // Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
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



}
