/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author inter
 */
public class Consultas extends Conexion{
    //creacion de login
     public boolean autenticacion(String usuario, String pass, int id_rol){
         PreparedStatement pst = null;
         ResultSet rs = null;
         /*Conexion a la base de datos*/
         try {
             String consulta = "SELECT * FROM USUARIO WHERE NOMBRE_USUARIO = ? AND CONTRASENIA = ? AND ID_ROL = ?";
             /* Conectarse y llamar a la consulta con preparedStatement */
             pst  = getConnection().prepareStatement(consulta);
             pst.setString(1, usuario);
             pst.setString(2, pass);
             pst.setInt(3, id_rol);
             /* Guardar resultado con result set */
             rs = pst.executeQuery();
             if(rs.next()){
                 return true;
             }
             
         }catch (SQLException e) {
             System.out.println("Error" + e);
         }finally{
             try {
                 if(getConnection() !=  null) {
                    getConnection().close();
                    }if(pst != null){
                        pst.close();
                    }if(rs != null){
                        rs.close();
                    }
             } catch (SQLException e) {
             }
         }
        return false; 
     }
}
