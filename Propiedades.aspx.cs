﻿using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;

namespace Municipalidad_Bases
{
    public partial class Propiedades : System.Web.UI.Page
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
                cmd.CommandText = "SPSPropiedad";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropiedades.DataSource = cmd.ExecuteReader();
                gridViewPropiedades.DataBind();
                conn.Close();
            }
        }

        //--------------//
        //   INSERT
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPIPropiedad";
                cmd.Parameters.Add("@NumFinca", SqlDbType.Int).Value = Int64.Parse(TextBoxNumFinca.Text.Trim());
                cmd.Parameters.Add("@Valor", SqlDbType.Int).Value = Int64.Parse(TextBoxValor.Text.Trim());
                cmd.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = TextBoxDireccion.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            pnlDatosPropiedades.Visible = false;
            pnlAltaCliente.Visible = true;
        }



        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = false;
            pnlDatosPropiedades.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
            TextBoxDireccion.Text = "";
            TextBoxNumFinca.Text = "";
            TextBoxValor.Text = "";
        }

        //--------------//
        //    DELETE
        //--------------//
        public void eliminarUsuario(string ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPDPropiedad";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(ID);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gridViewPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewPropiedades.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropiedades.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE    //
        //--------------//
        public void actualizarUsuario(int ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUPropiedad";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@NumFinca", SqlDbType.Int).Value = Int64.Parse(TextBoxNumFinca.Text.Trim());
                cmd.Parameters.Add("@Valor", SqlDbType.Int).Value = Int64.Parse(TextBoxValor.Text.Trim());
                cmd.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = TextBoxDireccion.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelNumFinca.Text = "Se está actualizando el Número de Finca (antes era: " + row.Cells[1].Text+") :";
            labelValor.Text = "Se está actualizando el Valor (antes era: " + row.Cells[2].Text + ") :";
            labelDireccion.Text = "Se está actualizando la Dirección (antes era:  " + row.Cells[3].Text + ") :";
            labelID.Text = row.Cells[0].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = false;
            botonGuardar.Visible = true;
            actualizarUsuario(Int32.Parse(labelID.Text));
            labelNumFinca.Text = "";
            botonActualizar.Visible = false;
            CargaDatosUsuario();
        }

        protected void linkMostrarPropietarios_Click(object sender, EventArgs e)
        {

        }
        public void BusquedaPropiedad()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSPropiedadPorNumFinca";
                cmd.Parameters.Add("@NumFinca", SqlDbType.Int).Value = Int64.Parse(txtBusqueda.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                gridViewPropiedades.DataSource = cmd.ExecuteReader();
                gridViewPropiedades.DataBind();
            }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            BusquedaPropiedad();
        }
    }
}
