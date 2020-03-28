<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Municipalidad_Bases._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido a la plataforma mejor creada en ASP!</h1>
    <br />
    <h2>Esta pagina fue creada por Jose Salazar</h2>
    
    <asp:Panel runat="server" ID="pnlDatosCliente">
        <asp:Label runat="server" Text="Para accesar a las propiedades o propietarios vea le menu de arriba" />
    </asp:Panel>

</asp:Content>
