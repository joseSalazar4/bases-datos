<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Servicios.aspx.cs" Inherits="Municipalidad_Bases.Servicios" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <h2>Servicios</h2>
    <asp:Panel runat="server" ID="pnlDatosServicios">
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
                <asp:Label ID="labelID" Text="ID" runat="server" Visible="false"></asp:Label>
            </div>
            <br />
            <asp:Button class="btn btn-info" ID="botonGuardar"  runat="server" Text="Guardar" OnClick="botonGuardar_Click" />
        </asp:Panel>

        <br/>
        <asp:RadioButton ID="RadioButtonPorcentaje" runat="server" Text="Porcentaje" OnCheckedChanged="RadioButtonPorcentaje_CheckedChanged" />
        <asp:RadioButton ID="RadioButtonConsumo" runat="server" Text="Consumo" OnCheckedChanged="RadioButtonConsumo_CheckedChanged"/>
        <asp:RadioButton ID="RadioButtonIntMor" runat="server" Text="Interes Moratorio" OnCheckedChanged="RadioButtonIntMor_CheckedChanged"/>
        <asp:RadioButton ID="RadioButtonFijo" runat="server" Text="Fijo" OnCheckedChanged="RadioButtonFijo_CheckedChanged"/>
        <br />
        <asp:TextBox ID="textBoxTipoConsumo" runat="server" /> 
        <asp:Button ID="botonGenerarCC" runat="server" class="btn btn-info" Text="Generar Concepto de Cobro" />
    </asp:Panel>
        </div>
        

</asp:Content>