<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payroll.aspx.cs" Inherits="PayrollWebApplication.Payroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Generator page</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="breadcrumb">
                <h1>Payroll for <%=Session["name"] %></h1>
            </div>
            <div>
                <label><%=DateTime.Today %></label><br />
                <h3>Role - <b><%=Session["role"] %></b></h3>

                <div class ="row">
                    <div class ="col-lg-6">
                        Basic Pay
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=Session["basic"] %>
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        D.A
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=Session["da"] %>
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        HRA
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=Session["hra"] %>
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        Other Allowances
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=Session["other"] %>
                    </div>
                    </div>
                    <div class ="row">
                    <div class ="col-lg-6">
                        Deductions
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=Session["deductions"] %>
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        Gross Salary
                    </div>
                </div>
                <div class ="row">
                    <div class ="col-lg-6">
                        <%=double.Parse(Session["basic"].ToString())+double.Parse(Session["da"].ToString())+double.Parse(Session["hra"].ToString())+double.Parse(Session["other"].ToString())-double.Parse(Session["deductions"].ToString()) %>
                    </div>
                </div>

                <button title="Print" onclick="myPrint()">Print</button>
                <script type ="text/javascript">
                    function myPrint() {
                        window.print();
                    }
                </script>
            </div>
        </div>
    </form>
</body>
</html>
