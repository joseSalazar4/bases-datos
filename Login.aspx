<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Municipalidad_Bases.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <img src="Fondo.png" class="panel"/>
        </section>
        <div class="sec2">
            <div class="container">
                <div class="content">
                    <h2>Iniciar Sesión</h2>
                    <asp:TextBox ID="textUsuario" runat="server"></asp:TextBox>
                    <asp:TextBox ID="textContrasena" runat="server" TextMode="Password"/>
                    <asp:Button class="btn btn-dark" ID="botonLogin" runat="server" Text="Login" OnClick="botonLogin_Click" />
                </div>
            </div>
        </div>
        <style>
            body{
                margin:0;
                padding:0;
                background-image:url('FondoPantalla.png');
                background-attachment:fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
            section{
                display:flex;
                justify-content:center;
                align-items:normal;
            }

            .sec2{
                position:absolute;
                left:0;
                right:0;
                top:0;
                bottom:0;
                width:100vw;
                height:100vh;
                display:flex;
                justify-content:center;
                align-items:center;

            }
            .sec2 .container {
                width:45vw;
                height:66vh;
            }
            .sec2 .container img{
                width:905vw;
                height:900vh;
                padding-left:0vw;

            }
            .content h2{
                font-family:'Segoe UI', Tahoma, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding-left:7vw;

            }
            .content input[type=text]{
                height:30px;
                border:0;
                margin-top:2.5vh;
                margin-left:4vw;
                border-radius:20px;
            }
            .content input[type=submit]{
                color:whitesmoke;
                margin-left:4vw;
                margin-top:2vh;
                padding-bottom:10px;
                padding-top:10px;
                padding-left:15px;
                padding-right:15px;
                border-radius:6px;
                border: 1px solid;
                background-color:dodgerblue;
            }
            .content input[placeholder]{
                font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                padding-left:1vw;
                font-size:13px;
            }
        </style>
    </form>
</body>

</html>


    
