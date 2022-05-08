using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Projet_Fin_Formation
{
    public class Directeur
    {
        public static DataTable affichDirInfo(string txt)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select  * from Directeur where CIN='" + txt.Trim() + "'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds, "directeur");


            if (Settings.ds.Tables["directeur"].Rows.Count == 1)
            {
                Settings.deconnecter();
                return Settings.ds.Tables["directeur"];
            }
            else
            {
                Settings.deconnecter();
                return null;
            }
            

        }
        public static bool checkIdentifiantDirecteur(string txt, string mdp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select * from [login] where Cin_identifiant='" + txt.Trim() + "'and mdp='" + mdp.Trim() + "'";
            Settings.cmd.Connection = Settings.cnx;
            Settings.rd = Settings.cmd.ExecuteReader();
            bool res = Settings.rd.HasRows;

            Settings.rd.Close();
            return res;
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
        public static DataTable empChef()
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "select CIN from chef ";
            Settings.cmd.Connection = Settings.cnx;
            Settings.da.SelectCommand = Settings.cmd;
            Settings.da.Fill(Settings.ds, "ChefCin");
            return Settings.ds.Tables["ChefCin"];
        }
        public static void addEmpInEquipe(int id_equipe, string cin_chef, string emp_cin, Label lbl)
        {

            Settings.Connecter();
            Settings.cmd.CommandText = "insert into equipe values(" + id_equipe + ",'" + cin_chef + "','" + emp_cin + "')";
            Settings.cmd.Connection = Settings.cnx;
            DataTable dt = empCin();
            foreach (DataRow dr in dt.Rows)
            {
                if (dr.ToString() == emp_cin)
                {
                    Settings.cmd.ExecuteNonQuery();
                    lbl.Text = "employe a été ajouter";
                }
                else
                {
                    lbl.Text = "ce cin n'est pas trouvable \n verifier les information";
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
        public static void ajouteEquipe(int idEquipe,string cinchef,string cinemp)
        {
            Settings.Connecter();
            Settings.cmd.CommandText = "insert into Equipe values ("+ idEquipe + ",'"+ cinchef + "','"+ cinemp + "'); ";
            Settings.cmd.Connection = Settings.cnx;
            Settings.cmd.ExecuteNonQuery();
        }
    }
}