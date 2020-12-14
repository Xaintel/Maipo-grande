namespace CapaPresentacion
{
    partial class RegistroUsuarios
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RegistroUsuarios));
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.cbRegion = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.cbComuna = new System.Windows.Forms.ComboBox();
            this.cbRol = new System.Windows.Forms.ComboBox();
            this.txtrut = new System.Windows.Forms.TextBox();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.textnom = new System.Windows.Forms.TextBox();
            this.textapellidop = new System.Windows.Forms.TextBox();
            this.textapellidoM = new System.Windows.Forms.TextBox();
            this.textdirec = new System.Windows.Forms.TextBox();
            this.textfono = new System.Windows.Forms.TextBox();
            this.textcorreo = new System.Windows.Forms.TextBox();
            this.textNU = new System.Windows.Forms.TextBox();
            this.textcontra = new System.Windows.Forms.TextBox();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe Print", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(189, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(454, 64);
            this.label1.TabIndex = 0;
            this.label1.Text = "Ingresar nuevo usuario";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 118);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 28);
            this.label2.TabIndex = 1;
            this.label2.Text = "Rut:";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(608, 111);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(245, 28);
            this.label3.TabIndex = 2;
            this.label3.Text = "Nombre de Usuario:";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(12, 241);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(218, 28);
            this.label4.TabIndex = 3;
            this.label4.Text = "Apellido materno:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(11, 200);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(212, 28);
            this.label5.TabIndex = 4;
            this.label5.Text = "Apellido paterno:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(12, 159);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(113, 28);
            this.label6.TabIndex = 5;
            this.label6.Text = "Nombre:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(608, 184);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(154, 28);
            this.label7.TabIndex = 6;
            this.label7.Text = "Contraseña:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(11, 283);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(133, 28);
            this.label8.TabIndex = 7;
            this.label8.Text = "Direccion:";
            // 
            // cbRegion
            // 
            this.cbRegion.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbRegion.FormattingEnabled = true;
            this.cbRegion.Location = new System.Drawing.Point(257, 319);
            this.cbRegion.Name = "cbRegion";
            this.cbRegion.Size = new System.Drawing.Size(234, 32);
            this.cbRegion.TabIndex = 8;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(11, 323);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(101, 28);
            this.label9.TabIndex = 9;
            this.label9.Text = "Region:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(10, 364);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(115, 28);
            this.label10.TabIndex = 10;
            this.label10.Text = "Comuna:";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(12, 405);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(120, 28);
            this.label11.TabIndex = 11;
            this.label11.Text = "Telefono:";
            this.label11.Click += new System.EventHandler(this.label11_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(12, 437);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(102, 28);
            this.label12.TabIndex = 12;
            this.label12.Text = "Correo:";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Arial Rounded MT Bold", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.Location = new System.Drawing.Point(13, 465);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(58, 28);
            this.label13.TabIndex = 13;
            this.label13.Text = "Rol:";
            this.label13.Click += new System.EventHandler(this.label13_Click);
            // 
            // cbComuna
            // 
            this.cbComuna.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbComuna.FormattingEnabled = true;
            this.cbComuna.Location = new System.Drawing.Point(257, 360);
            this.cbComuna.Name = "cbComuna";
            this.cbComuna.Size = new System.Drawing.Size(234, 32);
            this.cbComuna.TabIndex = 14;
            // 
            // cbRol
            // 
            this.cbRol.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbRol.FormattingEnabled = true;
            this.cbRol.Location = new System.Drawing.Point(257, 480);
            this.cbRol.Name = "cbRol";
            this.cbRol.Size = new System.Drawing.Size(234, 32);
            this.cbRol.TabIndex = 15;
            // 
            // txtrut
            // 
            this.txtrut.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtrut.Location = new System.Drawing.Point(257, 111);
            this.txtrut.MaxLength = 9;
            this.txtrut.Multiline = true;
            this.txtrut.Name = "txtrut";
            this.txtrut.Size = new System.Drawing.Size(234, 35);
            this.txtrut.TabIndex = 18;
            this.txtrut.TextChanged += new System.EventHandler(this.txtcontra_TextChanged);
            this.txtrut.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtrut_KeyPress);
            this.txtrut.Validated += new System.EventHandler(this.txtrut_Validated);
            // 
            // btnAgregar
            // 
            this.btnAgregar.FlatAppearance.BorderSize = 0;
            this.btnAgregar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregar.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregar.ForeColor = System.Drawing.Color.Black;
            this.btnAgregar.Image = ((System.Drawing.Image)(resources.GetObject("btnAgregar.Image")));
            this.btnAgregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAgregar.Location = new System.Drawing.Point(613, 283);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(260, 76);
            this.btnAgregar.TabIndex = 25;
            this.btnAgregar.Text = "       Agregar Usuario";
            this.btnAgregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // textnom
            // 
            this.textnom.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textnom.Location = new System.Drawing.Point(257, 152);
            this.textnom.MaxLength = 10;
            this.textnom.Multiline = true;
            this.textnom.Name = "textnom";
            this.textnom.Size = new System.Drawing.Size(234, 35);
            this.textnom.TabIndex = 26;
            // 
            // textapellidop
            // 
            this.textapellidop.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textapellidop.Location = new System.Drawing.Point(257, 193);
            this.textapellidop.MaxLength = 10;
            this.textapellidop.Multiline = true;
            this.textapellidop.Name = "textapellidop";
            this.textapellidop.Size = new System.Drawing.Size(234, 35);
            this.textapellidop.TabIndex = 27;
            // 
            // textapellidoM
            // 
            this.textapellidoM.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textapellidoM.Location = new System.Drawing.Point(257, 234);
            this.textapellidoM.MaxLength = 10;
            this.textapellidoM.Multiline = true;
            this.textapellidoM.Name = "textapellidoM";
            this.textapellidoM.Size = new System.Drawing.Size(234, 35);
            this.textapellidoM.TabIndex = 28;
            // 
            // textdirec
            // 
            this.textdirec.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textdirec.Location = new System.Drawing.Point(257, 276);
            this.textdirec.MaxLength = 25;
            this.textdirec.Multiline = true;
            this.textdirec.Name = "textdirec";
            this.textdirec.Size = new System.Drawing.Size(234, 35);
            this.textdirec.TabIndex = 29;
            // 
            // textfono
            // 
            this.textfono.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textfono.Location = new System.Drawing.Point(257, 398);
            this.textfono.MaxLength = 9;
            this.textfono.Multiline = true;
            this.textfono.Name = "textfono";
            this.textfono.Size = new System.Drawing.Size(234, 35);
            this.textfono.TabIndex = 30;
            this.textfono.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textfono_KeyPress);
            // 
            // textcorreo
            // 
            this.textcorreo.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textcorreo.Location = new System.Drawing.Point(257, 439);
            this.textcorreo.MaxLength = 50;
            this.textcorreo.Multiline = true;
            this.textcorreo.Name = "textcorreo";
            this.textcorreo.Size = new System.Drawing.Size(234, 35);
            this.textcorreo.TabIndex = 31;
            // 
            // textNU
            // 
            this.textNU.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textNU.Location = new System.Drawing.Point(613, 142);
            this.textNU.MaxLength = 25;
            this.textNU.Multiline = true;
            this.textNU.Name = "textNU";
            this.textNU.Size = new System.Drawing.Size(234, 35);
            this.textNU.TabIndex = 32;
            // 
            // textcontra
            // 
            this.textcontra.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textcontra.Location = new System.Drawing.Point(613, 215);
            this.textcontra.MaxLength = 25;
            this.textcontra.Multiline = true;
            this.textcontra.Name = "textcontra";
            this.textcontra.Size = new System.Drawing.Size(234, 35);
            this.textcontra.TabIndex = 33;
            // 
            // RegistroUsuarios
            // 
            this.AccessibleName = "";
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(954, 622);
            this.Controls.Add(this.textcontra);
            this.Controls.Add(this.textNU);
            this.Controls.Add(this.textcorreo);
            this.Controls.Add(this.textfono);
            this.Controls.Add(this.textdirec);
            this.Controls.Add(this.textapellidoM);
            this.Controls.Add(this.textapellidop);
            this.Controls.Add(this.textnom);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.txtrut);
            this.Controls.Add(this.cbRol);
            this.Controls.Add(this.cbComuna);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.cbRegion);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "RegistroUsuarios";
            this.Text = "RegistroUsuarios";
            this.Load += new System.EventHandler(this.RegistroUsuarios_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox cbRegion;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ComboBox cbComuna;
        private System.Windows.Forms.ComboBox cbRol;
        private System.Windows.Forms.TextBox txtrut;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.TextBox textnom;
        private System.Windows.Forms.TextBox textapellidop;
        private System.Windows.Forms.TextBox textapellidoM;
        private System.Windows.Forms.TextBox textdirec;
        private System.Windows.Forms.TextBox textfono;
        private System.Windows.Forms.TextBox textcorreo;
        private System.Windows.Forms.TextBox textNU;
        private System.Windows.Forms.TextBox textcontra;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
    }
}