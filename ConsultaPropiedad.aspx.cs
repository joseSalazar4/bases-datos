using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Municipalidad_Bases
{
    public partial class ConsultaPropiedad : System.Web.UI.Page
    {
        string IPActual = GetLocalIPAddress();
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkMostrarConceptosCobro_Click(object sender, EventArgs e)
        {

        }

        protected void botonVolver1_Click(object sender, EventArgs e)
        {

        }
    }
}