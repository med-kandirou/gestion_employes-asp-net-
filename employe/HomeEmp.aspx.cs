using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Projet_Fin_Formation
{
    public partial class testMaster : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblnom = (Label)Master.FindControl("user_name");
            lblnom.Text = Session["nom"].ToString()+"  ";

            Label lblprenom = (Label)Master.FindControl("user_prenom");
            lblprenom.Text = Session["prenom"].ToString();

            Label lblrole = (Label)Master.FindControl("role_user");
            lblrole.Text = "EMPLOYE";


        }
    }
}