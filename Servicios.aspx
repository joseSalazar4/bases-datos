<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Servicios.aspx.cs" Inherits="Municipalidad_Bases.Servicios" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2>Propiedades</h2>
    <asp:Panel runat="server" ID="pnlDatosServicios">
        <asp:GridView ID="gridViewServicios" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridView_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click1" />  
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="botonAgregar" Text="Agregar Cliente" runat="server" OnClick="botonNuevo_Click" />
    </asp:Panel>
    <asp:Panel ID="pnlAltaServicios" runat="server" Visible="false">
        <div>
            <asp:Label ID="labelNombre" Text="Nombre" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxNombre" runat="server" />
        </div>
        <div>
            <asp:Label ID="labelID" Text="ID" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server" />
        </div>
        <br />
        <asp:Button ID="botonGuardar" runat="server" Text="Guardar Usuario" OnClick="botonGuardar_Click" />
        <asp:Button ID="botonActualizar" runat="server" Text="Actualizar Usuario" OnClick="botonActualizar_Click" />

    </asp:Panel>

</asp:Content>