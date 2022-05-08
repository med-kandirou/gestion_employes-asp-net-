using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public partial class Login_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RequiredFieldID.ForeColor = System.Drawing.Color.Red;
            RequiredFieldPass.ForeColor= System.Drawing.Color.Red;
            
        }
        DataTable dtemp = new DataTable();
        DataTable dtchef = new DataTable();
        DataTable dtdir = new DataTable();

        protected void btnconnecter_Click(object sender, EventArgs e)
        {
            //dtemp = Employe.affichEmployeInfo(txtidentifiant.Text);
            //if (dtemp.Rows.Count == 1)
            //{
            //    if (Employe.checkIdentifiantEmploye(txtidentifiant.Text, txtpass.Text) == true)
            //    {
            //        Session["cin"] = txtidentifiant.Text;
            //        Session["nom"] = dtemp.Rows[0][1].ToString();
            //        Session["prenom"] = dtemp.Rows[0][2].ToString();
            //        Session["date_nais"] = dtemp.Rows[0][3].ToString();
            //        Session["echelle"] = dtemp.Rows[0][4].ToString();
            //        Session["id_contrat"] = dtemp.Rows[0][5].ToString();
            //        Response.Redirect("~/employe/HomeEmp.aspx");
            //    }
            //    else
            //    {
            //        Response.Write("login failed");
            //    }
            //    return;
            //}

            //dtchef = chef.affichChefInfo(txtidentifiant.Text);
            //if (dtchef.Rows.Count > 0)
            //{
            //    if (chef.checkIdentifiantChef(txtidentifiant.Text, txtpass.Text) == true)
            //    {
            //        Session["cin"] = txtidentifiant.Text;
            //        Session["nom"] = dtchef.Rows[0][1].ToString();
            //        Session["prenom"] = dtchef.Rows[0][2].ToString();
            //        Session["date_nais"] = dtchef.Rows[0][3].ToString();
            //        Session["id_contrat"] = dtchef.Rows[0][4].ToString();
            //        Response.Redirect("~/Chef/HomeChef.aspx");
            //    }
            //    else
            //    {
            //        Response.Write("login failed");
            //    }
            //    return;
            //}

            dtdir = Directeur.affichDirInfo(txtidentifiant.Text);
            if (dtdir.Rows.Count == 1)
            {
                if (Directeur.checkIdentifiantDirecteur(txtidentifiant.Text, txtpass.Text) == true)
                {
                    Session["cin"] = txtidentifiant.Text;
                    Session["nom"] = dtdir.Rows[0][1].ToString();
                    Session["prenom"] = dtdir.Rows[0][2].ToString();
                    Session["date_nais"] = dtdir.Rows[0][3].ToString();
                    Response.Redirect("~/directeur/HomeDirector.Aspx");
                }
                else
                {
                    Response.Write("login failed");
                }
                return;
            }
            else
            {
                Response.Write("error");
                return;
            }

        }
    }
}