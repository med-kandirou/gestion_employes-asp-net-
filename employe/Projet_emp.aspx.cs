using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation.employe
{
    public partial class Projet_emp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //recuperation de donne
            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "EMPLOYE";
            GridView2.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView1.Visible = false;

        }
    }
}