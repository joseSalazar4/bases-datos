using System;
using System.Net;
using System.Data;
using System.Net.Sockets;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Ajax.Utilities;

namespace Municipalidad_Bases
{
    public partial class ConsultaPropiedad : System.Web.UI.Page
    {
        public string IPActual = GetLocalIPAddress();
        public static string[] listaTiposCC = {"1", "2", "3" , "4", "5", "6", "7", "8", "9","12"};
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

            }
        }

        protected void ButtonMostrarComprobantes_Click(object sender, EventArgs e)
        {
            if (TxtBoxNumFinca.Text == "") return;
            verComprobantes();
            panelCC.Visible = false;
            pnlDatosPropiedades.Visible = false;
            panelComprobantes.Visible = true;
            ButtonMostrarComprobantes.Visible = false;
            ButtonMostrarComprobantes.Visible = false;
            TxtBoxNumFinca.Visible = false;
            GridViewComprobantes.Visible = true;
            botonVolver1.Visible = true;
        }


        protected void botonVolver1_Click(object sender, EventArgs e)
        {
            botonVolver1.Visible = false;
            panelCC.Visible = false;
            CargaDatosUsuario();
            ButtonMostrarComprobantes.Visible = true;
            TxtBoxNumFinca.Visible = true;
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
            ButtonCancelar.Visible = false;
        }

        protected void ButtonCotizar_Click(object sender, EventArgs e)
        {
            ButtonCotizar.Visible = false;
            ButtonCancelar.Visible = true;
            enviarRecibosPriori();
            ButtonPagar.Visible = true;
        }
        public string DataTableToJSONWithStringBuilder(DataTable table)
        {
            string JSON = string.Empty;
            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
            };
            JSON = Newtonsoft.Json.JsonConvert.SerializeObject(table, settings);
            JSON = Regex.Unescape(JSON);
            return JSON;
        }

        DataTable getTablaRecibosPendientes(int tipo)
        {
            tablaRecibosPorPagar = new DataTable();
            tablaRecibosPorPagar.Columns.Add("IDConceptoCobro");
            tablaRecibosPorPagar.Columns.Add("Monto");
            tablaRecibosPorPagar.Columns.Add("FechaVence");
            tablaRecibosPorPagar.Columns.Add("FechaInsercion");
            tablaRecibosPorPagar.Columns.Add("IDRecibo");
            tablaRecibosPorPagar.Columns.Add("IDPropiedad");

            foreach (GridViewRow gvrow in GridViewRecibosPendientes2.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBoxSeleccion") as CheckBox;
                if (checkbox.Checked || tipo == 1)
                {
                    int i = 1;
                    DataRow dr = tablaRecibosPorPagar.NewRow();
                    if (tipo == 1) i = 0;
                    for (i = 1; i < gvrow.Cells.Count - 1; ++i)
                    {

                        gvrow.Cells[i].Visible = true;
                        dr[i - 1] = gvrow.Cells[i].Text;
                        if (i > 4) gvrow.Cells[i].Visible = false;
                    }
                    tablaRecibosPorPagar.Rows.Add(dr);
                }
            }
            return tablaRecibosPorPagar;
        }

        public void enviarRecibosPriori()
        {
            DataTable tabla = getTablaRecibosPendientes(0);
            string JSON = DataTableToJSONWithStringBuilder(tabla);
            if (!checkSelectionsDone()) return;

            labelTitulo.InnerText = "Seleccionaste bien las varas puto :)";
            labelTitulo.Visible = true;
            GridViewRecibosPendientes2.Columns[0].Visible = false;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SPGenerarInteresesMoratorios";
                    cmd.Parameters.Add("@JSONRecibos", SqlDbType.VarChar).Value = JSON;
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPendientes2.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPendientes2.DataBind();
                    GridViewRecibosPendientes2.Columns[0].Visible = false;
                }

                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }

        protected void GridViewRecibosPendientes2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[5].Visible = false;
        }

        void cancelarRecibosMoratorios()
        {
            labelTitulo.Visible = true;
            labelTitulo.InnerText = JSONRecibos;

            GridViewRecibosPendientes2.Columns[0].Visible = true;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@JSONRecibos", SqlDbType.VarChar).Value = JSONRecibos;
                    cmd.CommandText = "SPCancelarRecibosMoratorios";
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
        void procesarPagoRecibos()
        {

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@JSONRecibos", SqlDbType.VarChar).Value = JSONRecibos;
                    cmd.CommandText = "SPPagarRecibos";
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

            DataTable tablaCancelar = getTablaRecibosPendientes(1);
            JSONRecibos = DataTableToJSONWithStringBuilder(tablaCancelar);
            procesarPagoRecibos();
        }

        protected void ButtonCancelar_Click(object sender, EventArgs e)
        {
            ButtonCancelar.Visible = false;
            ButtonCotizar.Visible = true;
            DataTable tablaCancelar = getTablaRecibosPendientes(1);
            JSONRecibos = DataTableToJSONWithStringBuilder(tablaCancelar);
            cancelarRecibosMoratorios();
            ButtonPagar.Visible = false;
        }
        public bool seleccionCorrecta(List<string> lista)
        {
            bool seleccionCorrecta = true;
            
            string ultimo = lista[lista.Count - 1], elemento;

            for(int i = 0; i <= lista.Count-2;++i) {
                    elemento = lista[i];
                    if (Int64.Parse(elemento) + 1 != Int64.Parse(lista[i+1])) seleccionCorrecta = false;
            }
            return seleccionCorrecta;
        }
        protected bool checkSelectionsDone()
        {
            foreach (string tipoCC in listaTiposCC)
            {
                List<string> seleccionados = new List<string>();
                foreach (GridViewRow row in GridViewRecibosPendientes2.Rows)
                {
                    var checkbox = row.FindControl("CheckBoxSeleccion") as CheckBox;
                    int indiceActual = row.RowIndex;
                    if (row.Cells[1].Text == tipoCC && checkbox.Checked)
                    {
                        seleccionados.Add(indiceActual.ToString());
                    }
                }
                if (seleccionados.Count != 0)
                {
                    bool seleccion = seleccionCorrecta(seleccionados);
                    if (!seleccion) return false;
                }
            }
            return true;
        }

        protected void GridViewRecibosPendientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i = e.Row.Cells.Count;
            e.Row.Cells[i - 1].Visible = false;
            e.Row.Cells[i - 2].Visible = false;
            e.Row.Cells[i - 3].Visible = false;
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
            TxtBoxNumFinca.Visible = false;
            ButtonMostrarComprobantes.Visible = false;
            pnlDatosPropiedades.Visible = false;
        }
    }
}