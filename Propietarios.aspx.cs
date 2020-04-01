using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;

namespace Municipalidad_Bases
{
    public partial class Propietarios : System.Web.UI.Page
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
                cmd.CommandText = "SPSPropietario";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropietarios.DataSource = cmd.ExecuteReader();
                gridViewPropietarios.DataBind();
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
                cmd.CommandText = "SPIPropietario";
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@NumId", SqlDbType.Int).Value = Int64.Parse(TextBoxNumID.Text.Trim());
                cmd.Parameters.Add("@TipoId", SqlDbType.Int).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            labelNombre.Text="Nombre";
            labelNumID.Text="Número de ID";
            labelTipoID.Text="Tipo ID";
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
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPDPropietario";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(ID);
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
        //    UPDATE
        //--------------//
        public void actualizarUsuario(int ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUPropietario";
                cmd.Parameters.Add("@ID",SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@NumId", SqlDbType.Int).Value = Int64.Parse(TextBoxNumID.Text.Trim());
                cmd.Parameters.Add("@TipoId", SqlDbType.Int).Value = Int64.Parse(TextBoxTipoID.Text.Trim());
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropietarios.Visible = true;
            botonGuardar.Visible = false;
            botonAgregar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropietarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando el Nombre (antes era: " + row.Cells[1].Text + ") :";
            labelNumID.Text = "Se está actualizando el Número de ID (antes era: " + row.Cells[2].Text + ") :";
            labelTipoID.Text = "Se está actualizando el tipo de ID (antes era: " + row.Cells[3].Text + ") :";
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
            TextBoxTipoID.Text = "";
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
                cmd.CommandText = "SPSPropietariosPorNumId";
                cmd.Parameters.Add("@NumId", SqlDbType.Int).Value = Int64.Parse(txtBusqueda.Text.Trim());
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
                cmd.Parameters.Add("@NumCedula", SqlDbType.Int).Value = Int64.Parse(labelID.Text);
                cmd.CommandText = "SPSPropiedadesPorPropietario";
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
            labelID.Text = row.Cells[2].Text;
            pnlAltaPropietarios.Visible = false;
            pnlDatosPropietarios.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            verPropiedades();
        }
    }
}