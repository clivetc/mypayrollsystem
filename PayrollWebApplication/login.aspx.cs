using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace PayrollWebApplication
{
    public partial class login : System.Web.UI.Page
    {
        string connectionString = @"Data Source =DESKTOP-AIL232N;Initial Catalog=payroll;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(connectionString))
            {
                sqlconn.Open();
                string query = "SELECT(1) FROM login WHERE  Email='"+TxtEmail.Text+"'and Password='"+TxtPass.Text+"'";
                SqlCommand sqlCmd = new SqlCommand(query, sqlconn);
                
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count==1)
                {
                    Session["Email"] = TxtEmail.Text.Trim();
                    Response.Redirect("dashboard.aspx");
                }
            }
        }
    }
}