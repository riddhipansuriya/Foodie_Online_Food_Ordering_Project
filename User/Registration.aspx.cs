using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Xml.Linq;

namespace Foodie.User
{
    public partial class Registration : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        string fnm = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Visible = false;
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            imgupload();

            getcon();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Users (Name, Username, Email, Mobile, Address, PostCode, Password, UserImage) " +
                "VALUES ('" + txtName.Text + "', '" + txtUsername.Text + "', '" + txtEmail.Text + "', '" +
                txtMobile.Text + "', '" + txtAddress.Text + "', '" + txtPostCode.Text + "', '" +
                txtPassword.Text + "', '" + fnm + "')", con);

            cmd.ExecuteNonQuery();
           

            lblMsg.Text = "User Registered Successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Visible = true;

            Clear();
        }

        private void imgupload()
        {
            if (fuUserImage.HasFile)
            {
                fnm = "User_image/" + fuUserImage.FileName;
                fuUserImage.SaveAs(Server.MapPath(fnm));
            }
        }

        private void Clear()
        {
            txtName.Text = "";
            txtUsername.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtAddress.Text = "";
            txtPostCode.Text = "";
            txtPassword.Text = "";
            imgUser.ImageUrl = "";
            fnm = "";
        }
    }
}