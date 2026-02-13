using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class BookTable : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
            }

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("INSERT INTO Book (Name, Number, Email, Member, Date) VALUES ('"
                + txtName.Text + "', '" + txtPhone.Text + "', '" + txtEmail.Text + "', '"
                + ddlPersons.SelectedValue + "', '" + txtDate.Text + "')", con);

            cmd.ExecuteNonQuery();

            
        }

        

    }
}