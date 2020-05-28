using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Text.RegularExpressions;

namespace Municipalidad_Bases
{
    public partial class Propiedades : System.Web.UI.Page
    {
        string labelID;


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
            }
        }
        //--------------//
        //   INSERT
        //--------------//
        public void GuardaUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                if (TextBoxValor.Text.Trim() == "") TextBoxValor.Text = "-1";
                if (TextBoxNumFinca.Text.Trim() == "") TextBoxNumFinca.Text = "-1";
                int error = Regex.Matches(TextBoxValor.Text.Trim(), @"[a-zA-Z]").Count;
                if (error > 0) TextBoxValor.Text = "-2";
                error = Regex.Matches(TextBoxNumFinca.Text.Trim(), @"[a-zA-Z]").Count;
                if (error > 0) TextBoxNumFinca.Text = "-2";


                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIPropiedad";
                    cmd.Parameters.Add("@InFechaInsercion", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.Int).Value = Int64.Parse(TextBoxNumFinca.Text.Trim());
                    cmd.Parameters.Add("@InValor", SqlDbType.Int).Value = Int64.Parse(TextBoxValor.Text.Trim());
                    cmd.Parameters.Add("@InDireccion", SqlDbType.VarChar).Value = TextBoxDireccion.Text.Trim();
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
            labelDireccion.Text = "Dirección ";
            labelNumFinca.Text = "Número de Finca ";
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
                try
                {
                    if (TextBoxValor.Text.Trim() == "") TextBoxValor.Text = "-1";
                    if (TextBoxNumFinca.Text.Trim() == "") TextBoxNumFinca.Text = "-1";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPDPropiedad";
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = ID;
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

        protected void gridViewPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gridViewPropiedades.Rows[e.RowIndex];
            eliminarUsuario(gridViewPropiedades.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE    //
        //--------------//
        public void actualizarUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                if (TextBoxValor.Text.Trim() == "") TextBoxValor.Text = "-1";
                if (TextBoxNumFinca.Text.Trim() == "") TextBoxNumFinca.Text = "-1";
                int error = Regex.Matches(TextBoxValor.Text.Trim(), @"[a-zA-Z]").Count;
                if (error > 0) TextBoxValor.Text = "-2";
                error = Regex.Matches(TextBoxNumFinca.Text.Trim(), @"[a-zA-Z]").Count;
                if (error > 0) TextBoxNumFinca.Text = "-2";


                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPUPropiedad";
                    cmd.Parameters.Add("@InNumFincaViejo", SqlDbType.VarChar).Value = labelActualizar.Text.Trim();
                    cmd.Parameters.Add("@InNumFincaNuevo", SqlDbType.VarChar).Value = TextBoxNumFinca.Text.Trim();
                    cmd.Parameters.Add("@InValor", SqlDbType.Int).Value = Int64.Parse(TextBoxValor.Text.Trim());
                    cmd.Parameters.Add("@InDireccion", SqlDbType.VarChar).Value = TextBoxDireccion.Text.Trim();
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
            pnlAltaPropiedad.Visible = true;
            botonGuardar.Visible = false;
            botonActualizar.Visible = true;
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelNumFinca.Text = "Se está actualizando el Número de Finca (antes era: " + row.Cells[0].Text + ") :";
            labelValor.Text = "Se está actualizando el Valor (antes era: " + row.Cells[1].Text + ") :";
            labelDireccion.Text = "Se está actualizando la Dirección (antes era:  " + row.Cells[2].Text + ") :";
            labelActualizar.Text = row.Cells[0].Text;
        }

        protected void botonActualizar_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
            botonGuardar.Visible = true;
            botonAgregar.Visible = true;
            actualizarUsuario();
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
                try
                {
                    if (txtBusqueda.Text.Trim() == "") TextBoxValor.Text = "-1";
                    int error = Regex.Matches(TextBoxNumFinca.Text.Trim(), @"[a-zA-Z]").Count;
                    if (error > 0) TextBoxNumFinca.Text = "-2";

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPSPropiedadPorNumFinca";
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = txtBusqueda.Text.Trim();
                    cmd.Connection = conn;
                    conn.Open();
                    gridViewPropiedades.DataSource = cmd.ExecuteReader();
                    gridViewPropiedades.DataBind();
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
        public void verPropietarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    if (TextBoxValor.Text.Trim() == "") TextBoxValor.Text = "-1";
                    if (TextBoxNumFinca.Text.Trim() == "") TextBoxNumFinca.Text = "-1";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InnumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSPropietariosPorPropiedad";
                    cmd.Connection = conn;
                    conn.Open();
                    gridPropietariosPorPropiedad.DataSource = cmd.ExecuteReader();
                    gridPropietariosPorPropiedad.DataBind();
                }

                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        protected void linkMostrarPropietarios_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
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
                try
                {
                    if (TextBoxValor.Text.Trim() == "") TextBoxValor.Text = "-1";
                    if (TextBoxNumFinca.Text.Trim() == "") TextBoxNumFinca.Text = "-1";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InnumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSUsuariosPorPropiedad";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewUsuarios.DataSource = cmd.ExecuteReader();
                    GridViewUsuarios.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        
        protected void linkMostrarUsuarios_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
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

        protected void linkMostrarConceptosCobro_Click(object sender, EventArgs e)
        {

        }
        
    }
}
