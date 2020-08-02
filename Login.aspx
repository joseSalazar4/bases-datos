<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Municipalidad_Bases.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <h1 style="text-align:center;color:#FFF;">Bienvenido a la Municipalidad de Cartago</h1><br>

    <form id="form1" runat="server">
        <div class="sec2">
            <div class="container" style="text-align:center;"> 
                <h2 style="font-size: 30px;"><b>Iniciar Sesión</b></h2>
                <div class="content">
                    <asp:TextBox ID="textUsuario" runat="server"></asp:TextBox>
                    <asp:TextBox ID="textContrasena" runat="server" TextMode="Password"/>
                    </div>
                    <asp:Button class="btn btn-dark" ID="botonLogin" style="font-size: 25px;" runat="server" Text="Login" OnClick="botonLogin_Click" />
                 <div style="text-align:center;">
                <img src="LogoMunicipalidad.png" class="muni"/>
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
                font-family:'Segoe UI', Tahoma, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

            }
            .content{
                text-align:left;
                padding-left: 590px; 
                font-size: 30px;
            }
            input{
                margin: 5px 0px;
                border: 2px solid #000;
                border-radius: 10px;
                padding: 5px;
                display: inline-block;
            }
            #text{
                margin-left: 25px;
            }
            content input[placeholder]{
                font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                padding-left:1vw;
            }
            button{
                font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                border: 2px solid #000;
                border-radius: 15px;
                padding: 10px;
                margin: 10px 0px 40px;
                text-decoration: none;
                font-weight: 600;
                font-size: 20px;
                color: #206487;
                background-color: transparent;
                text-align:center;
            }
            button:hover{
                color:#ffffff;
                background-color: #F78181;
          }
          .muni{
            width: 430px;
            height: 270px;
            position: relative;
            left: -118px;
            top: 4px;
          }
        </style>
    </form>
</body>

</html>


    
