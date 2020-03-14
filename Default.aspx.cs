using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;

namespace Municipalidad_Bases
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaDatosUsuario();
            }
        }
        public void CargaDatosUsuario()  //ACÁ DEBEMOS COLOCAR LAS PROPIEDAADES WHERE ID SEA IGUAL AL DEL PROPIETARIO TONS MUESTRE. No los users.
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUsuariosSelect";
                cmd.Connection = conn;
                conn.Open();
                gridViewClientes.DataSource = cmd.ExecuteReader();
                gridViewClientes.DataBind();
            }
        }

        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUsuariosInsert";
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = TextBoxID.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            pnlDatosCliente.Visible = false;
            pnlAltaCliente.Visible = true;
        }

        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = false;
            pnlDatosCliente.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
        }


        public void eliminarUsuario(string idAlumno)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUsuariosDelete";
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Int64.Parse(idAlumno);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gridViewClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewClientes.Rows[e.RowIndex];
            eliminarUsuario(gridViewClientes.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        public void actualizarUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUClientes";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(labelNombre.Text);
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void GridViewClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            eliminarUsuario(gridViewClientes.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }


        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewClientes.SelectedIndex = row.RowIndex;
            labelID.Text = row.Cells[0].Text;
            labelNombre.Text = row.Cells[1].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaCliente.Visible = false;

            botonGuardar.Visible = true;
            actualizarUsuario();
            labelID.Text = "";
            botonActualizar.Visible = false;
            botonGuardar.Visible = true;
            CargaDatosUsuario();
        }

        protected void botonAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}