using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;


namespace Municipalidad_Bases
{
    public partial class Servicios : System.Web.UI.Page
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
                gridViewServicios.DataSource = cmd.ExecuteReader();
                gridViewServicios.DataBind();
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
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                //DEPENDE DE LA TABLA LO QUE INSERTEMOS
                cmd.Parameters.Add("@", SqlDbType.Int).Value = TextBoxID.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void botonNuevo_Click(object sender, EventArgs e)
        {
            pnlDatosServicios.Visible = false;
            pnlAltaServicios.Visible = true;
        }

        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaServicios.Visible = false;
            pnlDatosServicios.Visible = true;
            GuardaUsuario();
            CargaDatosUsuario();
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
                cmd.CommandText = "SPDPropiedad";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(idAlumno);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gridViewServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewServicios.Rows[e.RowIndex];
            eliminarUsuario(gridViewServicios.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE
        //--------------//
        public void actualizarUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPUPropiedad";
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Int64.Parse(labelNombre.Text);
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaServicios.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewServicios.SelectedIndex = row.RowIndex;
            //labelNumFinca.Text = "El valor anterior es: " + row.Cells[0].Text;
            //labelValor.Text = "El valor anterior es: " + row.Cells[1].Text;
            //Agregar las otras
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaServicios.Visible = false;

            botonGuardar.Visible = true;
            actualizarUsuario();
            labelID.Text = "";
            botonActualizar.Visible = false;
            botonGuardar.Visible = true;
            CargaDatosUsuario();
        }
    }
}