<%@ Page Title="" Language="C#" MasterPageFile="~/Master_dir.Master" AutoEventWireup="true" CodeBehind="ajoute_equipe.aspx.cs" Inherits="Projet_Fin_Formation.directeur.ajoute_equipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <asp:Label ID="Label1" runat="server" Text="Identifiant d'équipe :"></asp:Label><asp:TextBox ID="Id" runat="server" Height="22px" Width="152px"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Choisir un chef :"></asp:Label><br />
    <asp:GridView ID="GridChef" runat="server" AutoGenerateColumns="False" DataKeyNames="CIN" DataSourceID="SqlDatachef" Height="105px" Width="615px" OnRowDataBound="GridChef_RowDataBound" OnSelectedIndexChanged="GridChef_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
            <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
            <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
            <asp:BoundField DataField="Date_Nais" HeaderText="Date Nais" SortExpression="Date_Nais" />
        </Columns>
        <SelectedRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDatachef" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT [CIN], [Prenom], [Nom], [Date_Nais], [id_contrat#] AS column1 FROM [Chef]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Choisir les employés :"></asp:Label><br />
    <asp:GridView ID="GridEmp" runat="server" AutoGenerateColumns="False" DataKeyNames="CIN" DataSourceID="SqlDataemploye" Width="620px">
        <Columns>
            <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
            <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
            <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
            <asp:BoundField DataField="Date_Nais" HeaderText="Date_Nais" SortExpression="Date_Nais" />
            <asp:BoundField DataField="echelle" HeaderText="echelle" SortExpression="echelle" />
            <asp:BoundField DataField="id_contrat#" HeaderText="Contrat" SortExpression="id_contrat#" />
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataemploye" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT * FROM [employe]"></asp:SqlDataSource>
        <br />
        <br />
    <asp:Button ID="btnadd" runat="server" Height="33px" OnClick="btnadd_Click" Text="Ajouter" Width="104px" />
        <br />
    <br />
        <asp:Label ID="labelSuccc" style="color:chartreuse;font-size:25px;letter-spacing:3px;" runat="server" Text="Label">Equipe ajouté</asp:Label>
    <br />


        </ContentTemplate> </asp:UpdatePanel>
</asp:Content>
