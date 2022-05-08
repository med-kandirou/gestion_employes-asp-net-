using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Projet_Fin_Formation
{
    public class Settings
    {
        //PC10\SQLEXPRESS17
        //KAZZAMINE\SQLEXPRESS
        //DESKTOP-CP1TUD6\SQLEXPRESS
        public static SqlConnection cnx = new SqlConnection(@"Data Source=DESKTOP-CP1TUD6\SQLEXPRESS;Initial Catalog=Pff;Integrated Security=True");
        public static SqlCommand cmd = new SqlCommand();
        public static SqlDataReader rd;
   
        public static DataSet ds = new DataSet();


        public static SqlDataAdapter da = new SqlDataAdapter();

        public static void Connecter()
        {  
            if (cnx.State == ConnectionState.Closed || cnx.State == ConnectionState.Broken)
            {
                cnx.Open();
            }
        }
        public static void deconnecter()
        {
            if (cnx.State == ConnectionState.Open)
            {
                cnx.Close();
            }
        }
    }
}