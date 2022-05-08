using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public class Employe
    {
        public static string cin;
        public static string nom;
        public static string prenom;
        public static DateTime date_naiss;
        public static string echelle;
        public static int idContrat;

        public Employe(string Cin,string Nom,string Prenom,DateTime Date_naiss,string Echelle,int idcontrat)
        {
            cin = Cin;
            nom = Nom;
            prenom = Prenom;
            date_naiss = Date_naiss;
            echelle = Echelle;
            idContrat = idcontrat;
        }
        
        public static DataTable affichEmployeInfo(string txt)
        {
            
            Settings.Connecter();
            Settings.cmd.CommandText = "select * from employe where CIN='"+txt.Trim()+"'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;

            Settings.da.Fill(Settings.ds,"employe");

            if (Settings.ds.Tables["employe"].Rows.Count == 1)
            {
                //employe.cin = Settings.ds.Tables["employe"].Rows[0][0].ToString();
                //employe.nom = Settings.ds.Tables["employe"].Rows[0][1].ToString();
                //employe.prenom = Settings.ds.Tables["employe"].Rows[0][2].ToString();
                //employe.date_naiss = DateTime.Parse(Settings.ds.Tables["employe"].Rows[0][3].ToString());
                //employe.echelle = Settings.ds.Tables["employe"].Rows[0][4].ToString();
                //employe.idContrat = int.Parse(Settings.ds.Tables["employe"].Rows[0][5].ToString());
                return Settings.ds.Tables["employe"];
            }
            else 
            {
                return Settings.ds.Tables["employe"];
            }
            
            Settings.deconnecter();
            
        }
        public static bool checkIdentifiantEmploye(string txt,string mdp) 
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select * from [login] where Cin_identifiant='" + txt.Trim() + "'and mdp='"+mdp.Trim()+"'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.rd = Settings.cmd.ExecuteReader();
            bool res = Settings.rd.HasRows;

            Settings.rd.Close();
            return res;
        }
        public static void afficheProjetEmp(GridView grid, string cin_emp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "SELECT Equipe.cin_emp#, projet.designation, projet.Date_debut_p, projet.Date_fin_p, Entrep_cible.Nom_entrep, Entrep_cible.adresse FROM Entrep_cible INNER JOIN projet ON Entrep_cible.id_projet# = projet.id_projet INNER JOIN Equipe ON projet.id_eq# = Equipe.id_eq WHERE (Equipe.cin_emp# ='"+cin_emp+"')";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds, "projet");
            grid.DataSource = Settings.ds.Tables["projet"];
            grid.DataBind();
            Settings.deconnecter();
        }
        public static bool afficheProjetEmprecherche(DropDownList dl,GridView grid, string cin_emmp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "SELECT id_projet,id_eq# as 'Equipe',designation,Date_debut_p as 'Date Debut',Date_fin_p as 'Date Fin' FROM projet INNER JOIN Equipe ON projet.id_eq# = Equipe.id_eq where id_projet='" + dl.SelectedValue.ToString()+ "' AND Equipe.cin_emp# ='"+cin_emmp+"'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds, "projetSearch");
            if (Settings.ds.Tables["projetSearch"].Rows.Count>0)
            {
                grid.DataSource = Settings.ds.Tables["projetSearch"];
                grid.DataBind();
                return true;
            }
            else
            {
                return false; 
            }
            Settings.deconnecter();
        }
        public static void AffichEquipeEmp(Label lblIdEq,Label lblprechef,Label lblnomchef ,string cin_emp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "SELECT Equipe.id_eq, Chef.Nom, Chef.Prenom FROM Chef INNER JOIN Equipe ON Chef.CIN = Equipe.cin_chef# WHERE (Equipe.cin_emp# ='"+cin_emp+"')";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds,"chefInfo");

            lblnomchef.Text = Settings.ds.Tables["chefInfo"].Rows[0][1].ToString();
            lblprechef.Text= Settings.ds.Tables["chefInfo"].Rows[0][2].ToString();
            lblIdEq.Text = Settings.ds.Tables["chefInfo"].Rows[0][0].ToString();

            //Settings.ds.Tables["chefInfo"]
            //Settings.rd = Settings.cmd.ExecuteReader();
            //if (Settings.rd.HasRows==true)
            //{
            //    while (Settings.rd.Read())
            //    {
            //        lblnomchef.Text = Settings.rd[0].ToString();
            //        lblprechef.Text = Settings.rd[1].ToString();
            //    }
            //    Settings.rd.Close();
            //}

            Settings.deconnecter();
        }

    }
}