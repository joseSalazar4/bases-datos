<%@ Page Title="Propiedades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaPropiedad.aspx.cs" Inherits="Municipalidad_Bases.ConsultaPropiedad" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Propiedades</h2>
        <h2 id="labelCC" runat="server" visible="false">Conceptos de Cobros</h2>

        <asp:Panel runat="server" ID="pnlDatosPropiedades">
            <asp:GridView ID="gridViewPropiedades" runat="server" AutoGenerateColumns="False" DataKeyNames="NumFinca" Width="940px">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="Numero Finca" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarConceptosCobro" runat="server" Text="Conceptos de Cobro" OnClick="linkMostrarConceptosCobro_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="panelCC" runat="server" Visible="false">
            <asp:GridView ID="GridViewRecibos" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                </Columns>
            </asp:GridView>
            <br />
            <br />

            <asp:Button class="btn btn-info" ID="botonVolver1" runat="server" Text="Volver" OnClick="botonVolver1_Click" Visible="false" />
        </asp:Panel>

       
    </div>

</asp:Content>

