using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Data
{
    public class UserDao : Conexion
    {
        public bool eliminarSU(int rut)
        {
            using (var connection = GetConnection())
            {
                connection.Open();

                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "DELETE from usuario where rut_usuario = :rut";
                    comand.Parameters.AddWithValue(":rut", rut);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        public bool eliminarContrato(int idC)
        {
            using (var connection = GetConnection())
            {
                connection.Open();

                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "DELETE from Contrato where id_contrato = :id_contrato";
                    comand.Parameters.AddWithValue(":id_contrato", idC);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        public bool ModificarUsu(int rut, string nombreUsuario, string contra)
        {
            using (var connection = GetConnection())
            {
                connection.Open();

                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "update usuario set nombre_usuario= :nombreUsuario ,contrasenia = :contra where rut_usuario= :rut";
                    comand.Parameters.AddWithValue(":rut", rut);
                    comand.Parameters.AddWithValue(":nombreUsuario", nombreUsuario);
                    comand.Parameters.AddWithValue(":contra", contra);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        public bool ModificarContrato(int id, DateTime FechaTermino)
        {
            using (var connection = GetConnection())
            {
                connection.Open();

                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "update contrato set Fecha_termino= :Ftermino where id_contrato =:id";
                    comand.Parameters.AddWithValue(":id", id);
                    comand.Parameters.AddWithValue(":Ftermino", FechaTermino);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }


        public DataTable DatosContratos()
        {
            DataTable dt = new DataTable();
            OracleConnection cnn = new OracleConnection("DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;");
            string query = "SELECT * FROM Contrato";
            OracleCommand command = new OracleCommand(query, cnn);
            OracleDataAdapter da = new OracleDataAdapter(command);
            da.Fill(dt);
            return dt;
        }


        public DataTable DatosUsuarios()
        {
            DataTable dt = new DataTable();
            OracleConnection cnn = new OracleConnection("DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;");
            string query = "select  u.rut_usuario,u.nombre_usuario,u.contrasenia,u.nombre,u.apellido_paterno,u.apellido_materno,u.direccion,re.nombre_region,u.telefono_celular,u.correo_electronico,r.tipo_rol from usuario u left join roles r on u.id_rol = r.id_rol left join region re on u.id_region = re.id_region";
            OracleCommand command = new OracleCommand(query, cnn);
            OracleDataAdapter da = new OracleDataAdapter(command);
            da.Fill(dt);
            return dt;
        }


        public bool IngresarUsuario(int rut, string nombreUsuario, string contra, string nombre, string apellidop, string apellidom, string dirc, int region, int comuna, int telefono, string correo, int rol)
        {
            using (var connection = GetConnection())
            {
                connection.Open();

                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "INSERT INTO USUARIO(RUT_USUARIO, NOMBRE_USUARIO, CONTRASENIA, NOMBRE, " +
                                         "APELLIDO_PATERNO, APELLIDO_MATERNO, DIRECCION, ID_REGION, ID_COMUNA, " +
                                         "TELEFONO_CELULAR, CORREO_ELECTRONICO, ID_ROL)" +
                                         "VALUES(:rut, :nombreUsuario, :contra, :nombre, :apellidop, :apellidom, :dirc ," +
                                         ":region, :comuna, :telefono, :correo, :rol ) ";
                    comand.Parameters.AddWithValue(":rut", rut);
                    comand.Parameters.AddWithValue(":nombreUsuario", nombreUsuario);
                    comand.Parameters.AddWithValue(":contra", contra);
                    comand.Parameters.AddWithValue(":nombre", nombre);
                    comand.Parameters.AddWithValue(":apellidop", apellidop);
                    comand.Parameters.AddWithValue(":apellidom", apellidom);
                    comand.Parameters.AddWithValue(":dirc", dirc);
                    comand.Parameters.AddWithValue(":region", region);
                    comand.Parameters.AddWithValue(":comuna", comuna);
                    comand.Parameters.AddWithValue(":telefono", telefono);
                    comand.Parameters.AddWithValue(":correo", correo);
                    comand.Parameters.AddWithValue(":rol", rol);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }



        public DataTable DatosRegion()
        {
            DataTable dt = new DataTable();
            OracleConnection cnn = new OracleConnection("DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;");
                string query = "select * from region";
            OracleCommand command = new OracleCommand(query, cnn);
            OracleDataAdapter da = new OracleDataAdapter(command);
            da.Fill(dt);
            return dt;
        }

        public DataTable DatosComuna()
        {
            DataTable dt = new DataTable();
            OracleConnection cnn = new OracleConnection("DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;");
            string query = "select * from comuna";
            OracleCommand command = new OracleCommand(query, cnn);
            OracleDataAdapter da = new OracleDataAdapter(command);
            da.Fill(dt);
            return dt;
        }


        public DataTable DatosRoles()
        {
            DataTable dt = new DataTable();
            OracleConnection cnn = new OracleConnection("DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;");
            string query = "select * from roles";
            OracleCommand command = new OracleCommand(query, cnn);
            OracleDataAdapter da = new OracleDataAdapter(command);
            da.Fill(dt);
            return dt;
        }


        public bool Login(string nombreUsuario, string contrasenia){
            using (var connection = GetConnection()){
                connection.Open();
                
                using (var comand = new OracleCommand())
                {
                    comand.Connection = connection;
                    comand.CommandText = "SELECT * from usuario where NOMBRE_USUARIO = :usu and CONTRASENIA = :pass and id_rol = 1";
                    comand.Parameters.AddWithValue(":usu", nombreUsuario);
                    comand.Parameters.AddWithValue(":pass", contrasenia);
                    comand.CommandType = CommandType.Text;
                    OracleDataReader reader = comand.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }
}
