using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;


namespace Municipalidad_Bases
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public static string labelID,labelAux;
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPSUsuario";
                    cmd.Connection = conn;
                    conn.Open();
                    gridViewUsuarios.DataSource = cmd.ExecuteReader();
                    gridViewUsuarios.DataBind();
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIUsuario";
                    cmd.Parameters.Add("@InNombre", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InPassword", SqlDbType.VarChar).Value = TextBoxPassword.Text.Trim();
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
        public void eliminarUsuario(string username)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPDUsuario";
                    cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = username;
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

        protected void gridViewUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewUsuarios.Rows[e.RowIndex];
            eliminarUsuario(gridViewUsuarios.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE
        //--------------//
        public void actualizarUsuario(string usernameViejo)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {


                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPUUsuario";
                    cmd.Parameters.Add("@InUsernameViejo", SqlDbType.VarChar).Value = usernameViejo;
                    cmd.Parameters.Add("@InUsernameNuevo", SqlDbType.VarChar).Value = TextBoxNombre.Text.Trim();
                    cmd.Parameters.Add("@InPasswordNueva", SqlDbType.VarChar).Value = TextBoxPassword.Text.Trim();
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
            pnlAltaUsuarios.Visible = true;
            botonAgregar.Visible = false;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewUsuarios.SelectedIndex = row.RowIndex;
            labelNombre.Text = "Se está actualizando la Nombre (antes era:  " + row.Cells[0].Text + ") :";
            labelPassword.Text = "Se está actualizando el Password (antes era:  " + row.Cells[1].Text + ") :";
            labelActualizar.Text = row.Cells[0].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaUsuarios.Visible = false;
            botonAgregar.Visible = true;
            botonGuardar.Visible = true;
            actualizarUsuario(labelActualizar.Text);
            TextBoxNombre.Text = "";
            TextBoxPassword.Text = "";
            botonActualizar.Visible = false;
            CargaDatosUsuario();
        }

        //--------------// 
        //    SEARCH    //
        //--------------//

        public void BusquedaUsuario()
        {
            if (txtBusqueda.Text.Trim() == "") return;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSUsuarioPorNombre";
                cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = txtBusqueda.Text.Trim();
                cmd.Connection = conn;
                conn.Open();
                gridViewUsuarios.DataSource = cmd.ExecuteReader();
                gridViewUsuarios.DataBind();
            }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            BusquedaUsuario();
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
                    cmd.Parameters.Add("@Inusername", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSPropiedadesPorUsuario";
                    cmd.Connection = conn;
                    conn.Open();
                    gridPropeidadesPorUsuario.DataSource = cmd.ExecuteReader();
                    gridPropeidadesPorUsuario.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
        protected void linkVerPropiedades_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropeidadesPorUsuario.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = false;
            panelConexiones.Visible = true;
            botonAgregar.Visible = false;
            botonVolver.Visible = true;
            verPropiedades();
            labelTitulo.Visible = false;
            labelTituloProp.Visible = true;

        }


        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = true;
            panelConexiones.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonAgregar.Visible = true;
            labelTitulo.Visible = true;
            labelTituloProp.Visible = false;
        }

        public void eliminarRelacionPropiedad()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelAux;
                    cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPDUsuarioXPropiedad";
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


        protected void linkEliminarRPropiedad_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropeidadesPorUsuario.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[0].Text;
            pnlAltaUsuarios.Visible = false;
            pnlDatosUsuarios.Visible = false;
            botonAgregar.Visible = false;
            eliminarRelacionPropiedad();
            labelTitulo.Visible = false;
            labelTituloProp.Visible = true; 
            verPropiedades();
        }

    }
}