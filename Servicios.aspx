<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Servicios.aspx.cs" Inherits="Municipalidad_Bases.Servicios" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <h2>Servicios</h2>
    <asp:Panel runat="server" ID="pnlDatosServicios">
        <div>
        <asp:Button ID="botonRegistrarProJuridico" runat="server" class="btn btn-info" Text="Registrar Propietario Jurídico" />
        </div>
        <asp:Button ID="botonGenerarCC" runat="server" class="btn btn-info" Text="Generar Concepto de Cobro" />
        <br/>
        <asp:RadioButton ID="RadioButtonPorcentaje" runat="server" Text="Porcentaje" />
        <asp:RadioButton ID="RadioButtonConsumo" runat="server" Text="Consumo" />
        <asp:RadioButton ID="RadioButtonIntMor" runat="server" Text="Interes Moratorio" />
        <asp:RadioButton ID="RadioButtonFijo" runat="server" Text="Fijo" />
        <br />
        <asp:TextBox ID="textBoxTipoConsumo" runat="server" /> 
    </asp:Panel>
        </div>
        

</asp:Content>