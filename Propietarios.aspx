<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Propietarios.aspx.cs" Inherits="Municipalidad_Bases.Propietarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 ID="labelTitulo" runat="server"  >Propietarios</h2> 
        <h2 ID="labelTituloProp" runat="server" visible="false">Propiedades</h2> 
        <asp:Panel runat="server" ID="pnlDatosPropietarios">
            <div>
                <asp:Label Text="Número ID" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-info" Text="Buscar Propietarios" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <br />
            <asp:GridView ID="gridViewPropietarios" runat="server" AutoGenerateColumns="false" DataKeyNames="NumId" OnRowDeleting="gridViewPropietarios_RowDeleting" >
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="NumId" HeaderText="Numero ID" />
                    <asp:BoundField DataField="TipoId" HeaderText="Tipo ID" />
                    <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton  ID="linkActualizar" runat="server" Text=" Actualizar" OnClick="linkActualizar_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarPropiedades" runat="server" Text=" Propiedades " OnClick="linkMostrarPropiedades_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button class="btn btn-info" ID="botonAgregar" Text="Agregar Propietario" runat="server" OnClick="botonNuevo_Click" />
        </asp:Panel>
        <asp:Panel ID="pnlAltaPropietarios" runat="server" Visible="false">
            <asp:Label ID="labelMensajeError" Text =" Por favor revise el tipo de los datos" runat="server" Visible="false"/>
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
            <div>
                <asp:Label ID="labelActualizar" runat="server" Visible="false"></asp:Label>
            </div>
            <br />
            <asp:Button class="btn btn-info" ID="botonGuardar"  runat="server" Text="Guardar" OnClick="botonGuardar_Click" />
            <asp:Button class="btn btn-info" ID="botonActualizar" runat="server" Text="Actualizar" OnClick="botonActualizar_Click" />

        </asp:Panel>
        <asp:Panel ID="panelConexiones" runat="server" Visible="false">
            <asp:GridView ID="gridPropeidadesPorPropietario" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="numFinca" HeaderText="Número de Finca" />
                    <asp:BoundField DataField="valor" HeaderText="Valor" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarRPropiedad" runat="server" Text="Eliminar relación" OnClick="EliminarRPropiedad_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <div>
                <asp:Label ID="labelRNumFinca" Text="Numero Finca: " runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxRNumFinca" runat="server" />
                <asp:Button class="btn btn-info" ID="ButtonInsertarRPropiedad" runat="server" Text="Insertar" OnClick=  "ButtonInsertarRPropiedad_Click" />
            </div>
            <br />
        </asp:Panel>
            <asp:Button class="btn btn-info" ID="botonVolver" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
    </div>
</asp:Content>
