/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kos;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Work
 */
public class Koneksi {
    Connection con;
    Statement st;
    ResultSet rs;
    
    public Koneksi(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/kos","root", "");
            st = (Statement) con.createStatement();
            
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println("Error : "+ex);
        }
    } 
}
