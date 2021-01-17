using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASP;

public partial class Dashboard : System.Web.UI.Page
{
    //string connectionString = @"Server=localhost;Database=it_company;Uid=root;Pwd=password;";
    //string connectionString = @"Server=sql9.freemysqlhosting.net;port=3306;Database=sql9367183;Uid=sql9367183;Pwd=EeJzPVAXHa;";
    string connectionString = "Data Source = (local); Initial Catalog = IT_CompanyWebAPI; Persist Security Info = True; User ID = admin; Password = password";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tbUname"] == null)
            Response.Redirect("Login.aspx");
            lblUname.Text = (string)Session["tbUname"];
            
        if (!IsPostBack)
        {
            Clear();
            GridFill();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("EmployeeAddOrEdit", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_employeeid", Convert.ToInt32(hfID.Value == "" ? "0" : hfID.Value));
                sqlCmd.Parameters.AddWithValue("_tbfirstname", txtFirstname.Text.Trim());
                sqlCmd.Parameters.AddWithValue("_tbsurname", txtSurname.Text.Trim());
                sqlCmd.Parameters.AddWithValue("_tbtellno", txtTellNo.Text.Trim());
                sqlCmd.Parameters.AddWithValue("_tbemail", txtEmail.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                GridFill();
                Clear();
                lblSuccessMessage.Text = "Submitted Successfully!";
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }

    }

    void Clear()
    {
        hfID.Value = "";
        txtFirstname.Text = txtSurname.Text = txtTellNo.Text = txtEmail.Text = "";
        btnSave.Text = "Save";
        btnDelete.Enabled = false;
        lblErrorMessage.Text = lblSuccessMessage.Text = "";
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    void GridFill()
    {
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllEmployees",sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            gvEmployees.DataSource = dtbl;
            gvEmployees.DataBind();
        }
    }

    protected void lbSelect_OnClick(object sender, EventArgs e)
    {
        int EmployeeID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewEmployeeByID", sqlCon);
            sqlDa.SelectCommand.Parameters.AddWithValue("_employeeid", EmployeeID);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfID.Value = EmployeeID.ToString();
            txtFirstname.Text = dtbl.Rows[0][1].ToString();
            txtSurname.Text = dtbl.Rows[0][2].ToString();
            txtTellNo.Text = dtbl.Rows[0][3].ToString();
            txtEmail.Text = dtbl.Rows[0][4].ToString();
            
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("DeleteEmployeeByID", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("_employeeid", Convert.ToInt32(hfID.Value == "" ? "0" : hfID.Value));
            sqlCmd.ExecuteNonQuery();
            GridFill();
            Clear();
            lblSuccessMessage.Text = "Deleted Successfully!";
        }
    }
}