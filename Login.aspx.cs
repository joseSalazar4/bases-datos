﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;

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

        public void ShowMessage(string message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "ERROR", sb.ToString());
        }

        public void validarUsuasrio()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand command = new SqlCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SPValidarUsuario";
                    command.Parameters.Add("@InUsuario", SqlDbType.VarChar).Value = textUsuario.Text;
                    command.Parameters.Add("@InContrasena", SqlDbType.VarChar).Value = textContrasena.Text;
                    command.Connection = conn;
                    conn.Open();

                    Session["User"] = textUsuario.Text;
                    string Tipo = (string)command.ExecuteScalar();
                    if (Tipo == "admin")
                    {
                        Response.Redirect(@"\Propiedades.aspx");
                    }
                    else if (Tipo == "cliente")
                    {
                        Response.Redirect(@"\ConsultaPropiedad.aspx");
                    }
                    else
                    {
                    }
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
    }
}