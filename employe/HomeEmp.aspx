<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageEmp.Master" AutoEventWireup="true" CodeBehind="~/employe/HomeEmp.aspx.cs" Inherits="Projet_Fin_Formation.testMaster" %>
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

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1" >
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> <ContentTemplate>
                          <h1 id="hometitle">Mes informations </h1><br />
                                <table class="auto-style3">
                                    <tr>
                                        <td Width="10%">&nbsp;
                                        </td>
                                        <td>                          
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT employe.CIN, employe.Nom, employe.Prenom, employe.Date_Nais, employe.echelle, Contrat.Id_Contrat, Contrat.Type, Contrat.salaire, Contrat.Date_debut_c, Contrat.Date_fin_c FROM employe INNER JOIN Contrat ON employe.id_contrat# = Contrat.Id_Contrat WHERE (employe.CIN = @CIN)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="CIN" SessionField="cin" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                <asp:DetailsView ID="DVcontrat" runat="server" Height="212px" Width="815px" CssClass="table table-striped table-hover" BorderColor="Black" AutoGenerateRows="False" DataKeyNames="CIN,Id_Contrat" DataSourceID="SqlDataSource1" style="margin-left: 25px; margin-bottom: 300px;">
                                    <Fields>
                                        <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
                                        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                                        <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
                                        <asp:BoundField DataField="Date_Nais" HeaderText="Date Naissance" SortExpression="Date_Nais" />
<asp:BoundField DataField="echelle" HeaderText="echelle" SortExpression="echelle"></asp:BoundField>
                                        <asp:BoundField DataField="Id_Contrat" HeaderText="Id Contrat" ReadOnly="True" SortExpression="Id_Contrat" />
                                        <asp:BoundField DataField="Type" HeaderText="Type Contrat" SortExpression="Type" />
                                        <asp:BoundField DataField="salaire" HeaderText="Salaire" SortExpression="salaire" />
                                        <asp:BoundField DataField="Date_debut_c" HeaderText="Date debut contrat" SortExpression="Date_debut_c" />
                                        <asp:BoundField DataField="Date_fin_c" HeaderText="Date fin contrat" SortExpression="Date_fin_c" />
                                    </Fields>
                                </asp:DetailsView>
                                            
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate> </asp:UpdatePanel>
                        </asp:Content>


