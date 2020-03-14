﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Municipalidad_Bases
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonLogin_Click(object sender, EventArgs e)
        {
            validarUsuasrio();
        }
        public void validarUsuasrio()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SPValidarUsuario";
                command.Parameters.Add("@usuario", SqlDbType.VarChar).Value = textUsuario.Text;
                command.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = textContrasena.Text;
                command.Connection = conn;
                conn.Open();

                SqlDataReader lector = command.ExecuteReader();
                if (lector.Read())
                {
                    Response.Redirect(@"\Default.aspx");
                    labelMensaje.Text = "";
                }
                else
                {
                    labelMensaje.Text = "El usuario o la contrasena no son correctos ";
                }
            }
        }
    }
}