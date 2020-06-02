using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Text.RegularExpressions;

namespace Municipalidad_Bases
{
    public partial class PropiedadJuridica : System.Web.UI.Page
    {
        public static string labelID, labelAux;
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
                    if (TextBoxIDTipoIdResponsable.Text.Trim() == "") TextBoxIDTipoIdResponsable.Text = "-1";
                    if (TextBoxTipoID.Text.Trim() == "") TextBoxTipoID.Text = "-1";
                    int error = Regex.Matches(TextBoxIDTipoIdResponsable.Text.Trim(), @"[a-zA-Z]").Count;
                    if (error > 0) TextBoxIDTipoIdResponsable.Text = "-2";
                    error = Regex.Matches(TextBoxTipoID.Text.Trim(), @"[a-zA-Z]").Count;
                    if (error > 0) TextBoxTipoID.Text = "-2";

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIPropietarioJuridico";
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                    cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InTipoID", SqlDbType.VarChar).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                    cmd.Parameters.Add("@InFechaInsercion", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
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
                cmd.CommandText = "SPDPropietario";
                cmd.Parameters.Add("@InPropietario", SqlDbType.VarChar).Value = ID;
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //--------------//
        //    UPDATE    //
        //--------------//
        public void actualizarUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUPropietarioJuridico";
                cmd.Parameters.Add("@InNumIdViejo", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                cmd.Parameters.Add("@InNumIdNuevo", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@InTipoID", SqlDbType.VarChar).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                cmd.Parameters.Add("@InIDTipoIdResponsable", SqlDbType.Int).Value = Int64.Parse(TextBoxIDTipoIdResponsable.Text.Trim());
                cmd.Parameters.Add("@InNumIdResponsable", SqlDbType.VarChar).Value = TextBoxNumIdResponsable.Text.Trim();
                cmd.Parameters.Add("@InResponsable", SqlDbType.VarChar).Value = TextBoxResponsable.Text.Trim();
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
            labelNombre.Text = "Se está actualizando el Nombre (antes era: " + row.Cells[0].Text + ") :";
            labelNumID.Text = "Se está actualizando el Número de ID (antes era: " + row.Cells[1].Text + ") :";
            labelTipoID.Text = "Se está actualizando el tipo de ID (antes era: 4) :";
            labelIDTipoIdResponsable.Text = "Se está actualizando Tipo ID del Responsable (antes era: " + row.Cells[2].Text + ") :";
            labelNumIdResponsable.Text = "Se está actualizando Número ID Responsable  :";
            labelResponsable.Text = "Se está actualizando(antes era: " + row.Cells[3].Text + ") :";
            labelID = row.Cells[1].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            botonGuardar.Visible = true;
            botonAgregar.Visible = true;
            actualizarUsuario();
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
                cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = labelID;
                cmd.CommandText = "SPSPropiedadesPorPropietarioJuridico";
                cmd.Connection = conn;
                conn.Open();
                gridPropeidadesPorPropietario.DataSource = cmd.ExecuteReader();
                gridPropeidadesPorPropietario.DataBind();
            }
        }
        protected void linkMostrarPropiedades_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelID = row.Cells[1].Text;
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

        public void eliminarRelacionPropietario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelAux;
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPDPropiedadXPropietario";
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


        protected void EliminarRPropiedad_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropeidadesPorPropietario.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[0].Text;
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = false;
            botonAgregar.Visible = false;
            eliminarRelacionPropietario();
            labelTitulo.Visible = false;
            verPropiedades();

        }
        //---------------//
        // Insertar Prop //
        //---------------//
        public void insertarRelacionPropiedad()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = TextBoxRNumFinca.Text.Trim();
                    cmd.CommandText = "SPIPropiedadXPropietario";
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

        //---------------//
        // Insertar PROP //
        //---------------//

        protected void ButtonInsertarRPropiedad_Click(object sender, EventArgs e)
        {
            insertarRelacionPropiedad();
            verPropiedades();
            TextBoxRNumFinca.Text = "";
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropeidadesPorPropietario.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[1].Text;
            eliminarUsuario(labelAux);
            CargaDatosUsuario();
        }


        protected void botonVolver_Click(object sender, EventArgs e)
        {

            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietariosJuridicos.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
            labelTitulo.Visible = true;
        }
    }
}