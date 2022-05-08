<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageChef.Master" AutoEventWireup="true" CodeBehind="~/Chef/Equipe_Chef.aspx.cs" Inherits="Projet_Fin_Formation.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 194px;
        }
        .auto-style4 {
            width: 194px;
            height: 32px;
        }
        .auto-style5 {
            height: 32px;
        }
        .auto-style6 {
            width: 194px;
            height: 61px;
        }
        .auto-style7 {
            height: 61px;
        }
    </style>
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>

       Votre Equipes : <asp:DropDownList ID="ddlEquipes" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="id_eq" DataValueField="id_eq" OnSelectedIndexChanged="ddlEquipes_SelectedIndexChanged">
       </asp:DropDownList>
<br />
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT DISTINCT id_eq FROM Equipe WHERE (cin_chef# = @cin)">
           <SelectParameters>
               <asp:SessionParameter Name="cin" SessionField="cin" />
           </SelectParameters>
       </asp:SqlDataSource>
<br />
   
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="83px" Width="728px"  DataKeyNames="CIN" AllowPaging="True" OnDataBound="GridView1_DataBound">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
        <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
        <asp:BoundField DataField="echelle" HeaderText="echelle" SortExpression="echelle" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CBDelete" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" SelectCommand="SELECT employe.CIN, employe.Nom, employe.Prenom, employe.echelle FROM Equipe INNER JOIN employe ON Equipe.cin_emp# = employe.CIN WHERE (Equipe.id_eq IN (SELECT id_eq FROM Equipe AS Equipe_1 WHERE (cin_chef# = @cin))) AND (Equipe.id_eq = @ideq)">
    <SelectParameters>
        <asp:SessionParameter Name="cin" SessionField="cin" />
        <asp:ControlParameter ControlID="ddlEquipes" Name="ideq" PropertyName="SelectedValue" />
    </SelectParameters>
    </asp:SqlDataSource>
       <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Height="39px" OnClick="Button1_Click" OnClientClick="return confirm('Voulez-vous vraiment supprimer cette employe(s)');" Text="supprimer" Width="94px" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Height="39px" OnClick="btnAdd_Click" Text="Ajouter" Width="94px" />
       <br />

       <br />
       <br />
       <asp:Label ID="lblres" runat="server"></asp:Label>

       <br />
       <asp:Panel ID="pnlAdd" runat="server">
           <table class="w-100">
               <tr>
                   <td class="auto-style6">
                       &nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label1" runat="server" Text="CIN Employe"></asp:Label>
                       &nbsp; :</td>
                   <td class="auto-style7">
                       <asp:TextBox ID="txtcin" runat="server" CssClass="form-control"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style4">
                       &nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label2" runat="server" Text="Nom Employe"></asp:Label>
                       &nbsp;: </td>
                   <td class="auto-style5">
                       <asp:TextBox ID="txt" runat="server" CssClass="form-control"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style3">
                       <br />
                       <br />
                       <br />
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Button ID="btnTerminer" runat="server" CssClass="btn btn-success" Height="39px" OnClick="btnTerminer_Click"  Text="Terminer" Width="94px" />
                   </td>
                   <td>&nbsp;</td>
               </tr>
           </table>
       </asp:Panel>
       <br />
<br />
        </ContentTemplate> </asp:UpdatePanel>

</asp:Content>
