<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PayrollWebApplication.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="mystyle.css" rel="stylesheet" />
</head>
<body>
    <div class="loginbox">
        <img src="user-icon-png-image.jpg" alt="Alternate Text" class="user" />
        <h1>Login Here</h1>
        <form runat="server">
            <asp:Label Text="Email" CssClass="lblemail" runat="server" />
            <asp:TextBox ID="TxtEmail" runat="server" CssClass="txtemail" placeholder="Email" />
            <asp:Label Text="Password" CssClass="lblpass" runat="server" />
            <asp:TextBox ID="TxtPass" runat="server" CssClass="txtpass" TextMode="Password" placeholder="**********"/>
            <asp:Button Text="Sign In" CssClass="btnsubmit" runat="server" OnClick="Unnamed5_Click" />
            <asp:LinkButton Text="Forget Password" CssClass="btnforget" runat="server" />
        </form>
    </div>
</body>
</html>
