using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using Domain;
using System.Data.OracleClient;
using System.Security.Cryptography.X509Certificates;
using System.Drawing.Text;

namespace CapaPresentacion
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            lblErrorMessagge.Visible = false;
        }
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);


        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtuser_Enter(object sender, EventArgs e)
        {
            if (txtuser.Text == "USUARIO")
            {
                txtuser.Text = "";
                txtuser.ForeColor = Color.White;
            }
        }

        private void txtuser_Leave(object sender, EventArgs e)
        {
            if (txtuser.Text == "")
            {
                txtuser.Text = "USUARIO";
                txtuser.ForeColor = Color.White;
            }
        }

        private void txtpass_Enter(object sender, EventArgs e)
        {
            if (txtpass.Text == "CONTRASEÑA")
            {
                txtpass.Text = "";
                txtpass.ForeColor = Color.White;
                txtpass.UseSystemPasswordChar = true;

            }
        }

        private void txtpass_Leave(object sender, EventArgs e)
        {
            if (txtpass.Text == "")
            {
                txtpass.Text = "CONTRASEÑA";
                txtpass.ForeColor = Color.White;
            }
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Vas a salir de la aplicacion", "cuidado",
                MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                Application.Exit();
        }

        private void btnminimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtuser.Text != "USUARIO")
            {
                if (txtpass.Text != "CONTRASEÑA")
                {
                    UserModel usuario = new UserModel();
                    var valifLogin = usuario.LoginUser(txtuser.Text,txtpass.Text);
                    if(valifLogin == true)
                    {
                        ADMIN administrador = new ADMIN();
                        administrador.Show();
                        administrador.FormClosed += Logouth;
                        this.Hide();
                    }
                    else
                    {
                        msgError("ERROR");
                        txtpass.Clear();
                        txtpass.Focus();

                    }
                }
                else msgError("INGRESE CONTRASEÑA PORFAVOR");

            }
            else msgError("INGRESE USUARIO PORFAVOR");



        }

        private void msgError(string msg)
        {
            lblErrorMessagge.Text = "  " + msg;
            lblErrorMessagge.Visible = true;
        }

        private void Logouth(object sender,FormClosedEventArgs e)
        {
            txtpass.Clear();
            txtuser.Clear();
            lblErrorMessagge.Visible = false;
            this.Show();
            txtuser.Focus();

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void lblErrorMessagge_Click(object sender, EventArgs e)
        {

        }
    }
}



