using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Foodie.User
{
    public partial class Checkout : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["Foodie_db"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_grid();
            }
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill_grid()
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM Users WHERE Email = '" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                da = new SqlDataAdapter("SELECT Prod_Name, Prod_Price, Prod_Quantity FROM Cart WHERE User_Cart_Id = '" + uid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvCart.DataSource = ds;
                    gvCart.DataBind();

                    decimal finalTotal = 0;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["Prod_Price"] != DBNull.Value && dr["Prod_Quantity"] != DBNull.Value)
                        {
                            decimal price = Convert.ToDecimal(dr["Prod_Price"]);
                            int qty = Convert.ToInt32(dr["Prod_Quantity"]);
                            finalTotal += price * qty;
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
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            getcon();

            if (Session["Email"] == null)
            {
                lblMessage.Text = "Please log in first.";
                return;
            }

            da = new SqlDataAdapter("SELECT * FROM Users WHERE Email = '" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "User not found.";
                return;
            }

            int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            da = new SqlDataAdapter("SELECT Prod_Name, Prod_Price, Prod_Quantity, Prod_cart_Id, Prod_Image FROM Cart WHERE User_Cart_Id = '" + uid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty.";
                return;
            }

            DataTable cartItems = ds.Tables[0];
            decimal totalAmount = 0;

            foreach (DataRow dr in cartItems.Rows)
            {
                if (dr["Prod_Price"] != DBNull.Value && dr["Prod_Quantity"] != DBNull.Value)
                {
                    totalAmount += Convert.ToDecimal(dr["Prod_Price"]) * Convert.ToInt32(dr["Prod_Quantity"]);
                }
            }

            string shippingAddress = txtShippingAddress.Text.Trim();
            string paymentMethod = rblPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(shippingAddress))
            {
                lblMessage.Text = "Please enter a shipping address.";
                return;
            }

            cmd = new SqlCommand("INSERT INTO orders_tbl (User_Id, Order_Date, Total_Amount, Order_Status, Shipping_Address, Payment_Method) " +
                                 "VALUES ('" + uid + "', '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + totalAmount +
                                 "', 'Pending', '" + shippingAddress + "', '" + paymentMethod + "'); SELECT SCOPE_IDENTITY();", con);

            int orderId = Convert.ToInt32(cmd.ExecuteScalar());

            foreach (DataRow dr in cartItems.Rows)
            {
                cmd = new SqlCommand("INSERT INTO order_items_tbl (Order_Id, Prod_Id, Prod_Name, Prod_Price, Prod_Quantity, Prod_Image) " +
                    "VALUES ('" + orderId + "', '" + dr["Prod_cart_Id"] + "', '" + dr["Prod_Name"] + "', '" + dr["Prod_Price"] + "', '" + dr["Prod_Quantity"] + "', '" + dr["Prod_Image"] + "')", con);
                cmd.ExecuteNonQuery();
            }

            cmd = new SqlCommand("DELETE FROM Cart WHERE User_Cart_Id = '" + uid + "'", con);
            cmd.ExecuteNonQuery();

            lblMessage.Text = "Order placed successfully!";
            gvCart.DataSource = null;
            gvCart.DataBind();
            lblFinalTotal.Text = "";
        }
    }
}
