using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public class chef
    {
        public static string cin;
        public static string nom;
        public static string prenom;
        public static DateTime date_naiss;
        public static int idContrat;

        public chef(string Cin, string Nom, string Prenom, DateTime Date_naiss, string Echelle, int idcontrat)
        {
            cin = Cin;
            nom = Nom;
            prenom = Prenom;
            date_naiss = Date_naiss;
            idContrat = idcontrat;
        }
        public static DataTable affichChefInfo(string txt)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select  * from Chef where CIN='" + txt.Trim() + "'";
            Settings.cmd.Connection = Settings.cnx;

            Settings.da.SelectCommand = Settings.cmd;

            Settings.da.Fill(Settings.ds,"chef");


            if (Settings.ds.Tables["chef"].Rows.Count == 1)
            {
                return Settings.ds.Tables["chef"];
            }
            else
            {
                return null;
            }
            Settings.deconnecter();

        }
        public static bool checkIdentifiantChef(string txt, string mdp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select * from [login] where Cin_identifiant='" + txt.Trim() + "'and mdp='" + mdp.Trim() + "'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.rd = Settings.cmd.ExecuteReader();
            bool res = Settings.rd.HasRows;

            Settings.rd.Close();
            return res;
        }

        public static void removeEmpFequi(string cin_emp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "DELETE FROM Equipe WHERE cin_emp#='" + cin_emp + "'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.cmd.ExecuteNonQuery();
            Settings.deconnecter();
        }
        public static DataTable empCin()
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select CIN from employe ";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds, "employeCin");
            return Settings.ds.Tables["employeCin"];
        }
        public static void addEmpInEquipe(int id_equipe, string cin_chef, string emp_cin,Label lblres )
        {
            DataTable dt = empCin();
            foreach (DataRow dr in dt.Rows)
            {
                if (dr[0].ToString() != emp_cin)
                {
                    lblres.Text = "Ce Cin est introuvable ";

                }
                else
                {
                    Settings.Connecter();
                    Settings.cmd.CommandText = "insert into Equipe values (" + id_equipe + ",'" + cin_chef + "','" + emp_cin + "'); ";
                    Settings.cmd.Connection = Settings.cnx;
                    Settings.cmd.ExecuteNonQuery();
                    lblres.Text = "employe est ajouté";
                }

            }
          


        }
        public static void removeEmp(string cin_emp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "DELETE FROM employe WHERE CIN='" + cin_emp + "'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.cmd.ExecuteNonQuery();
        }

    }
}