<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageEmp.Master" AutoEventWireup="true" CodeBehind="Projet_emp.aspx.cs" Inherits="Projet_Fin_Formation.employe.Projet_emp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <br />
    Categorie : 
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="designation" DataValueField="designation" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT DISTINCT [designation] FROM [projet]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSAllprjt" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT Equipe.cin_emp#, projet.designation, projet.Date_debut_p, projet.Date_fin_p, Entrep_cible.Nom_entrep, Entrep_cible.adresse FROM Entrep_cible INNER JOIN projet ON Entrep_cible.id_projet# = projet.id_projet INNER JOIN Equipe ON projet.id_eq# = Equipe.id_eq WHERE (Equipe.cin_emp# =@cin)">
        <SelectParameters>
            <asp:SessionParameter Name="cin" SessionField="cin" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSFilterPrjt" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT id_projet,id_eq# as 'Equipe',designation,Date_debut_p as 'Date Debut',Date_fin_p as 'Date Fin' FROM projet INNER JOIN Equipe ON projet.id_eq# = Equipe.id_eq where designation=@design AND Equipe.cin_emp# =@cin_emp">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="design" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="cin_emp" SessionField="cin" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" AutoGenerateColumns="False" DataSourceID="SDSAllprjt" EmptyDataText="aucun trove">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="cin_emp#" HeaderText="cin_emp#" SortExpression="cin_emp#" />
            <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
            <asp:BoundField DataField="Date_debut_p" HeaderText="Date_debut_p" SortExpression="Date_debut_p" />
            <asp:BoundField DataField="Date_fin_p" HeaderText="Date_fin_p" SortExpression="Date_fin_p" />
            <asp:BoundField DataField="Nom_entrep" HeaderText="Nom_entrep" SortExpression="Nom_entrep" />
            <asp:BoundField DataField="adresse" HeaderText="adresse" SortExpression="adresse" />
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
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped" DataKeyNames="id_projet" DataSourceID="SDSFilterPrjt" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_projet" HeaderText="id_projet" ReadOnly="True" SortExpression="id_projet" />
            <asp:BoundField DataField="Equipe" HeaderText="Equipe" SortExpression="Equipe" />
            <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
            <asp:BoundField DataField="Date Debut" HeaderText="Date Debut" SortExpression="Date Debut" />
            <asp:BoundField DataField="Date Fin" HeaderText="Date Fin" SortExpression="Date Fin" />
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
        </ContentTemplate></asp:UpdatePanel>
</asp:Content>
