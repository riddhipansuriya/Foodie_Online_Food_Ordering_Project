using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Foodie.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {            
                getcon();            
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (fldimg.HasFile)
            {
                fnm = "~/CategoryImages/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }          
        }

        void clear()
        {
            txtName.Text = "";
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            imgupload();
            cmd = new SqlCommand("INSERT INTO Categories (Name, ImageUrl) VALUES ('" + txtName.Text + "', '" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}
