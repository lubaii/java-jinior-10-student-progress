package datebase;

import entity.Discipline;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static Connection con;
    private static PreparedStatement modifyDiscipline; // переменная статик не может использована в статик блоке
    //private static PreparedStatement deleteDiscipline;


    static {
        try{

           // Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
            modifyDiscipline =con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);");
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


}
