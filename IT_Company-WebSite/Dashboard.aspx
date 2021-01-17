<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

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

    <title>Dashboard</title>
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
                <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                <asp:Label ID="lblUname" runat="server" Class="nav-link" Text="Username"></asp:Label>
                </li>
            </ul>
        </div>
        </div>
    </nav>

    <!-- Login form --> 
    <form id="form1" runat="server">
        <div class="container">
            <div class="con-center">
               <asp:HiddenField ID="hfID" runat="server" />
               <label for="inputFirstname" class="col-sm-2 col-form-label">Firstname</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtFirstname" runat="server" Class="form-control"></asp:TextBox>
               </div>
               <label for="inputSurname" class="col-sm-2 col-form-label">Surname</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtSurname" runat="server" Class="form-control"></asp:TextBox>
               </div>
               <label for="inputTellNo" class="col-sm-2 col-form-label">TellNo</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtTellNo" runat="server" Class="form-control"></asp:TextBox>
               </div>
               <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
               <div class="col-sm-10">
                    <asp:TextBox ID="txtEmail" runat="server" Class="form-control"></asp:TextBox>
               </div>
               <div class="col-sm-10">
                   <div class="row con-space">
                       <div class="col-sm">
                          <div class="btn-group" role="group" aria-label="Basic example">
                          <asp:Button ID="btnSave" runat="server" Class="btn btn-success" Text="Save" OnClick="btnSave_Click" />
                          <asp:Button ID="btnDelete" runat="server" Class="btn btn-success" Text="Delete" OnClick="btnDelete_Click" />
                          <asp:Button ID="btnClear" runat="server" Class="btn btn-success" Text="Clear" OnClick="btnClear_Click" />
                          </div>
                       </div>
                       <div class="col-sm">
                          
                       </div>
                       <div class="col-sm">
                          <asp:Button ID="btnLogout" runat="server" Class="btn btn-success" Text="Logout" OnClick="btnLogout_Click" />
                       </div>
                   </div>
                        <br />
                        <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green" Text="Successful!"></asp:Label>
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Text="Incorrect Username or Password!"></asp:Label>
                </div>
                <div class="col-sm-10 con-space">
                    <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="tbFirstname" HeaderText="Firstname" />
                            <asp:BoundField DataField="tbSurname" HeaderText="Surname" />
                            <asp:BoundField DataField="tbTellNo" HeaderText="TellNo" />
                            <asp:BoundField DataField="tbEmail" HeaderText="Email" />
                           <asp:TemplateField>
                               <ItemTemplate>
                                   <asp:LinkButton ID="lbSelect" Text="Select" CommandArgument='<%# Eval("EmployeeID") %>' runat="server" OnClick="lbSelect_OnClick" />
                               </ItemTemplate>
                           </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
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