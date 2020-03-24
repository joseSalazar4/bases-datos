<%@ Page Title="Propiedades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Propiedades.aspx.cs" Inherits="Municipalidad_Bases.Propiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2>Propiedades</h2>
    <asp:Panel runat="server" ID="pnlDatosPropiedades">
        <asp:GridView ID="gridViewPropiedades" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewPropiedades_RowDeleting">
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
        <asp:Button ID="botonGuardar" runat="server" Text="Guardar tee" OnClick="botonGuardar_Click" />
        <asp:Button ID="botonActualizar" runat="server" Text="Actualizar ente" OnClick="botonActualizar_Click" />

    </asp:Panel>

</asp:Content>
