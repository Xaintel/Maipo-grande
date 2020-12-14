namespace CapaPresentacion
{
    partial class Form3
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form3));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnModificarC = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnModificarUsu = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.txtidC = new System.Windows.Forms.TextBox();
            this.dataContrato = new System.Windows.Forms.DataGridView();
            this.timeC = new System.Windows.Forms.DateTimePicker();
            ((System.ComponentModel.ISupportInitialize)(this.dataContrato)).BeginInit();
            this.SuspendLayout();
            // 
            // btnModificarC
            // 
            this.btnModificarC.Location = new System.Drawing.Point(752, 345);
            this.btnModificarC.Name = "btnModificarC";
            this.btnModificarC.Size = new System.Drawing.Size(119, 57);
            this.btnModificarC.TabIndex = 53;
            this.btnModificarC.Text = "Modificar";
            this.btnModificarC.UseVisualStyleBackColor = true;
            this.btnModificarC.Click += new System.EventHandler(this.btnModificarC_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(-103, 444);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(64, 13);
            this.label4.TabIndex = 47;
            this.label4.Text = "Contraseña:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(-103, 409);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 13);
            this.label3.TabIndex = 46;
            this.label3.Text = "Nombre de usuario:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(-103, 371);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(82, 13);
            this.label2.TabIndex = 45;
            this.label2.Text = "Nombre Cliente:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(-103, 336);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 13);
            this.label1.TabIndex = 44;
            this.label1.Text = "Rut Usuario:";
            // 
            // btnModificarUsu
            // 
            this.btnModificarUsu.FlatAppearance.BorderSize = 0;
            this.btnModificarUsu.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnModificarUsu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnModificarUsu.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnModificarUsu.ForeColor = System.Drawing.Color.Black;
            this.btnModificarUsu.Image = ((System.Drawing.Image)(resources.GetObject("btnModificarUsu.Image")));
            this.btnModificarUsu.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificarUsu.Location = new System.Drawing.Point(762, 143);
            this.btnModificarUsu.Name = "btnModificarUsu";
            this.btnModificarUsu.Size = new System.Drawing.Size(260, 76);
            this.btnModificarUsu.TabIndex = 43;
            this.btnModificarUsu.Text = "       Modificar Contrato";
            this.btnModificarUsu.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificarUsu.UseVisualStyleBackColor = true;
            this.btnModificarUsu.Click += new System.EventHandler(this.btnModificarUsu_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.FlatAppearance.BorderSize = 0;
            this.btnEliminar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnEliminar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnEliminar.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEliminar.ForeColor = System.Drawing.Color.Black;
            this.btnEliminar.Image = ((System.Drawing.Image)(resources.GetObject("btnEliminar.Image")));
            this.btnEliminar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEliminar.Location = new System.Drawing.Point(762, 51);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(276, 71);
            this.btnEliminar.TabIndex = 42;
            this.btnEliminar.Text = "       Eliminar Contrato";
            this.btnEliminar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // txtidC
            // 
            this.txtidC.Location = new System.Drawing.Point(752, 282);
            this.txtidC.Name = "txtidC";
            this.txtidC.Size = new System.Drawing.Size(100, 20);
            this.txtidC.TabIndex = 41;
            // 
            // dataContrato
            // 
            this.dataContrato.AllowUserToAddRows = false;
            this.dataContrato.Anchor = System.Windows.Forms.AnchorStyles.None;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataContrato.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dataContrato.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataContrato.DefaultCellStyle = dataGridViewCellStyle2;
            this.dataContrato.Location = new System.Drawing.Point(19, 23);
            this.dataContrato.Margin = new System.Windows.Forms.Padding(0);
            this.dataContrato.Name = "dataContrato";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.Format = "d";
            dataGridViewCellStyle3.NullValue = null;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataContrato.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dataContrato.Size = new System.Drawing.Size(730, 554);
            this.dataContrato.TabIndex = 40;
            this.dataContrato.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.datacliente_CellContentClick);
            // 
            // timeC
            // 
            this.timeC.Location = new System.Drawing.Point(752, 308);
            this.timeC.Name = "timeC";
            this.timeC.Size = new System.Drawing.Size(200, 20);
            this.timeC.TabIndex = 54;
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1050, 596);
            this.Controls.Add(this.timeC);
            this.Controls.Add(this.btnModificarC);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnModificarUsu);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.txtidC);
            this.Controls.Add(this.dataContrato);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MinimizeBox = false;
            this.Name = "Form3";
            this.Text = "Form3";
            this.Load += new System.EventHandler(this.Form3_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataContrato)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnModificarC;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnModificarUsu;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.TextBox txtidC;
        private System.Windows.Forms.DataGridView dataContrato;
        private System.Windows.Forms.DateTimePicker timeC;
    }
}