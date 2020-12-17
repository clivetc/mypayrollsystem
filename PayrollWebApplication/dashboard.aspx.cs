using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace PayrollWebApplication
{
    public partial class dashboard : System.Web.UI.Page

    {
        string connectionString = @"Data Source =DESKTOP-AIL232N;Initial Catalog=payroll;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void BtnGenPayroll_Click(object sender, EventArgs e)
        {
            string name = emp.SelectedItem.Text;
            string role = emp.SelectedValue;

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AIL232N;Initial Catalog=payroll;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM salary WHERE role='" + role+"'", con);
            SqlDataReader result = cmd.ExecuteReader();
            result.Read();

            double basic = double.Parse(result["basic_pay"].ToString());
            double da = double.Parse(result["da"].ToString());
            double hra = double.Parse(result["hra"].ToString());
            double other = double.Parse(result["other"].ToString());
            double deductions = double.Parse(result["deductions"].ToString());

            double da_c = basic = (da / 100);
            double hra_c = basic = (hra / 100);
            double other_c = basic = (other / 100);
            double deductions_c = basic = (deductions / 100);


            Session["basic"] = basic;
            Session["da"] = da_c;
            Session["hra"] = hra_c;
            Session["other"] = other_c;
            Session["deductions"] = deductions_c;


            Session["name"] = name;
            Session["role"] = role;

            Response.Redirect("Payroll.aspx");
        }

        protected void BtnAddEmp_Click(object sender, EventArgs e)
        {
            using(SqlConnection sqlconn = new SqlConnection(connectionString))
            {
                sqlconn.Open();
                string query = "INSERT INTO employee (name,role) values ('"+TxtName.Text+"','"+TxtRole.Text+"')";
                SqlCommand sqlcmd = new SqlCommand(query, sqlconn);
                sqlcmd.ExecuteNonQuery();
            }


        }

        protected void BtnDeleteEmp_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(connectionString))
            {
                sqlconn.Open();
                string query = "DELETE FROM employee WHERE Name = ('" + TxtName.Text + "')";
                SqlCommand sqlcmd = new SqlCommand(query, sqlconn);
                sqlcmd.ExecuteNonQuery();

            }
        }
    }
}