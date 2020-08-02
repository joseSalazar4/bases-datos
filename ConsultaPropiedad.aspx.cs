using System;
using System.Net;
using System.Data;
using System.Net.Sockets;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace Municipalidad_Bases
{
    public partial class ConsultaPropiedad : System.Web.UI.Page
    {

#pragma warning disable IDE1006 // Naming Styles
        public string IPActual = GetLocalIPAddress();
        public static DataTable tablaRecibosPorPagar;
        public static string labelID, user, labelAux, JSONRecibos;
        public static string[] listaTiposCC = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "12" };
        public Dictionary<string, string> conceptosCobro = new Dictionary<string, string>() { {"Agua", "1"},{"Patente Licores", "2"},{"Impuesto Propiedad", "3"}, {"Recolectar Basura", "4"}, {"Mantenimiento de Parques", "5"}
                                               ,{"Impuesto a la Renta", "6"},{"Alumbrado Publico", "7"},{"Aseo de Sitios Publico", "8"},{"Acueductos", "9"},{"Reconexión de agua", "10"},{ "Interes Moratorio","11"},{"Arreglo Pago", "12"}};
        public Dictionary<string, string> conceptosCobroInverted = new Dictionary<string, string>() { { "1","Agua"},{"2","Patente Licores"},{"3","Impuesto Propiedad"}, { "4","Recolectar Basura"}, {"5","Mantenimiento de Parques"}
                                               ,{ "6","Impuesto a la Renta"},{"7","Alumbrado Publico"},{"8","Aseo de Sitios Publico"},{"9","Acueductos"},{"10","Reconexión de agua" },{ "11","Interes Moratorio"},{"12","Arreglo Pago"}};

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user = Session["User"].ToString();
                CargaDatosUsuario();
                labelCuota.Font.Name = "Tahoma";
                labelDeudaTotal.Font.Name = "Tahoma";
                labelMontoTotalCotiz.Font.Name = "Tahoma";
                labelPlazo.Font.Name = "Tahoma";
                labelTotalFinal.Font.Name = "Tahoma";
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
            botonVolver1.Visible = false;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InUsername", SqlDbType.VarChar).Value = user;
                cmd.CommandText = "SPSPropiedadesPorUsuario";
                cmd.Connection = conn;
                conn.Open();
                gridViewPropiedades.Visible = true;
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
            GridViewRecibosPendientes2.Visible = false;
            ButtonMostrarComprobantes.Visible = true;
            ButtonArregloPago.Visible = false;
            TxtBoxNumFinca.Visible = true;
            ButtonCotizar.Visible = false;
            pnlDatosPropiedades.Visible = true;
            labelMontoTotalCotiz.Visible = false;
            panelAP.Visible = false;
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
            GridViewRecibosPendientes2.Columns[0].Visible = true;
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
                    ccConversor(1, 1);
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                    ccConversor(1, 1);
                }
            }
        }
        protected void ButtonMostrarPantallaPagos_Click(object sender, EventArgs e)
        {
            panelCC.Visible = false;
            panelPagar.Visible = true;
            verRecibosPorPagar();
            
            ButtonMostrarComprobantes.Visible = false;
            ButtonArregloPago.Visible = true;
            TxtBoxNumFinca.Visible = false;
            GridViewRecibosPendientes2.Visible = true;
            ButtonPagar.Visible = false;
            ButtonArregloPago.Visible = false;
            ButtonCancelar.Visible = false;
            ButtonCotizar.Visible = true;
        }

        protected void ButtonCotizar_Click(object sender, EventArgs e)
        {

            enviarRecibosPriori();
           
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

        public string obtenerMonto()
        {
            float sumaTotal = 0;
            foreach (GridViewRow row in GridViewRecibosPendientes2.Rows) sumaTotal += float.Parse(row.Cells[2].Text);
            return sumaTotal.ToString();
        }
        public void enviarRecibosPriori()
        {
            ccConversor(0,1);
            DataTable tabla = getTablaRecibosPendientes(0);
            string JSON = DataTableToJSONWithStringBuilder(tabla);
            if (!checkSelectionsDone())
            {
                ccConversor(1, 1);
                return;
            }
            ButtonCotizar.Visible = false;
            labelTitulo.InnerText = "Detalles con Intereses Calculados";
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
                    labelMontoTotalCotiz.Text = "Monto Total: ₡" + String.Format("{0:0.00}",obtenerMonto());
                    labelMontoTotalCotiz.Visible = true;
                    GridViewRecibosPendientes2.Columns[0].Visible = false;
                    ButtonArregloPago.Visible = true;
                    ButtonPagar.Visible = true;
                    ButtonCancelar.Visible = true;
                    ccConversor(1, 1);
                }

                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                    ccConversor(1, 1);
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
                    ccConversor(1, 1);

                }
                catch (SqlException ex)
                {
                    ccConversor(1, 1);
                    ShowMessage(ex.Errors[0].Message);
                }
            }
            verRecibosPorPagar();
            labelMontoTotalCotiz.Visible = false;
            labelTitulo.InnerText = "Escoga los recibos por pagar";
            ButtonArregloPago.Visible = false;
        }
        string calcularTotalPagado()
        {
            int sumaTotal = 0;
            foreach (GridViewRow row in GridViewRecibosPendientes2.Rows) sumaTotal += Int32.Parse(row.Cells[2].Text);
            return sumaTotal.ToString();
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
                    ccConversor(1, 1);


                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                    ccConversor(1, 1);

                }

            }
            botonVolver1.Visible = true;
            botonVolver1.Text = "Volver al Menu Principal";

            GridViewRecibosPendientes.Visible = false;
            GridViewRecibosPendientes2.Visible = false;
            labelTitulo.Visible = true;
            ButtonCancelar.Visible = false;
            ButtonPagar.Visible = false;
            labelTitulo.InnerText = "Pago Realizado con éxito.";
            //Monto Total:  +calcularTotalPagado();
        }
        protected void ButtonPagar_Click(object sender, EventArgs e)
        {
            ccConversor(0, 1);
            DataTable tablaCancelar = getTablaRecibosPendientes(1);
            JSONRecibos = DataTableToJSONWithStringBuilder(tablaCancelar);
            ButtonArregloPago.Visible = false;
            procesarPagoRecibos();
        }

        protected void ButtonCancelar_Click(object sender, EventArgs e)
        {
            ButtonCancelar.Visible = false;
            ButtonCotizar.Visible = true;
            ccConversor(0, 1);
            DataTable tablaCancelar = getTablaRecibosPendientes(1);
            JSONRecibos = DataTableToJSONWithStringBuilder(tablaCancelar);
            cancelarRecibosMoratorios();
            ButtonPagar.Visible = false;
        }
        public bool seleccionCorrecta(List<string> lista)
        {
            bool seleccionCorrecta = true;

            string elemento;

            for (int i = 0; i <= lista.Count - 2; ++i)
            {
                elemento = lista[i];
                if (Int64.Parse(elemento) + 1 != Int64.Parse(lista[i + 1])) seleccionCorrecta = false;
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
        
        protected void ButtonArregloPago_Click(object sender, EventArgs e)
        {
            //GridViewRecibosPendientes2.Visible = false;
            ButtonArregloPago.Visible = false;
            ButtonPagar.Visible = false;
            ButtonCancelar.Visible = false;
            labelDeudaTotal.Text = "Deuda Total: ₡" + (float)System.Math.Round(float.Parse(labelMontoTotalCotiz.Text.Substring(14)),2);
            labelMontoTotalCotiz.Visible = false;
            panelAP.Visible = true;
        }

        public void ccConversor(int tipo, int pos)
        {
                //tipo 0 es de letras a # y q es de # a letras
                //pos es porque no siempre el concepto es lo primero.
            foreach (GridViewRow row in GridViewRecibosPendientes2.Rows)
            {
                if (tipo == 0) row.Cells[pos].Text = conceptosCobro[row.Cells[pos].Text];
                else row.Cells[pos].Text = conceptosCobroInverted[row.Cells[pos].Text];
            }
        }

            protected void buttonCalcularCuota_Click(object sender, EventArgs e)
        {
            double i = (10.00/12)/100;
            double n = double.Parse(textBoxPlazo.Text);
            double P = double.Parse(labelDeudaTotal.Text.Substring(14));
                double denominador = Math.Pow(1 + i, n) - 1.0;
            double cuota;
            cuota = P * ((i * Math.Pow((1 + i), n)) / denominador);
            labelCuota.Text = "Cuota: ₡" + (float)System.Math.Round(float.Parse(cuota.ToString()), 2);
            labelTotalFinal.Text = "Total Final: ₡" + (float)System.Math.Round(float.Parse((cuota * n).ToString()), 2); ;
        }

        protected void buttonCrearAP_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    ccConversor(0, 1);
                    DataTable tablaCancelar = getTablaRecibosPendientes(1);
                    JSONRecibos = DataTableToJSONWithStringBuilder(tablaCancelar);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InJSONRecibos", SqlDbType.VarChar).Value = JSONRecibos;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.Parameters.Add("@InPlazo", SqlDbType.Int).Value = Int32.Parse(textBoxPlazo.Text);
                    cmd.Parameters.Add("@InCuota", SqlDbType.Money).Value = labelCuota.Text.Substring(8);
                    cmd.Parameters.Add("@InMontoTotalDeuda", SqlDbType.Money).Value = labelTotalFinal.Text.Substring(14);
                    cmd.CommandText = "SPGenerarAPWeb";
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    panelAP.Visible = false;
                        botonVolver1.Visible = true;
                    botonVolver1.Text = "Volver al Menu Principal";
                    ccConversor(1, 1);
                    labelTitulo.Visible = true;
                    labelTitulo.InnerText = "AP Generado con éxito. ";
                    GridViewRecibosPendientes2.Visible = false;
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                    ccConversor(1, 1);
                }
            }
        }


        public void verRecibosAP()
        {
            gridViewPropiedades.Visible = false;
            GridViewRecibosPagos.Visible = false;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@InNumFinca", SqlDbType.VarChar).Value = labelID;
                    cmd.CommandText = "SPSRecibosAP";
                    cmd.Connection = conn;
                    conn.Open();
                    GridViewRecibosPendientes.DataSource = cmd.ExecuteReader();
                    GridViewRecibosPendientes.DataBind();
                    botonVolver1.Visible = true;
                    panelCC.Visible = true;
                }
                catch (SqlException ex)
                {
                    ShowMessage(ex.Errors[0].Message);
                }
            }
        }
        protected void linkMostrarArreglosPago_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
            gridViewPropiedades.SelectedIndex = row.RowIndex;
            labelID = row.Cells[0].Text;
            GridViewRecibosPendientes2.Visible = false;
            ButtonCotizar.Visible = false;
            verRecibosAP();
            TxtBoxNumFinca.Visible = false;
            ButtonMostrarComprobantes.Visible = false;
            pnlDatosPropiedades.Visible = false;
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
                    ButtonArregloPago.Visible = false;
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
            GridViewRecibosPendientes2.Visible = false;
            ButtonCotizar.Visible = false;
            verRecibosPendientes();
            verRecibosPagos();
            TxtBoxNumFinca.Visible = false;
            ButtonMostrarComprobantes.Visible = false;
            pnlDatosPropiedades.Visible = false;
        }
    }

#pragma warning restore IDE1006 // Naming Styles
}