<%@ Page Title="Propiedades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Propiedades.aspx.cs" Inherits="Municipalidad_Bases.Propiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Propiedades</h2>
        <h2 id="labelTituloPropietarios" runat="server" visible="false">Propietarios</h2>
        <h2 id="labelUsuarios" runat="server" visible="false">Usuarios</h2>
        <h2 id="labelCC" runat="server" visible="false">Conceptos de Cobros</h2>
        <h2 id="labelRecibos" runat="server" visible="false">Recibos</h2>


        <asp:Panel runat="server" ID="pnlDatosPropiedades">
            <div>
                <asp:Label ID="labelBusqueda" Text="Número de Finca" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-info" Text="Buscar Propiedades" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <div>
                <asp:Button class="btn btn-info" ID="botonAgregar" Text="Agregar Propiedad" runat="server" OnClick="botonNuevo_Click" />
            </div>
            <br />
            <asp:GridView ID="gridViewPropiedades" runat="server" AutoGenerateColumns="False" DataKeyNames="NumFinca" OnRowDeleting="gridViewPropiedades_RowDeleting" Width="940px">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="Numero Finca" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:CommandField ShowDeleteButton="true" DeleteText="Eliminar" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarPropietarios" runat="server" OnClick="linkMostrarPropietarios_Click" Text="Propietarios" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarUsuarios" runat="server" OnClick="linkMostrarUsuarios_Click" Text="Usuarios" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarConceptosCobro" runat="server" Text="Conceptos de Cobro" OnClick="linkMostrarConceptosCobro_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkMostrarRecibos" runat="server" Text="Ver Recibos" OnClick="LinkMostrarRecibos_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </asp:Panel>


        <asp:Panel ID="pnlAltaPropiedad" runat="server" Visible="false">
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
            <asp:GridView ID="gridPropietariosPorPropiedad" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="NumId" HeaderText="Numero ID" />
                    <asp:BoundField DataField="TipoId" HeaderText="Tipo ID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarRPropietatio" runat="server" Text="Eliminar relación" OnClick="EliminarRPropietatio_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <div>
                <asp:Label ID="labelRNumId" Text="Numero ID" runat="server"></asp:Label>
                <asp:Button class="btn btn-info" ID="ButtonInsertarRPropietario" runat="server" Text="Insertar" OnClick="ButtonInsertarRPropietario_Click" />
                <asp:TextBox ID="TextBoxRNumId" runat="server" />
            </div>
            <br />
            <asp:Button class="btn btn-info" ID="botonVolver" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
        </asp:Panel>


        <asp:Panel ID="panelUsuarios" runat="server" Visible="false">
            <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarRUsuario" runat="server" Text="Eliminar relación" OnClick="EliminarRUsuario_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <div>
                <asp:Label ID="labelRNombre" Text="Nombre" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxRNombre" runat="server" />
                <asp:Button class="btn btn-info" ID="ButtonInsertarRUsuario" runat="server" Text="Insertar" OnClick="ButtonInsertarRUsuario_Click" />
            </div>
            <br />
        </asp:Panel>


        <asp:Panel ID="panelRecibos" runat="server" Visible="false">
            
            <h2 id="H1" runat="server" visible="false">(Estado 0 es Pendiente \n Estado 1 es Pago)</h2>
            <asp:GridView ID="GridViewRecibos" runat="server" AutoGenerateColumns="true">
                <Columns>
                </Columns>
            </asp:GridView>
            <br />

            <asp:Button class="btn btn-info" ID="botonVolver1" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
        </asp:Panel>


        <asp:Panel ID="panelConceptos" runat="server" Visible="false">
            <asp:Label ID="Label2" Text="" runat="server"></asp:Label>
            <asp:GridView ID="GridViewConceptos" runat="server" AutoGenerateColumns="false" Width="1100px">
                <Columns>

                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="DiasRestantesVigencia" HeaderText="DiasRestantesVigencia" />
                    <asp:BoundField DataField="ValorMetrosCubicos" HeaderText="ValorMetrosCubicos" />
                    <asp:BoundField DataField="ValorPorcentaje" HeaderText="ValorPorcentaje" />
                    <asp:BoundField DataField="TasaInteresMor" HeaderText="TasaInteresMor" />
                    <asp:BoundField DataField="EsRecurrente" HeaderText="EsRecurrente" />
                    <asp:BoundField DataField="EsImpuesto" HeaderText="EsImpuesto" />
                    <asp:BoundField DataField="DiaCorte" HeaderText="DiaCorte" />
                    <asp:BoundField DataField="EsFijo" HeaderText="EsFijo" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarRCC" runat="server" Text="Eliminar relación" OnClick="EliminarRCC_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <div>
                <asp:Label ID="labelRID" Text="ID" runat="server"></asp:Label>
                <asp:TextBox ID="TextBoxRID" runat="server" />
                <asp:Button class="btn btn-info" ID="ButtonInsertarRCC" runat="server" Text="Insertar" OnClick="ButtonInsertarRCC_Click" />
            </div>
            <br />
            <asp:Button class="btn btn-info" ID="botonVolver2" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
        </asp:Panel>
    </div>

</asp:Content>
