using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Data;
using Domain;

namespace CapaPresentacion
{
    public partial class RegistroUsuarios : Form
    {
        public RegistroUsuarios()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void btnAgregar_Click(object sender, EventArgs e)//validar formulario
        {

            if (txtrut.Text.Trim() == "")
            {
                MessageBox.Show("Ingrese el Rut del usuario porfavor");
            }
            else
            {
                if (textNU.Text.Trim() == "")
                {
                    MessageBox.Show("Ingrese el Nombre de usario porfavor");

                }
                else
                {
                    if (textcontra.Text.Trim() == "")
                    {
                        MessageBox.Show("Ingrese la contraseña del usuari porfavor");
                    }
                    else
                    {
                        if (textnom.Text.Trim() == "")
                        {
                            MessageBox.Show("Ingrese el NOMBRE porfavor");
                        }
                        else
                        {
                            if (textapellidop.Text.Trim() == "")
                            {
                                MessageBox.Show("Ingrese el apellido Paterno del usuario porfavor");
                            }
                            else
                            {
                                if (textapellidoM.Text.Trim() == "")
                                {
                                    MessageBox.Show("Ingrese apellido materno del usuario porfavor");
                                }
                                else
                                {
                                    if (textdirec.Text.Trim() == "")
                                    {
                                        MessageBox.Show("Ingrese direccion del usuario porfavor");
                                    }
                                    else
                                    {
                                        if (textfono.Text.Trim() == "")
                                        {
                                            MessageBox.Show("Ingrese Telefono del usuario porfavor");
                                        }
                                        else
                                        {
                                            if (textcorreo.Text.Trim() == "")
                                            {
                                                MessageBox.Show("Ingrese Correo del usuario porfavor");
                                            }
                                            else
                                            {
                                                UserModel Agregar = new UserModel();
                                                int rut = Convert.ToInt32(txtrut.Text);
                                                var nombreU = textNU.Text;
                                                var contra = textcontra.Text;
                                                var nombre = textnom.Text;
                                                var ap = textapellidop.Text;
                                                var apM = textapellidoM.Text;
                                                var direccion = textdirec.Text;
                                                int id_region = cbRegion.SelectedIndex + 13;
                                                int id_comuna = cbComuna.SelectedIndex + 1;
                                                int celu = Convert.ToInt32(textfono.Text);
                                                var correo = textcorreo.Text;
                                                int rol = cbRol.SelectedIndex + 1;

                                                var Añadir = Agregar.IngresarUsuario(rut, nombreU, contra, nombre, ap, apM, direccion, id_region, id_comuna, celu, correo, rol);
                                                if (Añadir == false)
                                                {
                                                    MessageBox.Show("USUARIO AGREGADO");
                                                    if (textfono.Text.Length > 10)
                                                    {
                                                        MessageBox.Show("El numero de telefono es damasiado largo ");
                                                    }
                                                    txtrut.Clear();
                                                    textNU.Clear();
                                                    textcontra.Clear();
                                                    textnom.Clear();
                                                    textapellidop.Clear();
                                                    textapellidoM.Clear();
                                                    textdirec.Clear();
                                                    textfono.Clear();
                                                    textcorreo.Clear();

                                                }
                                                else
                                                {
                                                    MessageBox.Show("USUARIO No se a podido agregar el usuario");
                                                }
                                            }
                                        }
                                    }
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
                
                                
               

            //UserModel Agregar = new UserModel();
            //int rut = Convert.ToInt32(txtrut.Text);
            //var nombreU = textNU.Text;
            //var contra = textcontra.Text;
            //var nombre = textnom.Text;
            //var ap = textapellidop.Text;
            //var apM = textapellidoM.Text;
            //var direccion = textdirec.Text;
            //int id_region = cbRegion.SelectedIndex+13;
            //int id_comuna = cbComuna.SelectedIndex+1;
            //int celu = Convert.ToInt32(textfono.Text);
            //var correo = textcorreo.Text;
            //int rol = cbRol.SelectedIndex+1;


           
            

        private void RegistroUsuarios_Load(object sender, EventArgs e)
        {
            UserDao cobxC = new UserDao();
            cbRegion.DataSource = cobxC.DatosRegion();
            cbRegion.DisplayMember = "NOMBRE_REGION";
            cbRegion.ValueMember = "ID_REGION";

            cbComuna.DataSource = cobxC.DatosComuna();
            cbComuna.DisplayMember = "NOMBRE_COMUNA";
            cbComuna.ValueMember = "ID_COMUNA";

            cbRol.DataSource = cobxC.DatosRoles();
            cbRol.DisplayMember = "TIPO_ROL";
            cbRol.ValueMember = "ID_ROL";

        }

        private void txtrut_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtcontra_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtrut_Validated(object sender, EventArgs e)
        {
            if(txtrut.Text.Trim()==""){
                MessageBox.Show("Ingrese el rut porfavor");
            }
        }

        private void txtrut_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else
                if (Char.IsControl(e.KeyChar)) //permitir teclas de control como retroceso
                {
                e.Handled = false;
                }
                else
                {
                //el resto de teclas pulsadas se desactivan
                e.Handled = true;
                }
        }

        private void textfono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            if (Char.IsControl(e.KeyChar)) //permitir teclas de control como retroceso
            {
                e.Handled = false;
            }
            else
            {
                //el resto de teclas pulsadas se desactivan
                e.Handled = true;
            }
        }
    }
}
