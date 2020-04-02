﻿using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;


namespace Municipalidad_Bases
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaDatosUsuario();
            }
        }


        //--------------//
        //    SELECT
        //--------------//
        public void CargaDatosUsuario()  //ACÁ DEBEMOS COLOCAR LAS PROPIEDAADES WHERE ID SEA IGUAL AL DEL PROPIETARIO TONS MUESTRE. No los users.
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSUsuario";
                cmd.Connection = conn;
                conn.Open();
                gridViewUsuarios.DataSource = cmd.ExecuteReader();
                gridViewUsuarios.DataBind();
            }
        }

        //--------------//
        //   INSERT
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                gridViewUsuarios.Columns[0].Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPIUsuario";
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = TextBoxPassword.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                gridViewUsuarios.Columns[0].Visible = false;
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            labelNombre.Text = "Nombre";
            labelPassword.Text = "Password";
            botonGuardar.Visible = true;
            botonActualizar.Visible = false;
            pnlDatosUsuarios.Visible = false;
            pnlAltaUsuarios.Visible = true;
        }

        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
            TextBoxNombre.Text = "";
            TextBoxPassword.Text = "";
        }

        //--------------//
        //    DELETE
        //--------------//
        public void eliminarUsuario(string idAlumno)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPDUsuario";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(idAlumno);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gridViewUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            gridViewUsuarios.Columns[0].Visible = true;
            GridViewRow row = (GridViewRow)gridViewUsuarios.Rows[e.RowIndex];
            eliminarUsuario(gridViewUsuarios.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
            gridViewUsuarios.Columns[0].Visible = false;
        }

        //--------------//
        //    UPDATE
        //--------------//
        public void actualizarUsuario(int ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUUsuario";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = TextBoxPassword.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            gridViewUsuarios.Columns[0].Visible = true;
            pnlAltaUsuarios.Visible = true;
            botonAgregar.Visible = false;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewUsuarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando la Nombre (antes era:  " + row.Cells[1].Text + ") :";
            labelPassword.Text = "Se está actualizando el Password (antes era:  " + row.Cells[2].Text + ") :"; 
            labelID.Text = row.Cells[0].Text;
            gridViewUsuarios.Columns[0].Visible = false;

        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaUsuarios.Visible = false;
            botonAgregar.Visible = true;
            botonGuardar.Visible = true;
            actualizarUsuario(Int32.Parse(labelID.Text));
            TextBoxNombre.Text = "";
            TextBoxPassword.Text = "";
            botonActualizar.Visible = false;
            CargaDatosUsuario(); 
        }

        //--------------// 
        //    SEARCH    //
        //--------------//

        public void BusquedaPropiedad()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSUsuarioPorNombre";
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = txtBusqueda.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                gridViewUsuarios.DataSource = cmd.ExecuteReader();
                gridViewUsuarios.DataBind();
            }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            BusquedaPropiedad();
        }


        //--------------//
        //    Elemen    //
        //--------------//
        public void verPropiedades()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value =labelID.Text;
                cmd.CommandText = "SPSPropiedadesPorUsuario";
                cmd.Connection = conn;
                conn.Open();
                gridPropeidadesPorUsuario.DataSource = cmd.ExecuteReader();
                gridPropeidadesPorUsuario.DataBind();
            }
        }
        protected void linkVerPropiedades_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropeidadesPorUsuario.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[1].Text;
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            botonVolver.Visible = true;
            verPropiedades();
        }
    

        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
        }
    }
}