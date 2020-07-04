using System;
using System.Web;
using System.Data;
using System.Linq;
using System.Web.UI;
using Newtonsoft.Json;
using System.Web.Helpers;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Ajax.Utilities;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Collections;
using System.Web.Configuration;

namespace Municipalidad_Bases
{
    public partial class HomePage : System.Web.UI.Page
    {
        public static int indexCambio = 0;
        public static string[,] listaDatos;
        public static GridViewRow rowActual;
        public static string labelFechaInicio, labelFechaFin;

        public DataTable deserializeJSON(string JSON)
        {
            var table = JsonConvert.DeserializeObject<DataTable>(JSON);
            return table;
        }
        
    

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            CalendarFinal.Visible = false;
            CalendarInicio.Visible = false;
        }

        protected void CalendarFinal_SelectionChanged(object sender, EventArgs e)
        {
            labelFechaFin = CalendarFinal.SelectedDate.ToShortDateString();

        }

        protected void ButtonConsultarCambios_Click(object sender, EventArgs e)
        {
            string nombreSP = "";
            CalendarFinal.Visible = false;
            CalendarInicio.Visible = false;
            if (RBLSeleccion.SelectedValue == "m")
            {
                nombreSP = "SPSPropiedad";
            }

            else if (RBLSeleccion.SelectedValue=="m")
            {
                nombreSP = "SPSPropietario";
            }

            else if (RBLSeleccion.SelectedValue=="ms")
            {
                nombreSP = "";
            }

            else if (RBLSeleccion.SelectedValue != "")
            {
                labelFecha.Visible = true;
                labelFecha.InnerText = RBLSeleccion.SelectedValue;
                nombreSP = "";
            }

           /* using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = nombreSP;
                cmd.Connection = conn;
                conn.Open();
                gridViewRawInfo.DataSource = cmd.ExecuteReader();
                gridViewRawInfo.DataBind();
            }*/
            if (gridViewRawInfo.Rows.Count>1)
            {
                rowActual = gridViewRawInfo.Rows[0];
                actualizarTablas();
                ButtonBack.Visible = true;
                ButtonNext.Visible = true;
            }
        }

        public void actualizarTablas()
        {
            labelFecha.InnerText = rowActual.Cells[0].ToString();
            gridViewAntes.DataSource= deserializeJSON(rowActual.Cells[1].ToString());
            gridViewAntes.DataBind();
            gridViewDespues.DataSource = deserializeJSON(rowActual.Cells[2].ToString());
            gridViewDespues.DataBind();
            labelUserChange.InnerText = rowActual.Cells[3].ToString();
            labelIP.InnerText = rowActual.Cells[4].ToString();
        }
        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            indexCambio += 1;
            rowActual = gridViewRawInfo.Rows[indexCambio];
            actualizarTablas();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            indexCambio -= 1;
            rowActual = gridViewRawInfo.Rows[indexCambio];
            actualizarTablas();
        }

        protected void RadioButtonPropietarioJuridico_CheckedChanged(object sender, EventArgs e)
        {
           // RadioButtonPropiedad.Checked = RadioButtonUsuario.Checked = RadioButtonPropietario.Checked = false;
            PanelCalendars.Visible = true;
            CalendarFinal.Visible = true;

        }

        protected void RadioButtonPropietario_CheckedChanged(object sender, EventArgs e)
        {
            //RadioButtonPropiedad.Checked = RadioButtonUsuario.Checked = RadioButtonPropietarioJuridico.Checked = false;
            labelFecha.InnerText = "Propietario";
            labelFecha.Visible = true;
            PanelCalendars.Visible = true;
        }

        protected void RadioButtonPropiedad_CheckedChanged(object sender, EventArgs e)  
        {
           // RadioButtonPropietario.Checked = RadioButtonUsuario.Checked = RadioButtonPropietarioJuridico.Checked = false;
            PanelCalendars.Visible = true;
        }

        protected void RadioButtonUsuario_CheckedChanged(object sender, EventArgs e)
        {
            //RadioButtonPropiedad.Checked = RadioButtonPropietario.Checked = RadioButtonPropietarioJuridico.Checked = false;
            PanelCalendars.Visible = true;
        }

        protected void CalendarInicio_SelectionChanged(object sender, EventArgs e)
        {
            labelFechaInicio = CalendarInicio.SelectedDate.ToShortDateString();
        }


        //CHECK THEM ONLY IF THE OTHER DOESN'T WORK OUT
       
        public void processJson()
        {
            string[,] DataValue = new string[gridViewRawInfo.Rows.Count, gridViewRawInfo.Columns.Count];
            foreach (DataGridViewRow row in gridViewRawInfo.Rows)
            {
                foreach (DataGridViewColumn col in gridViewRawInfo.Columns) DataValue[row.Index, col.Index] = gridViewRawInfo.Rows[row.Index].Cells[col.Index].ToString();
            }
            listaDatos = DataValue;
        }
    }
}