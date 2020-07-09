using System;
using System.Net;
using System.Data;
using System.Net.Sockets;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Municipalidad_Bases
{
    public partial class Propietarios : System.Web.UI.Page
    {

        public static string labelID,labelAux;

        string IPActual = GetLocalIPAddress();
        public void ShowMessage(string message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        public static string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("No network adapters with an IPv4 address in the system!");
        }
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPSPropietario";
                    cmd.Connection = conn;
                    conn.Open();
                    gridViewPropietarios.DataSource = cmd.ExecuteReader();
                    gridViewPropietarios.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }

            }
        }

        //--------------//
        //   INSERT
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                if (TextBoxTipoID.Text.Trim() == "") TextBoxTipoID.Text = "-1";
                int error = Regex.Matches(TextBoxTipoID.Text.Trim(), @"[a-zA-Z]").Count;
                if (error>0) TextBoxTipoID.Text = "-1";

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIPropietario";
                    cmd.Parameters.Add("@InFecha", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                    cmd.Parameters.Add("@InTipoId", SqlDbType.Int).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                    cmd.Parameters.Add("@InNombreUsuario", SqlDbType.VarChar).Value = Session["User"].ToString();
                    cmd.Parameters.Add("@InIp", SqlDbType.VarChar).Value = IPActual;
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
            labelNombre.Text = "Nombre";
            labelNumID.Text = "Número de ID";
            labelTipoID.Text = "Tipo ID";
            botonActualizar.Visible = false;
            pnlDatosPropietarios.Visible = false;
            pnlAltaPropietarios.Visible = true;
        }

        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietarios.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
            TextBoxNombre.Text = "";
            TextBoxNumID.Text = "";
            TextBoxTipoID.Text = "";
        }

        //--------------//
        //    DELETE
        //--------------//
        public void eliminarUsuario(string ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPDPropietario";
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = ID;
                    cmd.Parameters.Add("@InNombreUsuario", SqlDbType.VarChar).Value = Session["User"].ToString();
                    cmd.Parameters.Add("@InIp", SqlDbType.VarChar).Value = IPActual;
                    cmd.Parameters.Add("@InFecha", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
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

        protected void gridViewPropietarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewPropietarios.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropietarios.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE
        //--------------//
        public void actualizarUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPUPropietario";
                    cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InNumIdViejo", SqlDbType.VarChar).Value = labelActualizar.Text.Trim();
                    cmd.Parameters.Add("@InNumIdNuevo", SqlDbType.VarChar).Value = TextBoxNumID.Text.Trim();
                    cmd.Parameters.Add("@InTipoId", SqlDbType.Int).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                    cmd.Parameters.Add("@InFecha", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InNombreUsuario", SqlDbType.VarChar).Value = Session["User"].ToString();
                    cmd.Parameters.Add("@InIp", SqlDbType.VarChar).Value = IPActual;
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
        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = true;
            botonGuardar.Visible = false;
            botonAgregar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando el Nombre (antes era: " + row.Cells[0].Text + ") :";
            labelNumID.Text = "Se está actualizando el Número de ID (antes era: " + row.Cells[1].Text + ") :";
            labelTipoID.Text = "Se está actualizando el tipo de ID (antes era: " + row.Cells[2].Text + ") :";
            labelActualizar.Text= row.Cells[1].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            botonGuardar.Visible = true;
            botonAgregar.Visible = true;
            actualizarUsuario();
            TextBoxNombre.Text = "";
            TextBoxNumID.Text = "";
            TextBoxTipoID.Text = "";
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPSPropietarioPorNumId";
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = txtBusqueda.Text.Trim();
                    cmd.Connection = conn;
                    conn.Open();
                    gridViewPropietarios.DataSource = cmd.ExecuteReader();
                    gridViewPropietarios.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSPropiedadesPorPropietario";
                    cmd.Connection = conn;
                    conn.Open();
                    gridPropeidadesPorPropietario.DataSource = cmd.ExecuteReader();
                    gridPropeidadesPorPropietario.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }   

        protected void linkMostrarPropiedades_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelID = row.Cells[1].Text;
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietarios.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            botonVolver.Visible = true;
            verPropiedades();
            labelTitulo.Visible = false;
            labelTituloProp.Visible = true;
        }

        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietarios.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
            labelTitulo.Visible = true;
            labelTituloProp.Visible = false;
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
                    cmd.Parameters.Add("@InFecha", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InNombreUsuario", SqlDbType.VarChar).Value = Session["User"].ToString();
                    cmd.Parameters.Add("@InIp", SqlDbType.VarChar).Value = IPActual;
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
            pnlDatosPropietarios.Visible = false;
            botonAgregar.Visible = false;
            eliminarRelacionPropietario();
            labelTitulo.Visible = false;
            labelTituloProp.Visible = true;
            verPropiedades();

        }
        //---------------//
        // Insertar PROP //
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
                    cmd.Parameters.Add("@InNombreUsuario", SqlDbType.VarChar).Value = Session["User"].ToString();
                    cmd.Parameters.Add("@InFecha", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InIp", SqlDbType.VarChar).Value = IPActual;
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
        protected void ButtonInsertarRPropiedad_Click(object sender, EventArgs e)
        {
            insertarRelacionPropiedad();
            verPropiedades();
            TextBoxRNumFinca.Text = "";
        }


    }
}