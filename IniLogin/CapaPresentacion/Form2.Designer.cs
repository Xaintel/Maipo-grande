namespace CapaPresentacion
{
    partial class ListadoU
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ListadoU));
            this.datacliente = new System.Windows.Forms.DataGridView();
            this.txtidUser = new System.Windows.Forms.TextBox();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.btnModificarUsu = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtnc = new System.Windows.Forms.TextBox();
            this.txtnn = new System.Windows.Forms.TextBox();
            this.txtContra = new System.Windows.Forms.TextBox();
            this.txtnombre = new System.Windows.Forms.TextBox();
            this.txtnombreusu = new System.Windows.Forms.TextBox();
            this.btnModificarSu = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.datacliente)).BeginInit();
            this.SuspendLayout();
            // 
            // datacliente
            // 
            this.datacliente.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.datacliente.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.datacliente.Location = new System.Drawing.Point(9, 9);
            this.datacliente.Margin = new System.Windows.Forms.Padding(0);
            this.datacliente.Name = "datacliente";
            this.datacliente.Size = new System.Drawing.Size(1032, 349);
            this.datacliente.TabIndex = 0;
            this.datacliente.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.datacliente_CellContentClick);
            // 
            // txtidUser
            // 
            this.txtidUser.Location = new System.Drawing.Point(225, 394);
            this.txtidUser.Name = "txtidUser";
            this.txtidUser.Size = new System.Drawing.Size(100, 29);
            this.txtidUser.TabIndex = 2;
            this.txtidUser.TextChanged += new System.EventHandler(this.txtidUser_TextChanged);
            // 
            // btnEliminar
            // 
            this.btnEliminar.FlatAppearance.BorderSize = 0;
            this.btnEliminar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnEliminar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnEliminar.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEliminar.ForeColor = System.Drawing.Color.Black;
            this.btnEliminar.Image = ((System.Drawing.Image)(resources.GetObject("btnEliminar.Image")));
            this.btnEliminar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEliminar.Location = new System.Drawing.Point(778, 385);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(260, 76);
            this.btnEliminar.TabIndex = 26;
            this.btnEliminar.Text = "       Eliminar Usuario";
            this.btnEliminar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // btnModificarUsu
            // 
            this.btnModificarUsu.FlatAppearance.BorderSize = 0;
            this.btnModificarUsu.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnModificarUsu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnModificarUsu.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnModificarUsu.ForeColor = System.Drawing.Color.Black;
            this.btnModificarUsu.Image = ((System.Drawing.Image)(resources.GetObject("btnModificarUsu.Image")));
            this.btnModificarUsu.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificarUsu.Location = new System.Drawing.Point(778, 488);
            this.btnModificarUsu.Name = "btnModificarUsu";
            this.btnModificarUsu.Size = new System.Drawing.Size(260, 76);
            this.btnModificarUsu.TabIndex = 27;
            this.btnModificarUsu.Text = "       Modificar Usuario";
            this.btnModificarUsu.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificarUsu.UseVisualStyleBackColor = true;
            this.btnModificarUsu.Click += new System.EventHandler(this.btnModificarUsu_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 397);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 24);
            this.label1.TabIndex = 28;
            this.label1.Text = "Rut Usuario:";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(22, 432);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(147, 24);
            this.label2.TabIndex = 29;
            this.label2.Text = "Nombre Cliente:";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(22, 470);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(178, 24);
            this.label3.TabIndex = 30;
            this.label3.Text = "Nombre de usuario:";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(22, 505);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(111, 24);
            this.label4.TabIndex = 31;
            this.label4.Text = "Contraseña:";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // txtnc
            // 
            this.txtnc.Location = new System.Drawing.Point(553, 429);
            this.txtnc.Name = "txtnc";
            this.txtnc.Size = new System.Drawing.Size(100, 29);
            this.txtnc.TabIndex = 32;
            this.txtnc.TextChanged += new System.EventHandler(this.txtnc_TextChanged);
            // 
            // txtnn
            // 
            this.txtnn.Location = new System.Drawing.Point(553, 394);
            this.txtnn.Name = "txtnn";
            this.txtnn.Size = new System.Drawing.Size(100, 29);
            this.txtnn.TabIndex = 33;
            this.txtnn.TextChanged += new System.EventHandler(this.txtnn_TextChanged);
            // 
            // txtContra
            // 
            this.txtContra.Location = new System.Drawing.Point(225, 502);
            this.txtContra.Name = "txtContra";
            this.txtContra.Size = new System.Drawing.Size(100, 29);
            this.txtContra.TabIndex = 34;
            this.txtContra.TextChanged += new System.EventHandler(this.txtContra_TextChanged);
            // 
            // txtnombre
            // 
            this.txtnombre.Location = new System.Drawing.Point(225, 467);
            this.txtnombre.Name = "txtnombre";
            this.txtnombre.Size = new System.Drawing.Size(100, 29);
            this.txtnombre.TabIndex = 35;
            this.txtnombre.TextChanged += new System.EventHandler(this.txtnombre_TextChanged);
            // 
            // txtnombreusu
            // 
            this.txtnombreusu.Location = new System.Drawing.Point(225, 429);
            this.txtnombreusu.Name = "txtnombreusu";
            this.txtnombreusu.Size = new System.Drawing.Size(100, 29);
            this.txtnombreusu.TabIndex = 36;
            this.txtnombreusu.TextChanged += new System.EventHandler(this.txtnombreusu_TextChanged);
            // 
            // btnModificarSu
            // 
            this.btnModificarSu.Location = new System.Drawing.Point(544, 470);
            this.btnModificarSu.Name = "btnModificarSu";
            this.btnModificarSu.Size = new System.Drawing.Size(119, 57);
            this.btnModificarSu.TabIndex = 37;
            this.btnModificarSu.Text = "Modificar";
            this.btnModificarSu.UseVisualStyleBackColor = true;
            this.btnModificarSu.Click += new System.EventHandler(this.btnModificarSu_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(333, 432);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(171, 24);
            this.label5.TabIndex = 38;
            this.label5.Text = "Contraseña Nueva:";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(333, 397);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(214, 24);
            this.label6.TabIndex = 39;
            this.label6.Text = "Nombre Usuario Nuevo:";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // ListadoU
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 24F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1050, 600);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnModificarSu);
            this.Controls.Add(this.txtnombreusu);
            this.Controls.Add(this.txtnombre);
            this.Controls.Add(this.txtContra);
            this.Controls.Add(this.txtnn);
            this.Controls.Add(this.txtnc);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnModificarUsu);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.txtidUser);
            this.Controls.Add(this.datacliente);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(6);
            this.Name = "ListadoU";
            this.Text = "Form2";
            this.Load += new System.EventHandler(this.ListadoU_Load);
            ((System.ComponentModel.ISupportInitialize)(this.datacliente)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView datacliente;
        private System.Windows.Forms.TextBox txtidUser;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.Button btnModificarUsu;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtnc;
        private System.Windows.Forms.TextBox txtnn;
        private System.Windows.Forms.TextBox txtContra;
        private System.Windows.Forms.TextBox txtnombre;
        private System.Windows.Forms.TextBox txtnombreusu;
        private System.Windows.Forms.Button btnModificarSu;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
    }
}