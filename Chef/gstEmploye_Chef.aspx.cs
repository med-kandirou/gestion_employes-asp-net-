using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "CHEF";
            btnCancl.Visible = false;
            btnconfirm.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            chef.removeEmp(Request.QueryString["cin_emp"]);
            Response.Redirect("~/Chef/EmployeList_chef.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Chef/EmployeList_chef.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Edit);
            DetailsView1.DataBind();
            btnconfirm.Visible = true;
            btnCancl.Visible = true;
            btnupdate.Visible = false;
            btnDelete.Visible=false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            DetailsView1.DataBind();
            btnconfirm.Visible = false;
            btnCancl.Visible = false;
            btnupdate.Visible = true;
            btnDelete.Visible = true;
        }

        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            DetailsView1.UpdateItem(true);
            btnconfirm.Visible = false;
            btnCancl.Visible = false;
            btnupdate.Visible = true;
            btnDelete.Visible = true;
        }
    }
}