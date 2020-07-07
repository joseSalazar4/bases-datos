using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace Municipalidad_Bases
{
    public partial class Propiedades : System.Web.UI.Page
    {
        public static string labelID, labelAux;


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
                Session["User"].ToString();
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
                labelCC.Visible = false;
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
                int error = Regex.Matches(TextBoxValor.Text.Trim(), @"[a-zA-Z]").Count;
                if (error > 0) TextBoxValor.Text = "-2";


                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPIPropiedad";
                    cmd.Parameters.Add("@InFechaInsercion", SqlDbType.Date).Value = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = TextBoxNumFinca.Text.Trim();
                    cmd.Parameters.Add("@InValor", SqlDbType.Money).Value = float.Parse(TextBoxValor.Text.Trim());
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
            labelCC.Visible = false;
            labelValor.Text = "Valor ";
            botonActualizar.Visible = false;
            pnlDatosPropiedades.Visible = false;
            pnlAltaPropiedad.Visible = true;
        }


        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = true;
            labelCC.Visible = false;
            GuardaUsuario();
            CargaDatosUsuario();
            TextBoxDireccion.Text = "";
            TextBoxNumFinca.Text = "";
            TextBoxValor.Text = "";
        }

        //--------------//
        //    DELETE
        //--------------//
        public void eliminarPropiedad(string ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
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
            eliminarPropiedad(gridViewPropiedades.DataKeys[e.RowIndex].Value.ToString());
            CargaDatosUsuario();
        }

        //--------------//
        //    UPDATE    //
        //--------------//
        public void actualizarPropiedad()
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
                    cmd.Parameters.Add("@InValor", SqlDbType.Money).Value = float.Parse(TextBoxValor.Text.Trim());
                    cmd.Parameters.Add("@InDireccion", SqlDbType.VarChar).Value = TextBoxDireccion.Text;
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
            botonAgregar.Visible = false;
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
            actualizarPropiedad();
            TextBoxDireccion.Text = "";
            labelCC.Visible = false;
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
            panelConceptos.Visible = false;
            labelCC.Visible = false;
            panelConexiones.Visible = false; 
            panelUsuarios.Visible = false;
            BusquedaPropiedad();
        }


        //--------------//
        //  Ver Prop    //
        //--------------//
        public void verPropietarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
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
            labelCC.Visible = false;
        }

        protected void botonVolver_Click(object sender, EventArgs e)
        {
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = true;
            panelConexiones.Visible = false;
            panelConceptos.Visible = false;
            panelUsuarios.Visible = false;
            CargaDatosUsuario();
            botonVolver.Visible = false;
            botonVolver1.Visible = false;
            botonVolver2.Visible = false;
            botonAgregar.Visible = true;
            labelTitulo.Visible = true;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = false;
            labelCC.Visible = false;
            labelRecibos.Visible = false;
                 

        }


        //----------------//
        // Eliminar Propi //
        //----------------//
        public void eliminarRelacionPropietario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = labelAux;
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


        protected void EliminarRPropietatio_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridPropietariosPorPropiedad.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[1].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelConceptos.Visible = false;
            botonAgregar.Visible = false;
            eliminarRelacionPropietario();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = true;
            labelUsuarios.Visible = false;
            labelCC.Visible = false;
            verPropietarios();

        }


        //---------------//
        //   Ver Users   //
        //---------------//
        public void verUsuarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
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
            verUsuarios();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible =false ;
            labelUsuarios.Visible = true;
            botonVolver1.Visible = true;
            labelCC.Visible = false;

        }

        //----------------//
        // Eliminar Users //
        //----------------//
        public void eliminarRelacionUsuarios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = labelAux;
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


        protected void EliminarRUsuario_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            GridViewUsuarios.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[0].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelUsuarios.Visible = true;
            botonAgregar.Visible = false;
            eliminarRelacionUsuarios();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = true;
            botonVolver1.Visible = true;
            labelCC.Visible = false;
            verUsuarios();
            
        }


        //--------------//
        //  Ver CCobro  //
        //--------------//
        public void verConceptosCobro()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSCCXPropiedad";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewConceptos.DataSource = cmd.ExecuteReader();
                    GridViewConceptos.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        protected void linkMostrarConceptosCobro_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelConceptos.Visible = true;
            botonAgregar.Visible = false;
            botonVolver2.Visible = true;
            verConceptosCobro();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = false;
            labelCC.Visible = true;
        }


        //----------------//
        // Eliminar Concp //
        //----------------//
        public void eliminarRelacionCC()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InIDCC", SqlDbType.VarChar).Value = Int64.Parse( labelAux);
                    cmd.CommandText = "SPDCCXPropiedad";
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

        protected void EliminarRCC_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            GridViewConceptos.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[0].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelConceptos.Visible = true;
            botonAgregar.Visible = false;
            eliminarRelacionCC();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = false;
            botonVolver1.Visible = true;
            labelCC.Visible = true;
            verConceptosCobro();
        }



        //----------------//
        // Insertar Propi //
        //----------------//
        public void insertarRelacionPropietario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InNumId", SqlDbType.VarChar).Value = TextBoxRNumId.Text.Trim();
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
        protected void ButtonInsertarRPropietario_Click(object sender, EventArgs e)
        {
            insertarRelacionPropietario();
            verPropietarios();
            TextBoxRNumId.Text = "";
        }

        //---------------//
        // Insertar User //
        //---------------//
        public void insertarRelacionUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = TextBoxRNombre.Text.Trim();
                    cmd.CommandText = "SPIUsuarioXPropiedad";
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
        protected void ButtonInsertarRUsuario_Click(object sender, EventArgs e)
        {
            insertarRelacionUsuario();
            verUsuarios();
            TextBoxRNombre.Text = "";
        }

        //----------------//
        // Insertar Concp //
        //----------------//
        public void insertarRelacionCC()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    if (TextBoxRID.Text=="") TextBoxRID.Text  = "-1";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InIDCC", SqlDbType.Int).Value = Int64.Parse( TextBoxRID.Text.Trim());
                    cmd.CommandText = "SPICCXPropiedad";
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


        //--------------//
        //  Ver Recibos  //
        //--------------//
        public void modificarTipoID()
        {
            var IDEntidad = new Dictionary<string, string>();
            IDEntidad.Add("llave", "content");
            string result = IDEntidad["llave"];


            for (int row = 0; row < GridViewRecibos.Rows.Count; row++)
            {
                string texto = GridViewRecibos.Rows[row].Cells[0].Text;

            }
        }
        public void verRecibos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSReciboPorPropiedad";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibos.DataSource = cmd.ExecuteReader();
                    GridViewRecibos.DataBind();
                    modificarTipoID();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        protected void LinkMostrarRecibos_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
            pnlAltaPropiedad.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelConceptos.Visible = false;
            panelRecibos.Visible = true;
            botonAgregar.Visible = false;
            botonVolver2.Visible = true;

            verRecibos();
            labelTitulo.Visible = false;
            labelTituloPropietarios.Visible = false;
            labelUsuarios.Visible = false;
            labelCC.Visible = false;
            labelRecibos.Visible = true;
        }

        protected void ButtonInsertarRCC_Click(object sender, EventArgs e)
        {
            insertarRelacionCC();
            verConceptosCobro();
            TextBoxRID.Text = "";
        }
    }
}
