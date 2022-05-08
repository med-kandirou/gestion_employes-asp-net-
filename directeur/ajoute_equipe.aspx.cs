using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation.directeur
{
    public partial class ajoute_equipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "DIRECTEUR";

            labelSuccc.Visible = false;
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            GridViewRow SelectedRow = GridChef.SelectedRow;
            string cin = SelectedRow.Cells[1].Text;
            foreach (GridViewRow gvrow in GridEmp.Rows)
            {
                CheckBox check = (CheckBox)gvrow.FindControl("CheckBox1");
                if (check.Checked)
                {
                    Directeur.ajouteEquipe(int.Parse(Id.Text.Trim()), cin.Trim().ToString(), gvrow.Cells[0].Text.Trim().ToString());
                }
            }
            labelSuccc.Visible = true;

            //vider les champs
            Id.Text = string.Empty;
            foreach (GridViewRow gvrow in GridEmp.Rows)
            {
                CheckBox check = (CheckBox)gvrow.FindControl("CheckBox1");
                if (check.Checked)
                {
                    check.Checked = false;

                }
            }
             GridChef.SelectedIndex = -1;

             SelectedRow.BackColor = System.Drawing.Color.White;
        }

        protected void GridChef_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridChef, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void GridChef_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}