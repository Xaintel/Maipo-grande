using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;

namespace Domain
{
    public class UserModel
    {
        UserDao userDao = new UserDao();

        //atributos
        private int rut;
        private string nombreU;
        private string contra;
        private string nombre;
        private string apellidoP;
        private string apellidoM;
        private string direccion;
        private int id_region;
        private int id_comuna;
        private int numero_celular;
        private string correo;
        private  int id_rol;

        public UserModel(int rut, string nombreU, string contra, string nombre, string apellidoP, string apellidoM, string direccion, int id_region, int id_comuna, int numero_celular, string correo, int id_rol)
        {
            this.rut = rut;
            this.nombreU = nombreU;
            this.contra = contra;
            this.nombre = nombre;
            this.apellidoP = apellidoP;
            this.apellidoM = apellidoM;
            this.direccion = direccion;
            this.id_region = id_region;
            this.id_comuna = id_comuna;
            this.numero_celular = numero_celular;
            this.correo = correo;
            this.id_rol = id_rol;
        }

        public UserModel()
        {

        }

        public bool IngresarUsuario(int rut, string nombreU, string contra, string nombre, string apellidoP, string apellidoM, string direccion, int id_region, int id_comuna, int numero_celular, string correo, int id_rol)
        {
            
            
                return userDao.IngresarUsuario(rut, nombreU, contra, nombre, apellidoP, apellidoM, direccion, id_region, id_comuna, numero_celular, correo, id_rol);
                
            
          
            
        }
        public bool eliminarUsuario (int rut)
        {
            return userDao.eliminarSU(rut);
        }
        public bool eliminarContrato(int idC)
        {
            return userDao.eliminarContrato(idC);
        }

        public bool ModificarUsuario (int rut , string nombreU , string contra)
        {
            return userDao.ModificarUsu(rut , nombreU, contra);
        }

        public bool ModificarContrato(int id, DateTime Fechatermino)
        {
            return userDao.ModificarContrato(id,Fechatermino);
        }

        public bool LoginUser(string nombre, string contrasenia)
        {
            return userDao.Login(nombre,contrasenia
                );
        } 
    }
}
