using System.Data;
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
        //    SELECT    //
        //--------------//
        public void CargaDatosUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSPropietarioJuridico";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropietarios.DataSource = cmd.ExecuteReader();
                gridViewPropietarios.DataBind();
            }
        }

        //--------------//
        //   INSERT     //
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIPropietarioJuridico";
                    cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                    cmd.Parameters.Add("@InIDTipoIdResponsable", SqlDbType.Int).Value = Int64.Parse(TextBoxIDTipoIdResponsable.Text.Trim());
                    cmd.Parameters.Add("@InNumIdResponsable", SqlDbType.VarChar).Value = TextBoxNumIdResponsable.Text.Trim();
                    cmd.Parameters.Add("@InResponsable", SqlDbType.VarChar).Value = TextBoxResponsable.Text.Trim();
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
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
                cmd.Parameters.Add("@InID", SqlDbType.Int).Value = Int64.Parse(ID);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void gridViewPropietarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)gridViewPropietarios.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropietarios.DataKeys[e.RowIndex].Value.ToString());
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
                cmd.CommandText = "SPUPropietarioJuridico";
                cmd.Parameters.Add("@InID", SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@InNumID", SqlDbType.Int).Value = Int64.Parse(TextBoxNumID.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando el Nombre (antes era: " + row.Cells[1].Text + ") :";
            labelNumID.Text = "Se está actualizando el Número de ID (antes era: " + row.Cells[2].Text + ") :";
            labelID.Text = row.Cells[0].Text;
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
                cmd.Parameters.Add("@InNumFinca", SqlDbType.Int).Value = Int64.Parse(txtBusqueda.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                gridViewPropietarios.DataSource = cmd.ExecuteReader();
                gridViewPropietarios.DataBind();
            }
        }
        /*
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
                cmd.Parameters.Add("@InnumFinca", SqlDbType.Int).Value = Int64.Parse(labelID.Text);
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
        */

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

        protected void linkEliminar_Click(EventArgs e)
        {

        }

        protected void linkEliminar_Click1(object sender, EventArgs e)
        {

        }
    }
}