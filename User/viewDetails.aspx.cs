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
    public partial class viewDetails : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fill()
        {
            getcon();         
            da = new SqlDataAdapter("select * from Products where Id ='" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}