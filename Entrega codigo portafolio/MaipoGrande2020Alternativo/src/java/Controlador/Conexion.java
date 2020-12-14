/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author inter
 */
public class Conexion {
    Connection conn;
    
    
    private String url = "jdbc:oracle:thin:@localhost:1521/XE";
    private String user = "ADMIN";
    private String pass = "123";
    
    public Conexion(){
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error" + e);
        } 
    }
    
    public Connection getConnection(){
        return conn;
    }
    

}
