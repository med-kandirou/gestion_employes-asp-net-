<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageChef.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="~/Chef/EmployeList_chef.aspx.cs" Inherits="Projet_Fin_Formation.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> <ContentTemplate>
    <table class="w-100">
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped" DataKeyNames="CIN" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
                    <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                    <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
                    <asp:BoundField DataField="Date_Nais" HeaderText="Date Naissance" SortExpression="Date_Nais" />
                    <asp:BoundField DataField="echelle" HeaderText="echelle" SortExpression="echelle" />
                    <asp:BoundField DataField="id_contrat#" HeaderText="id contrat" SortExpression="id_contrat#" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" DeleteCommand="DELETE FROM [employe] WHERE [CIN] = @CIN" InsertCommand="INSERT INTO [employe] ([CIN], [Nom], [Prenom], [Date_Nais], [echelle], [id_contrat#]) VALUES (@CIN, @Nom, @Prenom, @Date_Nais, @echelle, @column1)" SelectCommand="SELECT * FROM [employe]" UpdateCommand="UPDATE [employe] SET [Nom] = @Nom, [Prenom] = @Prenom, [Date_Nais] = @Date_Nais, [echelle] = @echelle, [id_contrat#] = @column1 WHERE [CIN] = @CIN">
                <DeleteParameters>
                    <asp:Parameter Name="CIN" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CIN" Type="String" />
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter DbType="Date" Name="Date_Nais" />
                    <asp:Parameter Name="echelle" Type="String" />
                    <asp:Parameter Name="column1" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter DbType="Date" Name="Date_Nais" />
                    <asp:Parameter Name="echelle" Type="String" />
                    <asp:Parameter Name="column1" Type="Int32" />
                    <asp:Parameter Name="CIN" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
        </ContentTemplate></asp:UpdatePanel>
</asp:Content>
