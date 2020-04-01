<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.cs" Inherits="Municipalidad_Bases.Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Usuarios</h2>
    <div class="jumbotron">
        <asp:Panel runat="server" ID="pnlDatosUsuarios">
            <div>
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button Text="Buscar Usuarios" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <br />
            <asp:GridView ID="gridViewUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewUsuarios_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false"  />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="botonAgregar" Text="Agregar Usuario" runat="server" OnClick="botonNuevo_Click" />
        </asp:Panel>
        <asp:Panel ID="pnlAltaUsuarios" runat="server" Visible="false">
            <div>
                <asp:Label ID="labelNombre" Text="Nombre" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxNombre" runat="server" />
            </div>
            <div>
                <asp:Label ID="labelPassword" Text="Password" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxPassword" runat="server" />
            </div>
            <div>
                <asp:Label ID="labelID" Text="ID" runat="server" Visible="false"></asp:Label>
            </div>
            <br />
            <asp:Button ID="botonGuardar" runat="server" Text="Guardar tee" OnClick="botonGuardar_Click" />
            <asp:Button ID="botonActualizar" runat="server" Text="Actualizar ente" OnClick="botonActualizar_Click" />

        </asp:Panel>
    </div>
</asp:Content>
