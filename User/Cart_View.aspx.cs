using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Foodie.User
{
    public partial class Cart_View : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int uid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);            
            con.Open();
        }

        void fillGrid()
        {
            getcon();

            
            da = new SqlDataAdapter("SELECT * FROM Users WHERE Email='" + Session["Email"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                
                uid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);
                
                
                da = new SqlDataAdapter("SELECT *, (Prod_Price * Prod_Quantity) AS Total FROM Cart WHERE User_Cart_Id='" + uid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                gvCart.DataSource = ds;
                gvCart.DataBind();

                decimal finalTotal = 0;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["Total"] != DBNull.Value)
                    {
                        finalTotal += Convert.ToDecimal(dr["Total"]);
                    }
                }

                lblFinalTotal.Text = "Final Total: ₹" + finalTotal.ToString("0.00");
            }
            else
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
                lblFinalTotal.Text = "Final Total: ₹0.00";
            }
        }

        protected void update_cart_btn_Click(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM Users WHERE Email='" + Session["Email"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                uid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);

                foreach (GridViewRow row in gvCart.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow && row.RowIndex < gvCart.DataKeys.Count)
                    {
                        int cart_id = Convert.ToInt32(gvCart.DataKeys[row.RowIndex].Value);
                        TextBox txtQty = (TextBox)row.FindControl("txtQuantity");

                        int quantity = 1;
                        int.TryParse(txtQty.Text, out quantity);
                        if (quantity < 1) quantity = 1;

                        cmd = new SqlCommand("UPDATE Cart SET Prod_Quantity=" + quantity + " WHERE Id=" + cart_id + " AND User_Cart_Id=" + uid, con);
                        cmd.ExecuteNonQuery();
                    }
                }

                fillGrid();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void back_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int cart_id = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("DELETE FROM Cart WHERE Id=" + cart_id, con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }
    }
}
