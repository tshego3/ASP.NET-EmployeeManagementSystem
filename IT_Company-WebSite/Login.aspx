<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <!-- Required meta tags -->  
    <meta charset="utf-8"/>
    <meta name="description" content="Employee Management System"/>
    <meta name="keywords" content="ASP.NET and SQL"/>
    <meta name="author" content="Tshegofatso Given Ditau Motswagae"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!--Bootstrap, FontAwesome, then CSS-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>

    <title>Login</title>
</head>
<body>
    <!-- Navigation -->  
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-success">
    <div class="container">
    <a class="navbar-brand" href="#"><strong>IT Company</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                <a class="nav-link" href="Login.aspx">Login <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
        </div>
    </nav>

    <!-- Login form -->  
    <form id="form1" runat="server">
        <div class="container">

            <div class="con-center">
               <label for="inputUsername" class="col-sm-2 col-form-label">Username</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtUname" runat="server" Class="form-control"></asp:TextBox>
               </div>
               <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control"></asp:TextBox>
               </div>
                <div class="col-sm-10 con-space">
                   <asp:Button ID="btnLogin" runat="server" Class="btn btn-success" Text="Login" OnClick="btnLogin_Click"/>
                    <br />
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Text="Incorrect Username or Password!"></asp:Label>
               </div>
            </div>
        </div>
    </form>

    <!-- footer -->  
    <footer>
        <div class="container footer-pos">
            <p>
                &copy; 2020 IT Company &middot; <a href="Index.aspx">Home</a> &middot;
            </p>
        </div>
    </footer>

    <!--jQuery, then Bootstrap JS and Others-->
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>