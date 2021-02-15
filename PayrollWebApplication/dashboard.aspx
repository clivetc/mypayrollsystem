<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="PayrollWebApplication.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style="width:1000px; margin:auto" class="main-form needs-validation" >
        <div class="container">
            <div class="breadcrumb">
                <h1>Payroll System</h1>
            </div>
            
            <div>
            <asp:DropDownList ID="emp" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="role" AutoPostBack="true" CssClass="form-control">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:payrollConnectionString %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblName" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control"></asp:TextBox >
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblRole" runat="server" Text="Role"></asp:Label>
                        <asp:TextBox ID="TxtRole" runat="server" CssClass="form-control"></asp:TextBox>
                        <small class="form-text text-muted">
                            This should be a Valid Role
                        </small>
                    </div>
                </div>
            </div>
            
            <div class="container">
             <div class="row">
                 <div class="col-md-12">
                     <asp:Button ID="BtnAddEmp" runat="server" class="btn- btn-primary" Text="Add Employee" OnClick="BtnAddEmp_Click" />

                     <asp:Button ID="BtnDeleteEmp" runat="server" class="btn-success" Text="Delete Employee" OnClick="BtnDeleteEmp_Click" />
                 </div>
            </div>
            </div>
            <div class="container">
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive " runat="server" AutoGenerateColumns="False" DataKeyNames="Role" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Role" HeaderText="Role" ReadOnly="True" SortExpression="Role" />
                    <asp:BoundField DataField="Basic_pay" HeaderText="Basic_pay" SortExpression="Basic_pay" />
                    <asp:BoundField DataField="Da" HeaderText="Da" SortExpression="Da" />
                    <asp:BoundField DataField="Hra" HeaderText="Hra" SortExpression="Hra" />
                    <asp:BoundField DataField="Other" HeaderText="Other" SortExpression="Other" />
                    <asp:BoundField DataField="Deductions" HeaderText="Deductions" SortExpression="Deductions" />
                </Columns>
            </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:payrollConnectionString %>" SelectCommand="SELECT * FROM [salary] WHERE ([Role] = @Role)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="emp" Name="Role" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Button ID="BtnGenPayroll" runat="server" CssClass="btn-dark" Text="Generate Salary" OnClick="BtnGenPayroll_Click" />
        </div>
    </form>
    <script>
        var form = document.querySelector('.need-validation');

        form.addEventListener('AddEmp', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }
    </script>
</body>
</html>
