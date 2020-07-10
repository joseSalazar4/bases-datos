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
            <asp:GridView ID ="GridViewComprobantes" runat="server" AutoGenerateColumns="true">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarRecibosDeComprobante" runat="server" Text=" Ver Recibos" OnClick="linkMostrarRecibosDeComprobante_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="panelCC" runat="server" Visible="false">
            <h2>Recibos Pendientes</h2>
            <br />

                <asp:GridView ID="GridViewRecibosPendientes" runat="server" AutoGenerateColumns="true">
            <columns>
                </columns>
            </asp:GridView>
            <br />
            <h2>Recibos Pagos</h2>
            <br />
                <asp:GridView ID="GridViewRecibosPagos" runat="server" AutoGenerateColumns="true">
                    <Columns>
                    </Columns>
                </asp:GridView>
            
            <br />
            <asp:Button class="btn btn-info" ID="botonVolver1" runat="server" Text="Volver" OnClick="botonVolver1_Click" />
        </asp:Panel>

    <asp:Button class="btn btn-info" ID="ButtonMostrarComprobantes" runat="server" Text="Ver Comprobantes" OnClick="ButtonMostrarComprobantes_Click" />
        <asp:TextBox ID="TxtBoxNumFinca" runat="server" Text=""/>
    </div>

</asp:Content>

