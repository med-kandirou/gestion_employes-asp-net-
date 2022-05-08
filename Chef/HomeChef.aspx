<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageChef.Master" AutoEventWireup="true" CodeBehind="~/Chef/HomeChef.aspx.cs" Inherits="Projet_Fin_Formation.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .auto-style3 {
            width: 100%;
            margin-top: 0px;
        }
        #hometitle
        {
            text-align:center;
            letter-spacing:4px;
            color:blue;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> <ContentTemplate> 
        <h1 id="hometitle">Mes informations </h1><br />

        <table class="auto-style3">
            <tr>
                <td Width="10%">&nbsp;</td>
                <td>                          
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT Contrat.Id_Contrat, Contrat.Type, Contrat.salaire, Contrat.Date_debut_c, Contrat.Date_fin_c, Chef.CIN, Chef.Nom, Chef.Date_Nais, Chef.id_contrat# FROM Contrat INNER JOIN Chef ON Contrat.Id_Contrat = Chef.id_contrat# WHERE (Contrat.CIN = @cin)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CIN" SessionField="cin" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        <asp:DetailsView ID="DVcontrat" runat="server" Height="212px" Width="815px" CssClass="table table-striped table-hover" BorderColor="Black" AutoGenerateRows="False" DataKeyNames="Id_Contrat,CIN" DataSourceID="SqlDataSource1" style="margin-left: 25px; margin-bottom: 300px;">
            <Fields>
                <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
                <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                <asp:BoundField DataField="Date_Nais" HeaderText="Date Naissance" SortExpression="Date_Nais" />
                <asp:BoundField DataField="Id_Contrat" HeaderText="Id Contrat" ReadOnly="True" SortExpression="Id_Contrat" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="salaire" HeaderText="salaire" SortExpression="salaire" />
                <asp:BoundField DataField="Date_debut_c" HeaderText="Date debut contrat" SortExpression="Date_debut_c" />
                <asp:BoundField DataField="Date_fin_c" HeaderText="Date fin contrat" SortExpression="Date_fin_c"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
                                            
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </ContentTemplate> </asp:UpdatePanel>
</asp:Content>
