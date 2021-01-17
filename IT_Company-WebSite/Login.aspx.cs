using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //using (SqlConnection sqlCon = new SqlConnection(@"Server=sql9.freemysqlhosting.net;port=3306;Database=sql9367183;Uid=sql9367183;Pwd=EeJzPVAXHa;Integrated Security=True;"))
        using (SqlConnection sqlCon = new SqlConnection("Data Source = (local); Initial Catalog = IT_CompanyWebAPI; Persist Security Info = True; User ID = admin; Password = password"))
        {
            sqlCon.Open();
            string query = "SELECT COUNT(1) FROM users WHERE tbUname=@tbUname AND tbPass=@tbPass";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@tbUname",txtUname.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@tbPass",txtPass.Text.Trim());
            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            if (count == 1)
            {
                Session["tbUname"] = txtUname.Text.Trim();
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblErrorMessage.Visible = true;
            }
        }
    }
}