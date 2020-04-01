<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Municipalidad_Bases.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="labelUsuario" runat="server" Text="Usuario"></asp:Label>
        </div>
                <div>
                    <asp:TextBox ID="textUsuario" runat="server"></asp:TextBox>
                </div>
        <div>
            <asp:Label ID="labelContrasena" runat="server" Text="Contrasena" />
        </div>
        <div>
            <asp:TextBox ID="textContrasena" runat="server" TextMode="Password" />

        </div>
        <div>
            <asp:Button class="btn btn-dark" ID="botonLogin" runat="server" Text="Login" OnClick="botonLogin_Click" />
        </div>
        <div>
            <asp:Label ID="labelMensaje" runat="server" ForeColor="RED" />
        </div>
    </form>
</body>
</html>
