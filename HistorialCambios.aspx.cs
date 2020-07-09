﻿using System;
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
using System.Text.RegularExpressions;

namespace Municipalidad_Bases
{
    public partial class HomePage : System.Web.UI.Page
    {
        public static int indexCambio = 1;
        public static string[,] listaDatos;
        public static GridViewRow rowActual;
        public static string labelFechaInicio, labelFechaFin;

        public DataTable deserializeJSON(string JSON)
        {
            if (JSON == "&nbsp;") return null;
            JSON = Regex.Unescape(JSON);
            JSON = JSON.Replace("&quot;", @"""");
            JSON = JSON.Replace(@"\", "");
            DataTable table = JsonConvert.DeserializeObject<DataTable>(JSON);
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

        protected void ButtonConsultarCambios_Click(object sender, EventArgs e)
        {
            string nombreSP = "";
            CalendarFinal.Visible = false;
            CalendarInicio.Visible = false;
            if (RBLSeleccion.SelectedValue == "1")
            {
                nombreSP = "SPSCambiosPropiedades";
            }

            else if (RBLSeleccion.SelectedValue=="2")
            {
                nombreSP = "SPSCambiosPropietarios";
            }

            else if (RBLSeleccion.SelectedValue=="3")
            {
                nombreSP = "";
            }

            else if (RBLSeleccion.SelectedValue == "4")
            {
                nombreSP = "";
            }
            else if (RBLSeleccion.SelectedValue == "5")
            {
                nombreSP = "";
            }
            else if (RBLSeleccion.SelectedValue == "6")
            {
                nombreSP = "";
            }
            else if (RBLSeleccion.SelectedValue == "7")
            {
                nombreSP = "";
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = nombreSP;
                cmd.Parameters.Add("@InFechaInicio", SqlDbType.Date).Value = labelFechaInicio;
                cmd.Parameters.Add("@InFechaFin", SqlDbType.Date).Value = labelFechaFin;
                cmd.Connection = conn;
                conn.Open();
                gridViewRawInfo.DataSource = cmd.ExecuteReader();
                gridViewRawInfo.DataBind();
            }

            if (gridViewRawInfo.Rows.Count>0)
            {
                rowActual = gridViewRawInfo.Rows[0];
                actualizarTablas();
                ButtonBack.Visible = true;
                ButtonNext.Visible = true;
            }
            else
            {
                ButtonNext.Visible = true;
                ButtonBack.Visible = true;
            }
        }
 
    public void actualizarTablas()
        {
            _ = rowActual.Cells[2].Text;
            labelFecha.InnerText = rowActual.Cells[0].Text;
            gridViewAntes.DataSource = deserializeJSON(rowActual.Cells[1].Text);
            gridViewAntes.DataBind();
            gridViewDespues.DataSource = deserializeJSON(rowActual.Cells[2].Text);
            gridViewDespues.DataBind();
            labelUserChange.InnerText = rowActual.Cells[3].Text;
            labelIP.InnerText = rowActual.Cells[4].Text;
        }
        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            int m = gridViewRawInfo.Rows.Count;
            if (gridViewRawInfo.Rows.Count < indexCambio ) return;    
            indexCambio += 1;
            rowActual = gridViewRawInfo.Rows[indexCambio];
            actualizarTablas();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            if (indexCambio == 0) return;
            indexCambio -= 1;
            rowActual = gridViewRawInfo.Rows[indexCambio];
            actualizarTablas();
        }
        protected void CalendarFinal_SelectionChanged(object sender, EventArgs e)
        {
            labelFechaFin = CalendarFinal.SelectedDate.ToShortDateString();

        }
        protected void CalendarInicio_SelectionChanged(object sender, EventArgs e)
        {
            labelFechaInicio = CalendarInicio.SelectedDate.ToShortDateString();
        }

        
    }
}