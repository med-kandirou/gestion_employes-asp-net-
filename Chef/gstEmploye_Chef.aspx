<%@ Page Title="" Language="C#" MasterPageFile="~/Master_pageChef.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="~/Chef/gstEmploye_Chef.aspx.cs" Inherits="Projet_Fin_Formation.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style4 {
        width: 641px;
    }
        .auto-style5 {
            width: 641px;
            height: 27px;
        }
        .auto-style6 {
            height: 27px;
        }
        .auto-style7 {
            width: 641px;
            height: 66px;
        }
        .auto-style8 {
            height: 66px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <table class="w-100">
    <tr>
        <td class="auto-style7">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PffConnectionString %>" DeleteCommand="DELETE FROM [employe] WHERE [CIN] = @CIN" InsertCommand="INSERT INTO [employe] ([CIN], [Nom], [Prenom], [Date_Nais], [echelle], [id_contrat#]) VALUES (@CIN, @Nom, @Prenom, @Date_Nais, @echelle, @column1)" SelectCommand="SELECT * FROM [employe] WHERE ([CIN] = @CIN)" UpdateCommand="UPDATE [employe] SET [Nom] = @Nom, [Prenom] = @Prenom, [Date_Nais] = @Date_Nais, [echelle] =@echelle WHERE [CIN] = @CIN">
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
                <SelectParameters>
                    <asp:QueryStringParameter Name="CIN" QueryStringField="cin_emp" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nom" Type="String" />
                    <asp:Parameter Name="Prenom" Type="String" />
                    <asp:Parameter DbType="Date" Name="Date_Nais" />
                    <asp:Parameter Name="echelle" />
                    <asp:Parameter Name="CIN" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="&lt;&lt;" />
            <br />

            <br />
        </td>
        <td class="auto-style8"></td>
    </tr>
    <tr>
        <td class="auto-style4">
          
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="table table-striped table-hover" DataKeyNames="CIN" DataSourceID="SqlDataSource1" Height="297px" Width="641px" >
                <Fields>
                    <asp:BoundField DataField="CIN" HeaderText="CIN" ReadOnly="True" SortExpression="CIN" />
                    <asp:TemplateField HeaderText="Nom" SortExpression="Nom">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnom" runat="server" CssClass="auto-style5" Height="20px" Text='<%# Bind("Nom") %>' Width="487px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nom") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prenom" SortExpression="Prenom">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtprenom" runat="server" CssClass="auto-style5" Height="20px" Text='<%# Bind("Prenom") %>' Width="487px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Prenom") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Prenom") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Naissance" SortExpression="Date_Nais">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdateNaiss" runat="server" CssClass="auto-style5" Height="20px" Text='<%# Bind("Date_Nais") %>' Width="487px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date_Nais") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date_Nais") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="echelle" SortExpression="echelle">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEchelle" runat="server" CssClass="auto-style5" Height="20px" Text='<%# Bind("echelle") %>' Width="487px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("echelle") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("echelle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_contrat#" HeaderText="id contrat " SortExpression="id_contrat#" />
                </Fields>
            </asp:DetailsView>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5">
            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-outline-danger" OnClick="btnDelete_Click" Text="supprimer" OnClientClick="return confirm(&quot;Voulez-vous vraiment supprimer cette employe?&quot;);" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-outline-secondary" Text="Modifier" OnClick="btnupdate_Click" />
        </td>
        <td class="auto-style6"></td>
    </tr>
    <tr>
        <td class="auto-style4">
            <asp:Button ID="btnconfirm" runat="server" CssClass="btn btn-outline-success" OnClick="btnconfirm_Click" OnClientClick="return confirm(&quot;Voulez-vous enregistrer les modification?&quot;);" Text="Confirmer" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancl" runat="server" CssClass="btn  btn-outline-danger" OnClick="Button3_Click" style="margin-left: 0" Text="Cancel" Width="78px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
            </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
