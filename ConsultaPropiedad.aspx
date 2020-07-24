<%@ Page Title="Propiedades" Language="C#" MasterPageFile="~/ClientSite.Master" AutoEventWireup="true" CodeBehind="ConsultaPropiedad.aspx.cs" Inherits="Municipalidad_Bases.ConsultaPropiedad" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h3 id="labelTitulo" runat="server">Propiedades</h3>
        <h5 id="labelCC" runat="server" visible="false">(Estado: 1 Pago y 0 Pendiente)</h5>

        <asp:Panel runat="server" ID="pnlDatosPropiedades">
            <asp:GridView ID="gridViewPropiedades" runat="server" AutoGenerateColumns="False" DataKeyNames="NumFinca" Width="940px">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="Numero Finca" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarRecibos" runat="server" Text="Recibos" OnClick="linkMostrarRecibos_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="panelComprobantes" runat="server" Visible="false">
            <asp:GridView ID="GridViewComprobantes" runat="server" AutoGenerateColumns="true">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarRecibosDeComprobante" runat="server" Text=" Ver Recibos" OnClick="linkMostrarRecibosDeComprobante_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="panelPagar" runat="server" Visible="false">
            <h2>Recibos Pendientes</h2>
            <h3>Seleccione los recibos a pagar</h3>
            <br />
             <asp:GridView ID="GridViewRecibosPendientesCOPY" runat="server" AutoGenerateColumns="true" Visible="false">
                 <Columns>
                 </Columns>
             </asp:GridView>
            <asp:GridView ID="GridViewRecibosPendientes2" runat="server" AutoGenerateColumns="true" Width="60%" CssClass="mygrdContent"
                PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnRowDataBound="GridViewRecibosPendientes2_RowDataBound"                
            AlternatingRowStyleBackColor="White">
                <Columns>
                <asp:TemplateField HeaderText="Select Data">  
                    
                    <ItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" />  
                    </ItemTemplate>  
                </asp:TemplateField> 
                </Columns>
            </asp:GridView>
            <asp:Button class="btn btn-info" ID="ButtonCotizar" runat="server" Text="Cotizar" OnClick="ButtonCotizar_Click" />
        </asp:Panel>
        <asp:Panel ID="panelCC" runat="server" Visible="false">

            <h2>Recibos Pendientes</h2>
            <br />
            <asp:GridView ID="GridViewRecibosPendientes" runat="server" AutoGenerateColumns="true" Width="90%" CssClass="mygrdContent"
                PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnRowDataBound="GridViewRecibosPendientes_RowDataBound">
                <Columns>
                </Columns>
            </asp:GridView>
            <br />
            <h2>Recibos Pagos</h2>
            <br />
            <asp:GridView ID="GridViewRecibosPagos" runat="server" AutoGenerateColumns="true" Width="90%" CssClass="mygrdContent"
                PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" >
                <Columns></Columns>
            </asp:GridView>
            <br />
            <asp:Button class="btn btn-info" ID="botonVolver1" runat="server" Text="Volver" OnClick="botonVolver1_Click" />

            <asp:Button class="btn btn-info" ID="ButtonMostrarPantallaPagos" runat="server" Text="Ir a Pagar Recibos" OnClick="ButtonMostrarPantallaPagos_Click" />
        </asp:Panel>

        <asp:Button class="btn btn-info" ID="ButtonMostrarComprobantes" runat="server" Text="Ver Comprobantes" OnClick="ButtonMostrarComprobantes_Click" />

        <asp:TextBox ID="TxtBoxNumFinca" runat="server" Text="" />
    </div>
    <style>
        .grdContent {
            width: 80%;
            border: solid 4px black;
            min-width: 80%;
            text-align: center;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 25px;
            text-align:  center !important;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: center;
            border: none 0px transparent;
        }

            .rows:hover {
                background-color: #5bc0de;
                font-family: Arial;
                color: #fff;
                text-align: center;
            }

        .selectedrow {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .mygrdContent a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
            background-color: #000;
            color: #fff;
        }

        .mygrdContent span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: center;
        }

        .mygrdContent td {
            padding: 5px;
        }

        .mygrdContent th {
            padding: 5px;
        }
    </style>

</asp:Content>

