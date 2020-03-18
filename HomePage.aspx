<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Municipalidad_Bases.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <h1>Bienvenido a la página de la municipalidad</h1>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Esta es la lista de todas las propiedades </h2>
        <div>    
            <asp:Button ID="botonBuscarPropietario" runat="server" Text="Buscar Propietario" OnClick="botonBuscarPropietario_Click" />
        </div>
        <div>
            <asp:Button ID="botonBuscarPropiedad" runat="server" Text="Buscar Propiedad" OnClick="botonBuscarPropiedad_Click" /> 
        </div>
    </form>
</body>
</html>
