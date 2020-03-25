<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Propietarios.aspx.cs" Inherits="Municipalidad_Bases.Propietarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2>Propiedades</h2>
    <asp:Panel runat="server" ID="pnlDatosPropietarios">
        <asp:GridView ID="gridViewPropietarios" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewPropietarios_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="NumId" HeaderText="Numero ID" />
                <asp:BoundField DataField="TipoId" HeaderText="Tipo ID" />
                <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />  
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="botonAgregar" Text="Agregar Propietario" runat="server" OnClick="botonNuevo_Click" />
    </asp:Panel>
    <asp:Panel ID="pnlAltaPropietarios" runat="server" Visible="false">
        <div>
            <asp:Label ID="labelID" Text="ID" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server" />
        </div>
        <div>
            <asp:Label ID="labelNombre" Text="Nombre" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxNombre" runat="server" />
        </div>
        <div>
            <asp:Label ID="labelNumID" Text="Numero ID" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxNumID" runat="server" />
        </div>
        <div>
            <asp:Label ID="labelTipoID" Text="Tipo ID" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxTipoID" runat="server" />
        </div>
        <br />
        <asp:Button ID="botonGuardar" runat="server" Text="Guardar " OnClick="botonGuardar_Click" />
        <asp:Button ID="botonActualizar" runat="server" Text="Actualizar" OnClick="botonActualizar_Click" />

    </asp:Panel>

</asp:Content>