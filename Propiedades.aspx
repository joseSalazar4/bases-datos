<%@ Page Title="Propiedades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Propiedades.aspx.cs" Inherits="Municipalidad_Bases.Propiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Propiedades</h2>
        <h2 id="labelTituloPropietarios" runat="server" visible="false">Propietarios</h2>
        <h2 id="labelUsuarios" runat="server" visible="false">Usuarios</h2>

        <asp:Panel runat="server" ID="pnlDatosPropiedades">
            <div>
                <asp:Label ID="labelBusqueda" Text="Número de Finca" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-info" Text="Buscar Propiedades" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <br />

            <asp:GridView ID="gridViewPropiedades" runat="server" AutoGenerateColumns="False" DataKeyNames="NumFinca" OnRowDeleting="gridViewPropiedades_RowDeleting" Width="1000">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="Numero Finca" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarPropietarios" runat="server" OnClick="linkMostrarPropietarios_Click" Text="Ver Propietarios" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarUsuarios" runat="server" OnClick="linkMostrarUsuarios_Click" Text="Ver Usuarios" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarConceptosCobro" runat="server" Text="Ver Conceptos de Cobro" OnClick="linkMostrarConceptosCobro_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <br />
            <asp:Button class="btn btn-info" ID="botonAgregar" Text="Agregar Propiedad" runat="server" OnClick="botonNuevo_Click" />
        </asp:Panel>


        <asp:Panel ID="pnlAltaPropiedad" runat="server" Visible="false">
            <asp:Label ID="labelMensajeError" Text=" Por favor revise el tipo de los datos" runat="server" Visible="false" />
            <div>
                <asp:Label ID="labelNumFinca" Text="Numero Finca" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxNumFinca" runat="server" />
            </div>
            <div>
                <asp:Label ID="labelValor" Text="Valor" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxValor" runat="server" />
            </div>
            <div>
                <asp:Label ID="labelDireccion" Text="Dirección" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxDireccion" runat="server" />
            </div>
            <div>
                <asp:Label ID="labelActualizar" runat="server" Visible="false"></asp:Label>
            </div>
            <br />

            <asp:Button class="btn btn-info" ID="botonGuardar" runat="server" Text="Guardar" OnClick="botonGuardar_Click" />
            <asp:Button class="btn btn-info" ID="botonActualizar" runat="server" Text="Actualizar" OnClick="botonActualizar_Click" />

        </asp:Panel>
        <asp:Panel ID="panelConexiones" runat="server" Visible="false">
            <asp:Label ID="LblN" Text="" runat="server"></asp:Label>
            <asp:GridView ID="gridPropietariosPorPropiedad" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="NumId" HeaderText="Numero ID" />
                    <asp:BoundField DataField="TipoId" HeaderText="Tipo ID" />
                </Columns>
            </asp:GridView>
            <asp:Button class="btn btn-info" ID="botonVolver" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
        </asp:Panel>

        <asp:Panel ID="panelUsuarios" runat="server" Visible="false">
            <asp:Label ID="Label1" Text="" runat="server"></asp:Label>
            <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Button class="btn btn-info" ID="Button1" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
    </div>

</asp:Content>
