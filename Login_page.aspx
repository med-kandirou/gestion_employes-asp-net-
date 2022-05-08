<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_page.aspx.cs" Inherits="Projet_Fin_Formation.Login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Style/Login_css.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"/>
    <title>Login</title>
    <link rel="shortcut icon" href="image/faviconEM.png" type="image/x-icon"/>

</head>
<body>
    <header class="container-fluid ">
        <div class="row">
            <div class="col-md-5">
                <img src="image/logo.png" id="logo"/>
            </div>
            <div class="col-md-7">
	              <ul class="nav justify-content-end">
                        <li class="nav-item">
                          <a class="nav-link" href="#"><i class='fab fa-facebook'></i></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#"><i class='fab fa-instagram'></i></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#"><i class='fab fa-telegram-plane'></i></a>
                        </li>
                         <li class="nav-item">
                          <a class="nav-link" href="#"><i class='fab fa-twitter '></i></a>
                        </li>
                      </ul>
                 </div>
            </div>
    </header>

    <div class="container-fluid" runat="server">
        <section class="row">
            <div class="col-md-7">
                <img src="image/Login_pic.jfif" id="img_aside"/>
            </div>
            <div class="col-md-5" id="login_panel">
                    <img src="image/Lock.png" id="lock_pic"/><br />
                   <asp:Label ID="login_lbl" CssClass="d-flex justify-content-center margin"  runat="server" Text="Authentification" ></asp:Label> 
                
                <form id="form1" runat="server" >
                    <asp:Label Cssclass="lbl_log" runat="server" Text="IDENTIFIANT :"></asp:Label>&nbsp;<asp:RequiredFieldValidator class="col-md-1" ID="RequiredFieldID" runat="server" ErrorMessage="Champ Identifiant obligatoire" ControlToValidate="txtidentifiant">*</asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtidentifiant" runat="server" Cssclass="form-control" placeholder="Ex:Z6587239"></asp:TextBox><br />
                    <asp:Label class="lbl_log" runat="server" Text="MOT DE PASSE :"></asp:Label>&nbsp;<asp:RequiredFieldValidator class="col-md-1" ID="RequiredFieldPass" runat="server" ErrorMessage="Mot de Passe  obligatoire" ControlToValidate="txtpass">*</asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtpass" runat="server" TextMode="password" placeholder="Password" Cssclass="form-control margin"></asp:TextBox>

                    <button id="btntoggle" type="button" class="btn btn-outline-dark"><img src="image/password_toggle.png" id="password_toggle"/></button><br /><br />
                    <asp:Button ID="btnconnecter" runat="server" Text="Se Connecter →" Cssclass="btn btn-outline-success form-control" OnClick="btnconnecter_Click" /><br /><br />
                    <asp:Button ID="btnmdpoublie" runat="server" Text="Mot de Passe Oublié ? " Cssclass="btn btn-outline-danger form-control margin" CausesValidation="False" />
                    <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="alert alert-danger" />
                </form>
            </div>
        </section>
       </div>      


    <div id="footer" >
        <p>
            <i class="fa fa-copyright" aria-hidden="true"></i> Copyright : 2021/2022 <br />
            Mohamed Kandirou<br />
            Amine Kazzout </p>
            <p>Encadré par Mr: Adil Tais</p>
    </div>
</body>
<script src="Scripts/jquery-3.6.0.min.js"></script>
<script src="javaScript/Login_js.js"></script>

</html>
