using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                txtechelle.Items.Add("Qualifiant");
                txtechelle.Items.Add("Technicien");
                txtechelle.Items.Add("TS");
                txtechelle.Items.Add("Ingenieur");
            }
            Label7.Visible = false;
            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString() + "  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "DIRECTEUR";

        }

        protected void CDI_CheckedChanged(object sender, EventArgs e)
        {
            txt_datefin.Enabled = false;
        }

        protected void CDD_CheckedChanged(object sender, EventArgs e)
        {
            txt_datefin.Enabled = !txt_datefin.Enabled;
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            try 
            {
                //ajoute contrat
                string type;
                Settings.Connecter();
                if (CDI.Checked)
                {
                    type = "CDI";
                }
                else
                {
                    type = "CDD";
                }
                Settings.cmd.CommandText = "insert into Contrat values (" + txtidContrat.Text + ",'" + txtCin1.Text + "','" + type + "'," + txtSalaire.Text + ",'" + txt_datedebut.Text + "','" + txt_datefin.Text + "');";
                Settings.cmd.Connection = Settings.cnx;
                Settings.cmd.ExecuteNonQuery();

                //ajoute employe
                Settings.cmd.CommandText = "insert into employe values ('" + txtCin1.Text + "','" + txtnom.Text + "','" + txtprenom.Text + "','" + txtDateNaiss.Text + "','" + txtechelle.Text + "'," + txtidContrat.Text + ");";
                Settings.cmd.Connection = Settings.cnx;
                Settings.cmd.ExecuteNonQuery();

                Label7.Visible = true;
            }
            catch
            {
                Label7.Text = "une erreur s'est produit";
                Label7.Visible = true;
                Label7.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}