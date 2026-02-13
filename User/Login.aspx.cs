using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class Login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Text = "";
            }

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
      

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != null && txtPassword.Text != null)
            {
                getcon();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE email='" + txtEmail.Text + "' AND password='" + txtPassword.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["Email"] = txtEmail.Text;
                    Response.Redirect("Menu.aspx");
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Invalid username or password.";
                }
            }
        }
    }

    }

