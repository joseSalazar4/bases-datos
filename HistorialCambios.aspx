<%@ Page Title="Cambios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistorialCambios.aspx.cs" Inherits="Municipalidad_Bases.HomePage" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Historial de cambios</h2>
        <br />

        
        <asp:Panel runat="server" ID="pnlSeleccion">
            <div style="position: relative; left: 0px;">
                <h3>Seleccione la opción por consultar:</h3>
                <br />
                <asp:RadioButtonList ID="RBLSeleccion" runat="server" >
        <asp:ListItem Value="1">Usuario</asp:ListItem>
        <asp:ListItem Value="2">Propiedad</asp:ListItem>
        <asp:ListItem Value="3">Propietario</asp:ListItem>
        <asp:ListItem Value="4">Propietario Juridico</asp:ListItem>
    </asp:RadioButtonList>
            </div>
                <br />
        </asp:Panel>
        <asp:Panel runat="server" ID="PanelInsercion">
            <asp:Label ID="labelIdentificador" Text="Indique el identificador" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxIdentificador" runat="server" />
            <asp:Button class="btn btn-info" ID="ButtonConsultarCambios" runat="server" Text="Consultar" OnClick="ButtonConsultarCambios_Click" />
        </asp:Panel>
        <br />
        <asp:Panel runat="server" ID="PanelCalendars"   >                
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
            <asp:GridView ID="gridViewRawInfo" runat="server" AutoGenerateColumns="False" Width="940px">
            </asp:GridView>
        </asp:Panel>

        <br />
        <asp:Panel runat="server" ID="PanelProcessed">
            <div>
                <div style="float: left;">
                    <asp:GridView ID="gridViewAntes" runat="server" AutoGenerateColumns="True">
                        <Columns>
                            <asp:BoundField />
                        </Columns>
                    </asp:GridView>
                </div>

                <div style="float: right;">
                    <asp:GridView ID="gridViewDespues" runat="server" AutoGenerateColumns="True">
                        <Columns>
                            <asp:BoundField />
                        </Columns>
                    </asp:GridView>
                </div>
                <div style="clear: both"></div>
           </div>
           <h5 id="labelFecha" runat="server"></h5>
           <h5 id="labelUserChange" runat="server"></h5>
           <h5 id="labelIP" runat="server"></h5>
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
