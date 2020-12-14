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
    public partial class ListadoU : Form
    {
        public ListadoU()
        {
            InitializeComponent();
        }

        private void ListadoU_Load(object sender, EventArgs e)
        {
            UserDao data = new UserDao();
            datacliente.DataSource = data.DatosUsuarios();
            txtidUser.Visible = false;
            txtContra.Visible = false;
            txtnc.Visible = false;
            txtnn.Visible = false;
            txtnombre.Visible = false;
            txtnombreusu.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;
            label4.Visible = false;
            label5.Visible = false;
            label6.Visible = false;
            btnModificarSu.Visible = false;
        }

        private void datacliente_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtidUser.Text = datacliente.CurrentRow.Cells[0].Value.ToString();
            txtnombre.Text = datacliente.CurrentRow.Cells[3].Value.ToString();
            txtnombreusu.Text = datacliente.CurrentRow.Cells[1].Value.ToString();
            txtContra.Text = datacliente.CurrentRow.Cells[2].Value.ToString();
        }

        private void btnEliminar_Click(object sender, EventArgs e)// validar boton 
        {
            UserModel Eliminar = new UserModel();
            if (txtidUser.Text.Trim()=="")
            {
                MessageBox.Show("Ingrese un Usurio para eliminar");
            }
            else
            {
                int id = Convert.ToInt32(txtidUser.Text);
                var Deleted = Eliminar.eliminarUsuario(id);
                if (Deleted == false)
                {
                    MessageBox.Show("Eliminado");
                    txtidUser.Text = "";
                    UserDao data = new UserDao();
                    datacliente.DataSource = data.DatosUsuarios();
                    if (txtidUser.Text.Length == 0)
                    {
                        MessageBox.Show("Ingrese un Usurio para eliminar  ");
                    }
                    txtidUser.Clear(); ;

                }
                else
                {
                    MessageBox.Show("USUARIO No se a podido Eliminar el usuario");
                }
            }
            
        }

        private void btnModificarUsu_Click(object sender, EventArgs e)
        {
            txtidUser.Visible = true;
            txtContra.Visible = true;
            txtnc.Visible = true;
            txtnn.Visible = true;
            txtnombre.Visible = true;
            txtnombreusu.Visible = true;
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = true;
            label4.Visible = true;
            label5.Visible = true;
            label6.Visible = true;
            btnModificarSu.Visible = true;
            //traer datos
            //bloquear datos 
            txtContra.Enabled = false;
            txtidUser.Enabled = false;
            txtnombreusu.Enabled = false;
            txtnombre.Enabled = false; 

        }

        private void btnModificarSu_Click(object sender, EventArgs e)
        {
            UserModel modificar = new UserModel();
            if (txtidUser.Text.Trim()=="")
            {
                MessageBox.Show("Ingrese un Usurio para Modificar");
            }
            else
            {
                int id = Convert.ToInt32(txtidUser.Text);
                var modif = modificar.ModificarUsuario(id, txtnn.Text, txtnc.Text);//validacion de txt para que no esten vacios 
                txtidUser.Text = "";
                UserDao data = new UserDao();
                datacliente.DataSource = data.DatosUsuarios();
                txtidUser.Visible = false;
                txtContra.Visible = false;
                txtnc.Visible = false;
                txtnn.Visible = false;
                txtnombre.Visible = false;
                txtnombreusu.Visible = false;
                label1.Visible = false;
                label2.Visible = false;
                label3.Visible = false;
                label4.Visible = false;
                label5.Visible = false;
                label6.Visible = false;
                btnModificarSu.Visible = false;
            }
            
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtnombreusu_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtContra_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnn_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnc_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtidUser_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
