using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCategory();
                BindData();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (fldProductImg.HasFile)
            {
                fnm = "~/ProductImages/" + fldProductImg.FileName;
                fldProductImg.SaveAs(Server.MapPath(fnm));
            }
        }

        void FillCategory()
        {
            getcon();
            da = new SqlDataAdapter("select * from Categories", con);
            ds = new DataSet();
            da.Fill(ds);
            

            
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlCategory.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
            }
        }
    

        void Clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtCode.Text = "";
            txtDescription.Text = "";
            ddlCategory.SelectedIndex = 0;
            fldProductImg.Attributes.Clear();
            
        }

        protected void btnAddOrUpdate_Click1(object sender, EventArgs e)
        {
            getcon();
            imgupload();

            cmd = new SqlCommand("INSERT INTO Products(Product_Category_Id, Name, Price, Code, Description, ImageUrl) " +
                                 "VALUES('" + ddlCategory.SelectedValue + "', '" + txtProductName.Text + "', '" + txtPrice.Text + "','"+ txtCode.Text+ "', '" + txtDescription.Text + "', '" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            BindData();

            Clear();
        }

        void BindData()
        {
            da = new SqlDataAdapter("SELECT * FROM Products", con);
            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }


    }
}
