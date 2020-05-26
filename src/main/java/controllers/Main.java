package controllers;

import datebase.DBManager;

import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) {

     /*   Pattern pattern = Pattern.compile("\\w+\\s?");
        //String[] words = pattern.split("java5tiger 77 java6mustang");
        String[] words = pattern.split("модель мира,физика");
       System.out.print(Arrays.toString(words));*/

     /*  if(ids.contains("'undefined'")){
            ids =ids.replace(",'undefined'","");
        }*/
        String [] wos = new String[] {"модель мира,физика"};
        List<String> strList = new ArrayList<String>();
        String str = Arrays.toString(wos);
       // if(str.contains("[")||str.contains("]")){
         str= str.replace("]","");
         str= str.replace("[","");
           // str.replaceAll("[","");
      //  }
        for(String s :str.split(",")){
            strList.add(s);
        }
        System.out.print(Arrays.toString(wos));

       /* try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "Atb31423111986");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Integer s = 5;
        ArrayList<Integer> list = new ArrayList<Integer>();
         list.add(2);
         list.add(7);
         list.add(3);*/



    }
}
