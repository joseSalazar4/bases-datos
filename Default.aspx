<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Municipalidad_Bases._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido a la plataforma mejor creada en ASP!</h1>
    <br />
    <h2>Esta pagina fue creada por Jose Salazar</h2>
    
    <asp:Panel runat="server" ID="pnlDatosCliente">
        <h4>Estos son los residentes que están actualmente en nuestra base de datos</h4>
        <asp:GridView ID="gridViewClientes" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewClientes_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />  
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="botonAgregar" Text="Agregar Cliente" runat="server" OnClick="botonNuevo_Click" />
    </asp:Panel>
    <asp:Panel ID="pnlAltaCliente" runat="server" Visible="false">
        <div>
            <asp:Label ID="labelNombre" Text="Nombre" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxNombre" runat="server" />
        </div>
<div>
            <asp:Label ID="labelID" Text="ID" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server" />
        </div>
        <br />
        <asp:Button ID="botonGuardar" runat="server" Text="Guardar Cliente" OnClick="botonGuardar_Click" />
        <asp:Button ID="botonActualizar" runat="server" Text="Actualizar Cliente" OnClick="botonActualizar_Click" />

    </asp:Panel>

</asp:Content>
