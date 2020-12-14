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



namespace CapaPresentacion
{
    public partial class ADMIN : Form
    {
        public ADMIN()
        {
            InitializeComponent();
        }
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

        private void btnMenu_Click(object sender, EventArgs e)
        {
            
            if (MenuVertical.Width == 250)
            {
                MenuVertical.Width = 95;
                pictureBox1.Visible = false;
            }
            else
            {
                MenuVertical.Width = 250;
                pictureBox1.Visible = true;

            }

        }

        private void panelContenedor_Paint(object sender, PaintEventArgs e)
        {

        }

        private void iconCerrar_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("Vas a salir de la aplicacion", "cuidado",
            MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                this.Close();
        }



        private void iconMin_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void BarraTitulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle,0x112,0xf012,0);
        }

        private void btnProducto_Click(object sender, EventArgs e)
        {
            AbrirFormHija(new Form3());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AbrirFormHija(new ListadoU());
        }
        private void AbrirFormHija(object formhija)
        {
            if (this.panelContenedor.Controls.Count > 0)
                this.panelContenedor.Controls.RemoveAt(0);
            Form ru = formhija as Form;
            ru.TopLevel = false;
            ru.Dock = DockStyle.None;
            this.panelContenedor.Controls.Add(ru);
            this.panelContenedor.Tag = ru;
            ru.Show();
        }

        private void Btn_Usuario_Click(object sender, EventArgs e)
        {
            AbrirFormHija(new RegistroUsuarios());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Vas a salir de la aplicacion","cuidado",
                MessageBoxButtons.YesNo, MessageBoxIcon.Warning)==DialogResult.Yes)
            this.Close();
        }

        private void btnventa_Click(object sender, EventArgs e)
        {

        }
    }
}
