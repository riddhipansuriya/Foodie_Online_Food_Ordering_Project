using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class Menu : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;
        int row, p;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Id"] = 0;
                Filllist();
            }
            if (Session["Email"] != null && Session["Email"].ToString() != "")
            {
                getcon();
                da = new SqlDataAdapter("SELECT * FROM Users WHERE Email = '" + Session["Email"].ToString() + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int id = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                string s = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = "Welcome :" + s;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void Filllist()
        {
            getcon();
            da = new SqlDataAdapter("select * from Products", con);
            ds = new DataSet();
            da.Fill(ds);
            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 3;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["Id"]);

            pg.DataSource = ds.Tables[0].DefaultView;

            
            LinkButton1.Enabled = !pg.IsFirstPage;
            LinkButton2.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();
        }


        protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            {
                if (e.CommandName == "cmd_view")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("viewDetails.aspx?id=" + id);
                }
                else if (e.CommandName == "cmd_add")
                {
                    da = new SqlDataAdapter("Select * from Users where Email ='" + Session["Email" +
                        ""] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                    int prodid = Convert.ToInt32(e.CommandArgument);

                    da = new SqlDataAdapter("Select * from Products where Id = '" + prodid + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    string prod_name = ds.Tables[0].Rows[0][2].ToString();
                    string prod_price = ds.Tables[0].Rows[0][3].ToString();
                    string img = ds.Tables[0].Rows[0][6].ToString();

                    int quantity = 1;

                    cmd = new SqlCommand("Insert into Cart(User_Cart_Id, Prod_Cart_Id,Prod_Image, Prod_Name, Prod_price, Prod_Quantity) values ('" + userid + "','" + prodid + "', '" + img + "','" + prod_name + "','" + prod_price + "','" + quantity + "')", con);
                    cmd.ExecuteNonQuery();

                }
            }
        }

        
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Cart_View.aspx");
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["Id"]);
            currentPage--;
            ViewState["Id"] = currentPage;
            Filllist();
        }

       
        protected void LinkButton3_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["Id"]);
            currentPage++;
            ViewState["Id"] = currentPage;
            Filllist();
        }

       

        
    }
}
