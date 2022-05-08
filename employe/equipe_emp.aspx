<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageEmp.Master" AutoEventWireup="true" CodeBehind="~/employe/equipe_emp.aspx.cs" Inherits="Projet_Fin_Formation.equipe_emp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

    &nbsp;Id d'equipe :  <asp:Label ID="lblIdEquipe" runat="server" Text="Label" CssClass="label label-default" ></asp:Label>
    <br />
    <br />
    chef de projet :  <asp:Label ID="lblNomChef" runat="server" Text="Label"  CssClass="label label-default"></asp:Label>
&nbsp;<asp:Label ID="lblPrenomChef" runat="server" Text="Label" CssClass="label label-default"></asp:Label>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="83px" Width="728px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT employe.Nom, employe.Prenom, employe.echelle FROM Equipe INNER JOIN employe ON Equipe.cin_emp# = employe.CIN WhERE id_eq IN (SELECT id_eq FROM equipe WHERE cin_emp#=@cin)">
    <SelectParameters>
        <asp:SessionParameter Name="cin" SessionField="cin" />
    </SelectParameters>
    </asp:SqlDataSource>
<br />
        </ContentTemplate> </asp:UpdatePanel>
</asp:Content>
