<%@ Page Title="" Language="C#" MasterPageFile="~/Master_dir.Master" AutoEventWireup="true" CodeBehind="~/directeur/HomeDirector.aspx.cs" Inherits="Projet_Fin_Formation.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #hometitle
        {
            text-align:center;
            letter-spacing:4px;
            color:blue;
        }
        DetailsView1
        {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 id="hometitle">Mes informations </h1>
    <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-striped table-hover" BorderColor="Black"  DataSourceID="SqlDataSource1" Height="86px" Width="759px">
    </asp:DetailsView>
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT * FROM [Directeur] WHERE ([CIN] = @CIN)">
        <SelectParameters>
            <asp:SessionParameter Name="CIN" SessionField="cin" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
