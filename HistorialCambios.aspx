<%@ Page MaintainScrollPositionOnPostback="true" Title="Cambios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistorialCambios.aspx.cs" Inherits="Municipalidad_Bases.HomePage" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Historial de cambios</h2>
        <br />


        <asp:Panel runat="server" ID="pnlSeleccion">
            <div style="position: relative; left: 0px;">
                <h3>Seleccione la opción por consultar:</h3>
                <br />
                <asp:RadioButtonList ID="RBLSeleccion" runat="server">
                    <asp:ListItem Value="1">Propiedad</asp:ListItem>
                    <asp:ListItem Value="2">Propietario</asp:ListItem>
                    <asp:ListItem Value="3">Usuario</asp:ListItem>
                    <asp:ListItem Value="4">Propiedad y Usuario</asp:ListItem>
                    <asp:ListItem Value="5">Propiedad y Propietario</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <br />
        </asp:Panel>
        <asp:Panel runat="server" ID="PanelInsercion">
            <asp:Button class="btn btn-info" ID="ButtonConsultarCambios" runat="server" Text="Consultar" OnClick="ButtonConsultarCambios_Click" />
        </asp:Panel>
        <br />
        <asp:Panel runat="server" ID="PanelCalendars">
            <div style="float: left;">
                <asp:Calendar ID="CalendarInicio" runat="server" SelectionMode="Day" OnSelectionChanged="CalendarInicio_SelectionChanged" />
            </div>
            <div style="float: right;">
                <asp:Calendar ID="CalendarFinal" runat="server" SelectionMode="Day" OnSelectionChanged="CalendarFinal_SelectionChanged" />
                <div style="clear: both"></div>
            </div>
            <br />
        </asp:Panel>
        <br />

        <asp:Panel runat="server" ID="PanelInfo" Visible="false">
            <asp:GridView ID="gridViewRawInfo" runat="server" AutoGenerateColumns="True" Width="940px">
            </asp:GridView>
        </asp:Panel>

        <br />
        <asp:Panel runat="server" ID="PanelProcessed">


            <h4 id="labelFecha" runat="server"></h4>
            <h4 id="labelUserChange" runat="server"></h4>
            <h4 id="labelIP" runat="server"></h4>

            <h4 id="H1" runat="server" Visible ="false" >Antes</h4>
            <asp:GridView ID="gridViewAntes" runat="server" AutoGenerateColumns="True">
            </asp:GridView>

            <br />
            <br />
            <h4 id="H2" Visible="false" runat="server" >Despues</h4>
            <asp:GridView ID="gridViewDespues" runat="server" AutoGenerateColumns="True">
            </asp:GridView>
        </asp:Panel>
        <br />
        <div>
            <div style="float: left;">
                <asp:Button class="btn btn-info" ID="ButtonBack" Visible="false" runat="server" Text="Anterior" OnClick="ButtonBack_Click" />
            </div>

            <div style="float: right;">
                <asp:Button class="btn btn-info" ID="ButtonNext" Visible="false" runat="server" Text="Siguiente" OnClick="ButtonNext_Click" />
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
</asp:Content>
