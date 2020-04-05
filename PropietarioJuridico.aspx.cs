﻿using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;

namespace Municipalidad_Bases
{
    public partial class PropiedadJuridica : System.Web.UI.Page
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
        public void CargaDatosUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                gridViewPropietarios.Columns[0].Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSPropietarioJuridico";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropietarios.DataSource = cmd.ExecuteReader();
                gridViewPropietarios.DataBind();
                gridViewPropietarios.Columns[0].Visible = false;
            }
        }

        //--------------//
        //   INSERT     //
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPIPropietarioJuridico";
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@NumId", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                cmd.Parameters.Add("@IDTipoIdResponsable", SqlDbType.Int).Value = Int64.Parse(TextBoxIDTipoIdResponsable.Text.Trim());
                cmd.Parameters.Add("@NumIdResponsable", SqlDbType.VarChar).Value = TextBoxNumIdResponsable.Text.Trim();
                cmd.Parameters.Add("@Responsable", SqlDbType.VarChar).Value = TextBoxResponsable.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            labelNombre.Text = "Nombre de Propietario";
            labelNumID.Text = "Número de ID ";
            botonActualizar.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = false;
            pnlAltaPropietarios.Visible = true;
        }



        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
            TextBoxNombre.Text = "";
            TextBoxNumID.Text = "";
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
        protected void gridViewPropietarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            gridViewPropietarios.Columns[0].Visible = true;
            GridViewRow row = (GridViewRow)gridViewPropietarios.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropietarios.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
            gridViewPropietarios.Columns[0].Visible = false;
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
                cmd.CommandText = "SPUPropietarioJuridico";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@NumID", SqlDbType.Int).Value = Int64.Parse(TextBoxNumID.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            gridViewPropietarios.Columns[0].Visible = true;
            pnlAltaPropietarios.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando el Nombre (antes era: " + row.Cells[1].Text + ") :";
            labelNumID.Text = "Se está actualizando el Número de ID (antes era: " + row.Cells[2].Text + ") :";
            labelID.Text = row.Cells[0].Text;
            gridViewPropietarios.Columns[0].Visible = false;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            botonGuardar.Visible = true;
            botonAgregar.Visible = true;
            actualizarUsuario(Int32.Parse(labelID.Text));
            TextBoxNombre.Text = "";
            TextBoxNumID.Text = "";
            botonActualizar.Visible = false;
            CargaDatosUsuario();
        }

        //--------------//
        //    SEARCH    //
        //--------------//

        public void BusquedaPropiedad()
        {
            if (txtBusqueda.Text.Trim() == "") return;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSPropietarioJuridicoPorNumID";
                cmd.Parameters.Add("@NumFinca", SqlDbType.Int).Value = Int64.Parse(txtBusqueda.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                gridViewPropietarios.DataSource = cmd.ExecuteReader();
                gridViewPropietarios.DataBind();
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
                cmd.Parameters.Add("@numFinca", SqlDbType.Int).Value = Int64.Parse(labelID.Text);
                cmd.CommandText = "SPSPropietariosJuridicosPorPropiedad";
                cmd.Connection = conn;
                conn.Open();
                gridPropiedadesPorPropietario.DataSource = cmd.ExecuteReader();
                gridPropiedadesPorPropietario.DataBind();
            }
        }

        protected void linkMostrarPropiedades_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[1].Text;
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            labelTitulo.Visible = false;
            labelPropiedades.Visible = true;
            labelRepresentantes.Visible = false;
            botonVolver.Visible = true;
            verPropiedades();
        }

        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
            panelResponsable.Visible = false;

            labelTitulo.Visible = true;
            labelRepresentantes.Visible = false;
            labelPropiedades.Visible = false;
        }

        public void mostrarRepresentantes(int ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSResponsable";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                cmd.Connection = conn;
                conn.Open();
                GridViewResponsable.DataSource = cmd.ExecuteReader();
                GridViewResponsable.DataBind();
            }
        }

        protected void linkMostrarRepresentante_Click(object sender, EventArgs e)
        {
            gridViewPropietarios.Columns[0].Visible = true;
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = false;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[0].Text;
            gridViewPropietarios.Columns[0].Visible = false;
            mostrarRepresentantes(Int32.Parse(labelID.Text));
            labelTitulo.Visible = false;
            labelRepresentantes.Visible = true;
            labelPropiedades.Visible = false;
            botonVolver.Visible = true;
            panelResponsable.Visible = true;
        }
    }
}