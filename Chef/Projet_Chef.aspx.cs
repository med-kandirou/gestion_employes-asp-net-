using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "CHEF";
            GridView2.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView1.Visible = false;
            if (DropDownList1.SelectedValue == "all")
            {
                GridView2.Visible = false;
                GridView1.Visible = true;
            }
        }
    }
}