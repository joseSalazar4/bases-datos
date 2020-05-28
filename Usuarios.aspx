<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.cs" Inherits="Municipalidad_Bases.Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server" >Usuarios</h2>
        <h2 ID="labelTituloProp" runat="server" visible="false">Propiedades</h2> 
        <asp:Panel runat="server" ID="pnlDatosUsuarios">

            <div>
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-info" Text="Buscar Usuarios" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <br />
            <asp:GridView ID="gridViewUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewUsuarios_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkVerPropiedades" runat="server" Text="Ver Propiedades" OnClick="linkVerPropiedades_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button class="btn btn-info" ID="botonAgregar" Text="Agregar Usuario" runat="server" OnClick="botonNuevo_Click" />
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
            <br />
            <asp:Button class="btn btn-info" ID="botonGuardar" runat="server" Text="Guardar" OnClick="botonGuardar_Click" />
            <asp:Button class="btn btn-info" ID="botonActualizar" runat="server" Text="Actualizar" OnClick="botonActualizar_Click" />
        </asp:Panel>
        <asp:Panel ID="panelConexiones" runat="server" Visible="false">
            <asp:GridView ID="gridPropeidadesPorUsuario" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="numFinca" HeaderText="Número de Finca" />
                    <asp:BoundField DataField="valor" HeaderText="Valor" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
                    <asp:Button class="btn btn-info" ID="botonVolver" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
    </div>
</asp:Content>
