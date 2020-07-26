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
    public partial class ConsultaPropiedad : System.Web.UI.Page
    {
        public string IPActual = GetLocalIPAddress();
        public static DataTable tablaRecibosPorPagar;
        public static string labelID, user, labelAux, JSONRecibos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user = Session["User"].ToString();
                CargaDatosUsuario();
            }
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

        //--------------//
        //    SELECT    //
        //--------------//
        public void CargaDatosUsuario()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = user;
                cmd.CommandText = "SPSPropiedadesPorUsuario";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropiedades.DataSource = cmd.ExecuteReader();
                gridViewPropiedades.DataBind();
                labelTitulo.InnerText = "Propiedades";
                labelCC.Visible = false;


            }
        }
        public void verRecibosDeComprobante()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InId", SqlDbType.Int).Value = Int64.Parse(labelAux);
                cmd.CommandText = "SPSRecibosDeComprobantePago";
                cmd.Connection = conn;
                conn.Open();
                GridViewRecibosPagos.DataSource = cmd.ExecuteReader();
                GridViewRecibosPagos.DataBind();
                labelCC.Visible = false;
                labelTitulo.InnerText = "Recibos";
                labelTitulo.Visible = true;


            }
        }
        protected void linkMostrarRecibosDeComprobante_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            GridViewComprobantes.SelectedIndex = row.RowIndex;
            labelAux = row.Cells[2].Text;
            verRecibosDeComprobante();
            GridViewRecibosPagos.Visible = true;
            GridViewRecibosPendientes.Visible = false;
            panelCC.Visible = true;
            panelComprobantes.Visible = false;

        }
        public void verComprobantes()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = TxtBoxNumFinca.Text;
                cmd.CommandText = "SPSComprobantePagoXPropiedad";
                cmd.Connection = conn;
                conn.Open();
                GridViewComprobantes.DataSource = cmd.ExecuteReader();
                GridViewComprobantes.DataBind();
                labelTitulo.InnerText = "Comprobantes";
                labelTitulo.Visible = true;
                labelCC.Visible = false;

            }
        }

        protected void ButtonMostrarComprobantes_Click(object sender, EventArgs e)
        {
            if (TxtBoxNumFinca.Text == "") return;
            verComprobantes();
            panelCC.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelComprobantes.Visible = true;
            GridViewComprobantes.Visible = true;
        }


        protected void botonVolver1_Click(object sender, EventArgs e)
        {
            botonVolver1.Visible = false;
            panelCC.Visible = false;
            CargaDatosUsuario();
            pnlDatosPropiedades.Visible = true;

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
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        //----------------//
        //  Ver Recibos  //
        //--------------//
        public void verRecibosPendientes()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSRecibosPendientes";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPendientes.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPendientes.DataBind();
                    labelTitulo.InnerText = "Finca número: " + labelID;
                    botonVolver1.Visible = true;
                    labelCC.Visible = true;
                    //Fails when doing column visible false
                    panelCC.Visible = true;
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        public void verRecibosPorPagar()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSRecibosPendientes";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPendientes2.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPendientes2.DataBind();
                    labelTitulo.InnerText = "Finca número: " + labelID;
                    botonVolver1.Visible = true;
                    labelCC.Visible = true;
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
        protected void ButtonMostrarPantallaPagos_Click(object sender, EventArgs e)
        {
            panelCC.Visible = false;
            panelPagar.Visible = true;
            verRecibosPorPagar();
            ButtonMostrarComprobantes.Visible = false;
            TxtBoxNumFinca.Visible = false;
            ButtonPagar.Visible = false;    
        }

        protected void ButtonCotizar_Click(object sender, EventArgs e)
        {
            ButtonCotizar.Visible = false;
            enviarRecibosPriori();
            ButtonPagar.Visible = true;
        }
        public string DataTableToJSONWithStringBuilder(DataTable table)
        {
            string JSON = string.Empty;
            JSON = Newtonsoft.Json.JsonConvert.SerializeObject(table);
            JSON = Regex.Unescape(JSON);
            JSON = JSON.Replace(@"\", "");
            Console.WriteLine(JSON);
            return JSON;
        }

        DataTable getTablaRecibosPendientes()
        {
            tablaRecibosPorPagar = new DataTable();
            tablaRecibosPorPagar.Columns.Add("IDConceptoCobro");
            tablaRecibosPorPagar.Columns.Add("Monto");
            tablaRecibosPorPagar.Columns.Add("FechaVence");
            tablaRecibosPorPagar.Columns.Add("FechaInsercion");
            tablaRecibosPorPagar.Columns.Add("ID");
            tablaRecibosPorPagar.Columns.Add("IDPropiedad");
            tablaRecibosPorPagar.Columns.Add("Estado");
            
            foreach (GridViewRow gvrow in GridViewRecibosPendientes2.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    DataRow dr = tablaRecibosPorPagar.NewRow();
                    for (int i = 1; i < gvrow.Cells.Count - 1; ++i)
                    {
                        gvrow.Cells[i].Visible = true;
                        dr[i] = gvrow.Cells[i].Text;
                        if (i > 4)
                        {
                            gvrow.Cells[7].Visible = false;
                            gvrow.Cells[6].Visible = false;
                            gvrow.Cells[5].Visible = false;
                        }
                    }
                    tablaRecibosPorPagar.Rows.Add(dr);
                }
            }
            return tablaRecibosPorPagar;
        }

        public void enviarRecibosPriori()
        {
            DataTable tabla = getTablaRecibosPendientes();
            string JSON = DataTableToJSONWithStringBuilder(tabla);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPGenerarInteresesMoratorios";
                    cmd.Parameters.Add("@JSON", SqlDbType.VarChar).Value = JSON;
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

        protected void GridViewRecibosPendientes2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //GridViewRecibosPendientes2;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[5].Visible = false;
        }

        void cancelarRecibosMoratorios()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InTablaApParaProcesar", SqlDbType.VarChar).Value = JSONRecibos;
                    cmd.CommandText = "SPCancelarRecibosMoratorios";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPagos.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPagos.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
        void procesarPagoRecibos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InTablaApParaProcesar", SqlDbType.VarChar).Value = JSONRecibos;
                    cmd.CommandText = "SPGenerarAPS";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPagos.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPagos.DataBind();
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
            verRecibosPendientes();
            verRecibosPagos();
        }
        protected void ButtonPagar_Click(object sender, EventArgs e)
        {
            procesarPagoRecibos();
        }

        protected void GridViewRecibosPendientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i = e.Row.Cells.Count;
            //e.Row.Cells[i - 1].Visible = false;
            //e.Row.Cells[i - 2].Visible = false;
            //e.Row.Cells[i - 3].Visible = false;
        }


        public void verRecibosPagos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSReciboPagos";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPagos.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPagos.DataBind();
                    botonVolver1.Visible = true;
                    labelCC.Visible = true;
                    panelCC.Visible = true;
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
        protected void linkMostrarRecibos_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
            verRecibosPendientes();
            verRecibosPagos();
            pnlDatosPropiedades.Visible = false;
        }

    }
}