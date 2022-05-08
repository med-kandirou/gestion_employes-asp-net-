using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "CHEF";

            pnlAdd.Visible = false;

           
        }

        protected void ddlEquipes_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            foreach(GridViewRow gvrow in GridView1.Rows)
            {
                CheckBox CB = (CheckBox)gvrow.FindControl("CBDelete");
                if (CB.Checked)
                { 
                    chef.removeEmpFequi(gvrow.Cells[0].Text);
                    GridView1.DataBind();
                }
                
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }
        
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            pnlAdd.Visible = true;
        }

        protected void btnTerminer_Click(object sender, EventArgs e)
        {
            chef.addEmpInEquipe(int.Parse(ddlEquipes.SelectedValue.Trim().ToString()), Session["cin"].ToString(), txtcin.Text.Trim().ToString(),lblres);
            GridView1.DataBind();
        }
    }
}