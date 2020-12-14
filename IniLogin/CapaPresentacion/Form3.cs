using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Domain;
using Data;

namespace CapaPresentacion
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
            txtidC.Visible = false;
            timeC.Visible = false;
            btnModificarC.Visible = false;
        }


        private void datacliente_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtidC.Text = dataContrato.CurrentRow.Cells[0].Value.ToString();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            UserDao data = new UserDao();
            dataContrato.DataSource = data.DatosContratos();
            dataContrato.Columns[0].HeaderText = "ID Contrato";
            dataContrato.Columns[1].HeaderText = "Rut del usario";
            dataContrato.Columns[2].HeaderText = "Fecha inicio Contrato";
            dataContrato.Columns[3].HeaderText = "Fecha termino Contrato";
            dataContrato.Columns[0].Width = 100;
            dataContrato.Columns[1].Width = 200;
            dataContrato.Columns[2].Width = 200;
            dataContrato.Columns[3].Width = 200;

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            UserModel Eliminar = new UserModel();
            if(txtidC.Text.Trim() == "")
            {
                MessageBox.Show("Selecciones un contrato para eliminar  ");
            }
            else
            {
                int id = Convert.ToInt32(txtidC.Text);
                var Deleted = Eliminar.eliminarContrato(id);
                if (Deleted == false)
                {
                    MessageBox.Show("Contrato Eliminado");
                    txtidC.Text = "";
                    UserDao data = new UserDao();
                    dataContrato.DataSource = data.DatosContratos();
                    if (txtidC.Text.Trim() == "")
                    {
                        MessageBox.Show("Selecciones un contrato para eliminar  ");
                    }
                    txtidC.Clear(); ;

                }
                else
                {
                    MessageBox.Show("Contrato No se a podido Eliminar el usuario");
                }
            }
            
        }

        private void btnModificarUsu_Click(object sender, EventArgs e)
        {
            txtidC.Visible = true;
            timeC.Visible = true;
            btnModificarC.Visible = true;

        }

        private void btnModificarC_Click(object sender, EventArgs e)
        {
            UserModel modificar = new UserModel();
            if (txtidC.Text.Trim() == "")
            {
                MessageBox.Show("Ingrese un Contrato para Modificar");
            }
            else
            {
                int id = Convert.ToInt32(txtidC.Text);
                var modif = modificar.ModificarContrato(id, timeC.Value);//validacion de txt para que no esten vacios 
                txtidC.Text = "";
                UserDao data = new UserDao();
                dataContrato.DataSource = data.DatosContratos();
                txtidC.Visible = false;
                timeC.Visible = false;
                btnModificarC.Visible = false;

            }
        }
    }
}

