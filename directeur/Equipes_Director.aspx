<%@ Page Title="" Language="C#" MasterPageFile="~/Master_dir.Master" AutoEventWireup="true" CodeBehind="~/directeur/Equipes_Director.aspx.cs" Inherits="Projet_Fin_Formation.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

        Les Equipes : <asp:DropDownList ID="ddlEquipes" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="id_eq" DataValueField="id_eq" OnSelectedIndexChanged="ddlEquipes_SelectedIndexChanged">
       </asp:DropDownList>
        <br />
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT DISTINCT id_eq FROM Equipe">
       </asp:SqlDataSource>
        <br />
   
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="83px" Width="728px"  DataKeyNames="CIN" AllowPaging="True">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
        <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
        <asp:BoundField DataField="echelle" HeaderText="echelle" SortExpression="echelle" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT employe.CIN, employe.Nom, employe.Prenom, employe.echelle FROM Equipe INNER JOIN employe ON Equipe.cin_emp# = employe.CIN WHERE (Equipe.id_eq IN (SELECT id_eq FROM Equipe AS Equipe_1 WHERE(Equipe.id_eq = @ideq)))">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlEquipes" Name="ideq" PropertyName="SelectedValue" />
    </SelectParameters>
    </asp:SqlDataSource>
       
        <br />
        <asp:Button ID="btnaddequipe" runat="server" Height="38px" OnClick="btnaddequipe_Click" Text="Ajouter Equipe" Width="117px" />
       
       <br />

       <br />
       <br />
       

       
        </ContentTemplate> </asp:UpdatePanel>

</asp:Content>
