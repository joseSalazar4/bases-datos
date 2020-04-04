<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PropietarioJuridico.aspx.cs" Inherits="Municipalidad_Bases.PropiedadJuridica" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2 id="labelTitulo" runat="server">Propietarios Jurídicos</h2>
        <h2 id="labelPropiedades" runat="server">Propiedades</h2>
        <h2 id="labelRepresentantes" runat="server">Representante</h2>

        <asp:Panel runat="server" ID="pnlDatosPropietariosJuridicos">
            <div>
                <asp:Label Text="Nombre Responsable" runat="server" />
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-info" Text="Buscar Propietarios" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" />
            </div>
            <br />
            <asp:GridView ID="gridViewPropietarios" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowDeleting="gridViewPropietarios_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="NumIDResponsable" HeaderText="Número ID Responsable" />
                    <asp:BoundField DataField="NombreResponsable" HeaderText="Nombre Responsable" />
                    <asp:CommandField ShowDeleteButton="true" EditText="Eliminar" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkActualizar" runat="server" Text="Actualizar" OnClick="linkActualizar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarPropiedades" runat="server" Text="Ver Propietarios" OnClick="linkMostrarPropiedades_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkMostrarRepresentante" runat="server" Text="Ver Representante" OnClick="linkMostrarRepresentante_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <br />
            <asp:Button class="btn btn-info" ID="botonAgregar" Text="Agregar Propiedad" runat="server" OnClick="botonNuevo_Click" />
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
                <asp:Label ID="labelID" Text="ID" runat="server" Visible="false"></asp:Label>
            </div>
            <br />
            <asp:Button class="btn btn-info" ID="botonGuardar"  runat="server" Text="Guardar" OnClick="botonGuardar_Click" />
            <asp:Button class="btn btn-info" ID="botonActualizar" runat="server" Text="Actualizar" OnClick="botonActualizar_Click" />

        </asp:Panel>
        <asp:Panel ID="panelConexiones" runat="server" Visible="false">
            <asp:GridView ID="gridPropiedadesPorPropietario" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="numFinca" HeaderText="Número de Finca" />
                    <asp:BoundField DataField="valor" HeaderText="Valor" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="panelRepresentantes" runat="server" Visible="false">
                    <asp:Label ID="NumIDResponsable" Text="Número ID Responsable: " runat="server" />
                    <br />
                    <asp:Label ID="NombreResponsable" Text="Nombre Responsable: " runat="server" />                    
        </asp:Panel>
            <asp:Button class="btn btn-info" ID="botonVolver" runat="server" Text="Volver" OnClick="botonVolver_Click" Visible="false" />
    </div>
</asp:Content>
