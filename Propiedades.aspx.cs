using System.Data;
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
                gridViewPropiedades.Columns[0].Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSPropiedad";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropiedades.DataSource = cmd.ExecuteReader();
                gridViewPropiedades.DataBind();
                gridViewPropiedades.Columns[0].Visible = false;
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
            labelDireccion.Text = "Dirección ";
            labelNumFinca.Text = "Número de Finca";
            labelValor.Text = "Valor ";
            botonActualizar.Visible = false;
            pnlDatosPropiedades.Visible = false;
            pnlAltaPropiedad.Visible = true;
        }



        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
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
                gridViewPropiedades.Columns[0].Visible = true;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPDPropiedad";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(ID);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                gridViewPropiedades.Columns[0].Visible = false;

            }
        }

        protected void gridViewPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            gridViewPropiedades.Columns[0].Visible = true;
            GridViewRow row = (GridViewRow)gridViewPropiedades.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropiedades.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
            gridViewPropiedades.Columns[0].Visible = false;
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
            gridViewPropiedades.Columns[0].Visible = true;
            pnlAltaPropiedad.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelNumFinca.Text = "Se está actualizando el Número de Finca (antes era: " + row.Cells[1].Text + ") :";
            labelValor.Text = "Se está actualizando el Valor (antes era: " + row.Cells[2].Text + ") :";
            labelDireccion.Text = "Se está actualizando la Dirección (antes era:  " + row.Cells[3].Text + ") :";
            labelID.Text = row.Cells[0].Text;
            gridViewPropiedades.Columns[0].Visible = false;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
            botonGuardar.Visible = true;
            botonAgregar.Visible = true;
            actualizarUsuario(Int32.Parse(labelID.Text));
            TextBoxDireccion.Text = "";
            TextBoxNumFinca.Text = "";
            TextBoxValor.Text = "";
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


        //--------------//
        //    Elemen    //
        //--------------//
        public void verPropietarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@numFinca", SqlDbType.Int).Value = Int64.Parse(labelID.Text);
                cmd.CommandText = "SPSPropietariosPorPropiedad";
                cmd.Connection = conn;
                conn.Open();
                gridPropietariosPorPropiedad.DataSource = cmd.ExecuteReader();
                gridPropietariosPorPropiedad.DataBind();
            }
        }

        protected void linkMostrarPropietarios_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[1].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = true;
            labelUsuarios.Visible = false;
            botonVolver.Visible = true;
            verPropietarios();
        }

        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
            labelTitulo.Visible = true;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = false;

        }


        public void verUsuarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@numFinca", SqlDbType.Int).Value = Int32.Parse(labelID.Text);
                cmd.CommandText = "SPSUsuariosPorPropiedad";
                cmd.Connection = conn;
                conn.Open();
                GridViewUsuarios.DataSource = cmd.ExecuteReader();
                GridViewUsuarios.DataBind();
            }
        }

        
        protected void linkMostrarUsuarios_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[1].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelUsuarios.Visible = true;
            botonAgregar.Visible = false;
            botonVolver.Visible = true;
            verUsuarios();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible =false ;
            labelUsuarios.Visible = true;
        }
    }
}
