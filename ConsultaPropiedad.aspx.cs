using System;
using System.Net;
using System.Data;
using System.Net.Sockets;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Municipalidad_Bases
{
    public partial class ConsultaPropiedad : System.Web.UI.Page
    {
        public static string labelID, user;
        string IPActual = GetLocalIPAddress();
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
                    labelTitulo.InnerText = "Finca número: "+labelID;
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